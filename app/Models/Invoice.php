<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Invoice extends Model
{
    /** @use HasFactory<\Database\Factories\InvoiceFactory> */
    use HasFactory;

    protected $fillable = [
        'invoice_number',
        'customer_id',
        'total_amount',
        'discount',
        'vat',
        'payable',
        'status',
        'user_id'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function customer()
    {
        return $this->belongsTo(Customer::class);
    }

    // Relationship to the InvoiceProduct model (Many-to-many via pivot table)
    public function products()
    {
        return $this->belongsToMany(Product::class, 'invoice_products')
            ->withPivot('quantity', 'sale_price')
            ->withTimestamps();
    }
}
