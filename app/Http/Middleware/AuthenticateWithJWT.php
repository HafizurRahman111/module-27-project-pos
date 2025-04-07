<?php

namespace App\Http\Middleware;

use Closure;
use App\Facades\FirebaseJWT;
use Exception;
use Illuminate\Support\Facades\Auth;

class AuthenticateWithJWT
{
    public function handle($request, Closure $next)
    {
        $token = $request->session()->get('jwt_token');

        if (!$token) {
            return redirect()->route('login');
        }

        try {
            $decoded = FirebaseJWT::decode($token);

            if (isset($decoded->reset_password) && $decoded->reset_password === true) {
                return redirect()->route('login')->with('error', 'Invalid access');
            }

            // Authenticate the user
            Auth::loginUsingId($decoded->sub);

        } catch (Exception $e) {
            $request->session()->forget('jwt_token');
            return redirect()->route('login')->with('error', 'Session expired. Please login again.');
        }

        return $next($request);
    }
}