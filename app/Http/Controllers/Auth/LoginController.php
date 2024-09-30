<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{

    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    public function getUser()
    {
        return $request->user();
    }
    
    public function show() 
    {
        return view('auth.login');
    }

    public function login(Request $request)
    {
        
        $credentials = [
            'email' => $request->input('email'),
            'password' => $request->input('password')
        ];

        if (Auth::attempt($credentials)) {
            $user = Auth::user();

            if ($user->admin) return redirect()->route('admin projects', $user->id);
            else return redirect()->route('user projects', $user->id);
        }

        return redirect()->route('login');
    }

    public function logout(Request $request)
    {
        Auth::logout();
        return redirect()->route('home');
    }
    
}
