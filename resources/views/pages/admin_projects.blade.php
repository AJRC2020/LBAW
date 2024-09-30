@extends('layouts.admin')

@section('style')
  <link href="{{ asset('css/projects.css') }}" rel="stylesheet">
@endsection

@section('title', 'Projects')

@section('content')
<div class="projects-div1" id="$user->id">
  <h1>Projects</h1>
  @each('partials.projects_admin', $user->allProjects() , 'project')
</div>
@endsection
