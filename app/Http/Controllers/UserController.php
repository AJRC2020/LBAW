<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

use App\Models\User;

class UserController extends Controller
{
    public function show($id) 
    {
        $user = User::find($id);
        if (!Auth::check()){
            return redirect()->route('home');
        }
        return view('pages.profile', ['user' => $user]);
    }

    public function list($id)
    {
        $user = User::find($id);
        if (!Auth::check()){
            return redirect()->route('home');
        }
        return view('pages.user_projects', ['user' => $user]);
    }

    public function list_admin($id) {
        $user = User::find($id);
        if (!Auth::check()){
            return redirect()->route('home');
        }
        return view('pages.admin_projects', ['user' => $user]);
    }

    public function list_all($id) {
        $user = User::find($id);
        if (!Auth::check()){
            return redirect()->route('home');
        }
        return view('pages.users', ['user' => $user]);
    }

    public function update(Request $request, $id) {
        $user = User::find($id);

        $validated = $request->validate([
            'password' => 'required|string|min:6',
            'new_password' => 'required|string|min:6|confirmed',
        ]);

        $credentials = [
            'email' => $user->email,
            'password' => $request->input('password')
        ];

        if (Auth::attempt($credentials)) {
            $user->password = bcrypt($request->input('new_password'));
            $user->save();
            return redirect()->route('user projects', $user->id);
        }

        return redirect()->route('user', $user->id);
    }

    public function delete($id) {
        $user = User::find($id);
        if (!Auth::check()){
            return redirect()->route('home');
        }

        $user->delete();

        return redirect()->route('users', Auth::id());
    }
}