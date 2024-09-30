@extends('layouts.auth')

@section('style')
  <link href="{{ asset('css/notifications.css') }}" rel="stylesheet">
@endsection

@section('content')
  <div class="notifications">
  <h1>Notifications</h1>
    <div class="notification-div1-divtext">
      @each('partials.note', $user->notifications()->OrderBy('id')->get(), 'notification')
    </div>  
    <div class="home-div1-divimg">
      <img class="home-div1-img" src="/img/notifications.jpg">
    </div>  
  </div>
@endsection
