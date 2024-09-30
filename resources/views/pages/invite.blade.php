@extends('layouts.auth')

@section('style')
  <link href="{{ asset('css/invite.css') }}" rel="stylesheet">
@endsection

@section('content')
  <div class="updateproject-div5">
    <form method="POST" action="{{ route('create invite', $project->id) }}">
      {{ csrf_field() }}
      <p class="updateproject-div1-title">Invitation</p>
      <p class="updateproject-div1-usernamepassword">User</p>
      <input placeholder="User" id="user" name="user" type="email" value="{{ old('user') }}" required autofocus>
      @if ($errors->has('user'))
        <span class="error">
          {{ $errors->first('user') }}
        </span>
      @endif
      <button class="updateproject-button" type="submit">Invite</button>
    </form>
    <a href="{{ route('project', $project->id) }}"><button class="updateproject-button2">Quit</button></a>
  </div>
@endsection
