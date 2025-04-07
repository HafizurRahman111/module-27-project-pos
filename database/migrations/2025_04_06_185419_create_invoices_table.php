<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('invoices', function (Blueprint $table) {
            $table->id();
            $table->string('invoice_number')->unique();
            $table->unsignedBigInteger('customer_id');
            $table->decimal('total_amount', 10, 2);
            $table->decimal('discount', 10, 2);
            $table->decimal('vat', 10, 2);
            $table->decimal('payable', 10, 2);
            $table->enum('status', ['pending', 'paid', 'overdue'])->default('pending');
            $table->unsignedBigInteger('user_id');
            $table->timestamps();

            $table->foreign('user_id')->references('id')->on('users')
                ->cascadeOnUpdate()->restrictOnDelete();
            $table->foreign('customer_id')->references('id')->on('customers')
                ->cascadeOnUpdate()->restrictOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('invoices');
    }
};
