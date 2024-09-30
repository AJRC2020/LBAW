@extends($user->admin ? 'layouts.admin' : 'layouts.auth')

@section('style') 
  <link href="{{ asset('css/profile.css') }}" rel="stylesheet">
@endsection

@section('title', $user->name)

@section('content')
  @include('partials.user', ['user' => $user])
@endsection