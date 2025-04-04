<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;

class AuthController extends Controller
{
    /**
     * Show the login page.
     *
     * @return \Inertia\Response
     */
    public function login(): Response
    {
        return Inertia::render('Auth/LoginPage');
    }

    /**
     * Show the registration page.
     *
     * @return \Inertia\Response
     */
    public function register(): Response
    {
        return Inertia::render('Auth/RegisterPage');
    }

    public function handleLogin(): Response
    {

    }


}
