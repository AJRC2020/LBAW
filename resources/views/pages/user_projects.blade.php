@extends('layouts.auth')

@section('style')
  <link href="{{ asset('css/projects.css') }}" rel="stylesheet">
@endsection

@section('title', 'Projects')

@section('content')
<div class="projects-div1" id="$user->id">
  <h1>Projects</h1>
  <a href="{{ route('create project', $user->id) }}"><button class="projects-div1-button">Create Project</button></a>
  @each('partials.projects', $user->projects()->orderBy('favourite')->get(), 'project')
</div>
@endsection
