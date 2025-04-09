<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\BrandController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\InvoiceController;
use App\Http\Controllers\PasswordResetController;
use App\Http\Controllers\ProductController;
use App\Mail\EmailVerificationOtp;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;


Route::get('/', [HomeController::class, 'index'])->name('home');

Route::middleware('guest')->group(function () {
    // Authentication Routes
    Route::get('register', [AuthController::class, 'showRegister'])->name('register.show');
    Route::post('register', [AuthController::class, 'register'])->name('register');

    Route::get('login', [AuthController::class, 'showLogin'])->name('login');
    Route::post('login', [AuthController::class, 'login']);

    // Email Verification Routes
    Route::get('email/verify', [AuthController::class, 'showVerifyEmail'])->name('verification.notice');
    Route::post('email/verify/{email}', [AuthController::class, 'verifyEmail'])
        ->name('verification.verify');
    Route::post('email/resend', [AuthController::class, 'resendOtp'])->name('verification.resend');

    // Password Reset Routes
    Route::get('forgot-password', [PasswordResetController::class, 'showRequestOtp'])->name('password.request');
    Route::post('forgot-password', [PasswordResetController::class, 'sendOtp'])->name('password.email');

    Route::get('verify-reset-otp', [PasswordResetController::class, 'showVerifyOtp'])->name('password.verify-otp');
    Route::post('verify-reset-otp', [PasswordResetController::class, 'verifyOtp'])->name('password.verify');

    Route::get('reset-password', [PasswordResetController::class, 'showResetPassword'])->name('password.reset');
    Route::post('reset-password', [PasswordResetController::class, 'resetPassword'])->name('password.update');
});

Route::middleware(['auth'])->group(function () {
    Route::post('logout', [AuthController::class, 'logout'])->name('logout');

    Route::get('me', [AuthController::class, 'me']);

    // Dashboard
    Route::get('/dashboard', function () {
        return Inertia::render('Dashboard/Dashboard');
    })->name('dashboard');

    // Brand Routes 
    Route::prefix('brands')->name('brands.')->group(function () {
        Route::get('/', [BrandController::class, 'index'])->name('index');
        Route::get('/create', [BrandController::class, 'create'])->name('create');
        Route::post('/', [BrandController::class, 'store'])->name('store');
        Route::get('/{id}/edit', [BrandController::class, 'edit'])->name('edit');
        Route::put('/{id}', [BrandController::class, 'update'])->name('update');
        Route::get('/delete/{id}', [BrandController::class, 'destroy'])->name('destroy');
    });

    // Category Routes 
    Route::prefix('categories')->name('categories.')->group(function () {
        Route::get('/', [CategoryController::class, 'index'])->name('index');
        Route::get('/create', [CategoryController::class, 'create'])->name('create');
        Route::post('/', [CategoryController::class, 'store'])->name('store');
        Route::get('/{id}/edit', [CategoryController::class, 'edit'])->name('edit');
        Route::put('/{id}', [CategoryController::class, 'update'])->name('update');
        Route::get('/delete/{id}', [CategoryController::class, 'destroy'])->name('destroy');
    });

    // Customer Routes 
    Route::prefix('customers')->name('customers.')->group(function () {
        Route::get('/', [CustomerController::class, 'index'])->name('index');
        Route::get('/create', [CustomerController::class, 'create'])->name('create');
        Route::post('/', [CustomerController::class, 'store'])->name('store');
        Route::get('/{id}/edit', [CustomerController::class, 'edit'])->name('edit');
        Route::put('/{id}', [CustomerController::class, 'update'])->name('update');
        Route::get('/delete/{id}', [CustomerController::class, 'destroy'])->name('destroy');
    });

    // Product Routes 
    Route::prefix('products')->name('products.')->group(function () {
        Route::get('/', [ProductController::class, 'index'])->name('index');
        Route::get('/create', [ProductController::class, 'create'])->name('create');
        Route::post('/', [ProductController::class, 'store'])->name('store');
        Route::get('/{id}/edit', [ProductController::class, 'edit'])->name('edit');
        Route::put('/{id}', [ProductController::class, 'update'])->name('update');
        Route::get('/delete/{id}', [ProductController::class, 'destroy'])->name('destroy');
    });

    // Invoice Routes 
    Route::prefix('invoices')->name('invoices.')->group(function () {
        Route::get('/', [InvoiceController::class, 'index'])->name('index');
        Route::get('/create', [InvoiceController::class, 'create'])->name('create');
        Route::post('/', [InvoiceController::class, 'store'])->name('store');
        Route::get('/{id}/edit', [InvoiceController::class, 'edit'])->name('edit');
        Route::put('/{id}', [InvoiceController::class, 'update'])->name('update');
        Route::get('/delete/{id}', [InvoiceController::class, 'destroy'])->name('destroy');
    });

});


