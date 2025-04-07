<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\PasswordResetController;
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
    Route::get('/dashboard', function () {
        return Inertia::render('Dashboard');
    })->name('dashboard');
});


