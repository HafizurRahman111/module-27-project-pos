<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Inertia\Inertia;

class SiteController extends Controller
{
    public function index()
    {
        return Inertia::render('Home');
    }
}
