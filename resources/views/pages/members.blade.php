@extends('layouts.auth')

@section('style')
  <link href="{{ asset('css/members.css') }}" rel="stylesheet">
@endsection

@section('content')
  <div class="members">
    <h1>Members</h1>
    <a href="{{ route('project', $project->id) }}"><button class="user_button_delete">BACK TO PROJECT</button></a>
    @each('partials.member', $project->users()->OrderBy('id')->get(), 'user')
  </div>
@endsection
