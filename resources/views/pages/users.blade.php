@extends('layouts.admin')

@section('style')
  <link href="{{ asset('css/users.css') }}" rel="stylesheet">
@endsection

@section('content')
  <div class="users-div1">
  <h1>Users</h1>
  @each('partials.user_admin', $user->allUsers(), 'user')
  </div>
@endsection
