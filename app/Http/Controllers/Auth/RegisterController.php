<?php

namespace App\Http\Controllers\Auth;

use App\Models\User;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;

class RegisterController extends Controller
{

    public function __construct()
    {
        $this->middleware('guest');
    }

    public function show()
    {
        return view('auth.register');
    }

    public function create(Request $request)
    {
        $user = new User();

        $validated = $request->validate([
            'email' => 'required|string|email|max:255|unique:App\Models\User,email',
            'name' => 'required|string|max:255',
            'password' => 'required|string|min:6|confirmed',
            'account' => 'required'
        ]);
        
        $user->name = $request->input('name');
        $user->email = $request->input('email');
        $user->password = bcrypt($request->input('password'));
        if ($request->input('account') == 'admin') $user->admin = true;
        else $user->admin = false;
        $user->save();

        $credentials = [
            'email' => $request->input('email'),
            'password' => $request->input('password')
        ];

        if (Auth::attempt($credentials)){
            if ($user->admin){ 
                return redirect()->route('admin projects', $user->id);
            }
            else{ 
                return redirect()->route('user projects', $user->id);
            }
        }

        return redirect()->route('home');
    }
}