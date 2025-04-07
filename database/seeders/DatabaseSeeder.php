<?php

namespace Database\Seeders;

use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        User::factory()->create([
            'name' => 'Test User 1',
            'email' => 'test1@example.com',
            'password' => bcrypt('pass1234'),
            'mobile' => '1234567890',
            'otp' => 123456,
            'remember_token' => \Str::random(10),
        ]);

        User::factory()->create([
            'name' => 'Test User 2',
            'email' => 'test2@example.com',
            'password' => bcrypt('pass12345'),
            'mobile' => '9876543210',
            'otp' => 567809,
            'remember_token' => \Str::random(10),
        ]);

        $this->call([
            CustomerSeeder::class,
            BrandSeeder::class,
            CategorySeeder::class,
            ProductSeeder::class,
            InvoiceSeeder::class,
        ]);
    }
}
