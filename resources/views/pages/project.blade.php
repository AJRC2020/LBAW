@extends('layouts.auth')

@section('style')
  <link href="{{ asset('css/project.css') }}" rel="stylesheet">
@endsection

@section('title', $project->name)

@section('content')
  @include('partials.project', ['project' => $project])
@endsection