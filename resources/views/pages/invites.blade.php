@extends('layouts.auth')

@section('style')
  <link href="{{ asset('css/invites.css') }}" rel="stylesheet">
@endsection

@section('content')
  <div class="invites">
    <h1>Invites</h1>
    @each('partials.invite', $user->invitees()->orderBy('invdate')->get(), 'invite')
  </div>
@endsection
