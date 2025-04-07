<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use App\Mail\PasswordResetOtp;
use App\Models\User;
use Carbon\Carbon;
use App\Facades\FirebaseJWT;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Inertia\Inertia;

class PasswordResetController extends Controller
{
    public function showRequestOtp()
    {
        return Inertia::render('Auth/ForgotPassword');
    }

    public function sendOtp(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|exists:users,email',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->with('error', 'Invalid email');
        }

        $user = User::where('email', $request->email)->first();
        $otp = rand(100000, 999999);

        $user->password_reset_otp = $otp;
        $user->password_reset_otp_expires_at = Carbon::now()->addMinutes(30);
        $user->save();

        Mail::to($user->email)->send(new PasswordResetOtp($otp));

        return redirect()->route('password.verify-otp')->with('email', $user->email);
    }

    public function showVerifyOtp()
    {
        return Inertia::render('Auth/VerifyOtp', [
            'email' => session('email')
        ]);
    }

    public function verifyOtp(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|exists:users,email',
            'otp' => 'required|numeric',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->with('error', 'Invalid OTP');
        }

        $user = User::where('email', $request->email)
            ->where('password_reset_otp', $request->otp)
            ->where('password_reset_otp_expires_at', '>', Carbon::now())
            ->first();

        if (!$user) {
            return redirect()->back()->with('error', 'Invalid or expired OTP');
        }

        $payload = [
            'iss' => url('/'),
            'iat' => time(),
            'exp' => time() + (30 * 60),
            'nbf' => time(),
            'jti' => uniqid('', true),
            'sub' => $user->id,
            'reset_password' => true
        ];

        $token = FirebaseJWT::encode($payload);

        return redirect()->route('password.reset')->with([
            'reset_token' => $token,
            'email' => $user->email
        ]);
    }

    public function showResetPassword()
    {
        return Inertia::render('Auth/ResetPassword', [
            'email' => session('email'),
            'reset_token' => session('reset_token')
        ]);
    }

    public function resetPassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|exists:users,email',
            'password' => 'required|confirmed|min:8',
            'reset_token' => 'required'
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator);
        }

        try {
            $decoded = FirebaseJWT::decode($request->reset_token);

            if ($decoded->sub !== User::where('email', $request->email)->first()->id) {
                return redirect()->back()->with('error', 'Invalid token for this user');
            }

            if (!isset($decoded->reset_password) || $decoded->reset_password !== true) {
                return redirect()->back()->with('error', 'Invalid token type for password reset');
            }

            $user = User::find($decoded->sub);
            $user->password = Hash::make($request->password);
            $user->password_reset_otp = null;
            $user->password_reset_otp_expires_at = null;
            $user->save();

            return redirect()->route('login')->with('success', 'Password reset successfully. You can now login.');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'Invalid or expired reset token');
        }
    }
}