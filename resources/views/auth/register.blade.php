@extends('layouts.reg')

@section('title', 'Register')

@section('content')
<form method="POST" action="{{ route('register') }}">
  {{ csrf_field() }}

  <div class="register-div1">
    <p class="register-div1-title">Register</p>
    <p class="register-div1-usernamepassword">Email</p>
    <input class="register-div1-input1" placeholder="Email" id="email" type="email" name="email" value="{{ old('email') }}" required>
    @if ($errors->has('email'))
      <span class="error">
          {{ $errors->first('email') }}
      </span>
    @endif
    <p class="register-div1-usernamepassword">Username</p>
    <input class="register-div1-input1" placeholder="Username" id="name" type="text" name="name" value="{{ old('name') }}" required autofocus>
    @if ($errors->has('name'))
      <span class="error">
          {{ $errors->first('name') }}
      </span>
    @endif
    <p class="register-div1-usernamepassword">Admin or Normal account?</p>
    <input class="register-div1-input2" id="admin" type="radio" name="account" value="admin" required>Admin
    <input class="register-div1-input2" id="normal" type="radio" name="account" value="normal" required>Normal
    @if ($errors->has('account'))
      <span class="error">
          {{ $errors->first('account') }}
      </span>
    @endif
    <p class="register-div1-usernamepassword">Password</p>
    <input class="register-div1-input1" placeholder="Password" id="password" type="password" name="password" required>
    @if ($errors->has('password'))
      <span class="error">
          {{ $errors->first('password') }}
      </span>
    @endif
    <p class="register-div1-usernamepassword">Repeat Password</p>
    <input class="register-div1-input1" placeholder="Repeat Password" id="password_confirmation" type="password" name="password_confirmation" required>
    <button type="submit">Register</button>
  </div>
</form>
@endsection
