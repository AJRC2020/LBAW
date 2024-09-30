@extends('layouts.auth')

@section('title', 'Create New Project')

@section('content')
<div class="createProject-div1">
  <form method="POST" action="{{ route('create project', $user->id) }}">
    {{ csrf_field() }}

    <p class="createProject-div1-title">Create Project</p>
    <p class="createProject-div1-usernamepassword">Project Name</p>
    <input id="name" type="text" name="name" placeholder="Project Name" value="{{ old('name') }}" required autofocus>
    @if ($errors->has('name'))
      <span class="error">
        {{ $errors->first('name') }}
      </span>
    @endif
    <p class="createProject-div1-usernamepassword">Date</p>
    <input id="enddate" type="date" name="enddate" value="{{ old('enddate') }}" requiered>
    @if ($errors->has('enddate'))
      <span class="error">
        {{ $errors->first('enddate') }}
      </span>
    @endif
    <p class="createProject-div1-usernamepassword">Details</p>
    <input placeholder="Details" id="details" type="text" name="details" value="{{ old('details') }}" required>
    @if ($errors->has('details'))
      <span class="error">
        {{ $errors->first('details') }}
      </span>
    @endif
    <p class="createProject-div1-usernamepassword">Subject</p>
    <select name="idsubject" id="idsubject">
      <option value="" disabled selected>Choose a subject</option>
      @each('partials.select_subject', $subjects , 'subject');
    </select>
    <button class="createproject-button" type="submit" name="submit">Create</button>
  </form>
  <a href="{{ route('user', $user->id) }}"><button class="createproject-button2">Quit</button></a>
</div>

<?php
    if(isset($_POST['submit'])){
    if(!empty($_POST['idsubject'])) {
        $selected = $_POST['idsubject'];
        echo 'You have chosen: ' . $selected;
    } else {
        echo 'Please select the value.';
    }
    }
?>

@endsection