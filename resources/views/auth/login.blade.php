@extends('layouts.newapp')

@section('title', 'Login')

@section('content')
<form method="POST" action="{{ route('login') }}">
  {{ csrf_field() }}

  <div class="login-div1">
    <p class="login-div1-title">Login</p>
    <p class="login-div1-usernamepassword">Email</p>
    <input placeholder="Email" id="email" type="email" name="email" value="{{ old('email') }}" required autofocus>
    @if ($errors->has('email'))
        <span class="error">
          {{ $errors->first('email') }}
        </span>
    @endif
    <p class="login-div1-usernamepassword">Password</p>
    <input placeholder="Password" id="password" type="password" name="password" required>
    @if ($errors->has('password'))
        <span class="error">
            {{ $errors->first('password') }}
        </span>
    @endif
    <button type="submit">Login</button>
  </div>
</form>
@endsection
