<?php

namespace App\Http\Controllers;

use App\Models\Invoice;
use App\Models\Customer;
use App\Models\Product;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Str;

class InvoiceController extends Controller
{
    /**
     * Display a listing of invoices.
     */
    public function index()
    {
        $invoices = Invoice::with(['customer', 'user'])->get();
        return Inertia::render('Dashboard/Invoice/Index', ['invoices' => $invoices]);
    }

    /**
     * Show the form for creating a new invoice.
     */
    public function create()
    {
        return Inertia::render('Invoices/Create', [
            'customers' => Customer::all(),
            'products' => Product::all(),
            'defaultInvoiceNumber' => 'INV-' . Str::upper(Str::random(6))
        ]);
    }

    /**
     * Store a newly created invoice.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'invoice_number' => 'required|string|unique:invoices',
            'customer_id' => 'required|exists:customers,id',
            'products' => 'required|array|min:1',
            'products.*.id' => 'required|exists:products,id',
            'products.*.quantity' => 'required|integer|min:1',
            'discount' => 'nullable|numeric|min:0|max:100',
            'vat' => 'nullable|numeric|min:0|max:100',
            'status' => 'required|in:pending,paid,overdue',
        ]);

        // Calculate totals
        $subtotal = collect($validated['products'])->sum(function ($product) {
            return $product['quantity'] * Product::find($product['id'])->price;
        });

        $discountAmount = $subtotal * ($validated['discount'] / 100);
        $vatAmount = ($subtotal - $discountAmount) * ($validated['vat'] / 100);

        $invoice = Invoice::create([
            'invoice_number' => $validated['invoice_number'],
            'customer_id' => $validated['customer_id'],
            'total_amount' => $subtotal,
            'discount' => $discountAmount,
            'vat' => $vatAmount,
            'payable' => $subtotal - $discountAmount + $vatAmount,
            'status' => $validated['status'],
            'user_id' => auth()->id()
        ]);

        // Attach products with pivot data
        $productsData = [];
        foreach ($validated['products'] as $product) {
            $productModel = Product::find($product['id']);
            $productsData[$product['id']] = [
                'quantity' => $product['quantity'],
                'sale_price' => $productModel->price
            ];
        }

        $invoice->products()->attach($productsData);

        return redirect()->route('invoices.index')
            ->with('success', 'Invoice created successfully.');
    }

    /**
     * Display the specified invoice.
     */
    public function show(Invoice $invoice)
    {
        $invoice->load(['customer', 'user', 'products']);

        return Inertia::render('Invoices/Show', [
            'invoice' => $invoice,
            'products' => $invoice->products->map(function ($product) {
                return [
                    'id' => $product->id,
                    'name' => $product->name,
                    'quantity' => $product->pivot->quantity,
                    'unit_price' => $product->pivot->sale_price,
                    'total' => $product->pivot->quantity * $product->pivot->sale_price
                ];
            })
        ]);
    }

    /**
     * Update the specified invoice.
     */
    public function update(Request $request, Invoice $invoice)
    {
        $validated = $request->validate([
            'status' => 'required|in:pending,paid,overdue',
        ]);

        $invoice->update($validated);

        return redirect()->back()
            ->with('success', 'Invoice status updated successfully.');
    }

    /**
     * Remove the specified invoice.
     */
    public function destroy($id)
    {
        $invoice = Invoice::findOrFail($id);

        $invoice->products()->detach();
        $invoice->delete();

        return Inertia::location(route('invoices.index'));
    }

}