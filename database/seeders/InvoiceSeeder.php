<?php

namespace Database\Seeders;

use App\Models\Invoice;
use App\Models\InvoiceProduct;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class InvoiceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $invoices = Invoice::factory(10)->create();

        $invoices->each(function ($invoice) {
            InvoiceProduct::factory(3)->create([
                'invoice_id' => $invoice->id,
            ]);
        });
    }
}
