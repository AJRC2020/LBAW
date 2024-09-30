@extends('layouts.auth')

@section('style')
  <link href="{{ asset('css/createTask.css') }}" rel="stylesheet">
@endsection
 
@section('title', 'Create Task')

@section('content')
<div class="createTask-div1">
  <form method="POST" action="{{ route('create task', $project->id) }}">
    {{ csrf_field() }}
    <p class="createProject-div1-title">Create Task</p>
    <p class="createProject-div1-usernamepassword">Task Name</p>
    <input id="name" type="text" name="name" placeholder="Task Name" value="{{ old('name') }}" required autofocus>
    @if ($errors->has('name'))
      <span class="error">
        {{ $errors->first('name') }}
      </span>
    @endif
    <p class="createProject-div1-usernamepassword">Assignee</p>
    <select name="iduser" id="iduser">
      <option value="" disabled selected>Choose a member</option>
      @each('partials.select_user', $project->users()->orderBy('id')->get() , 'user');
    </select>
    <p class="createProject-div1-usernamepassword">Details</p>
    <input placeholder="Details" id="details" type="text" name="details" value="{{ old('details') }}" required>
    @if ($errors->has('details'))
      <span class="error">
        {{ $errors->first('details') }}
      </span>
    @endif
    <button class="createproject-button" type="submit" name="submit">Create</button>
  </form>  
  <a href="{{ route('tasks', $project->id) }}"><button class="createproject-button2">Quit</button></a>
</div>

<?php
    if(isset($_POST['submit'])){
    if(!empty($_POST['iduser'])) {
        $selected = $_POST['iduser'];
        echo 'You have chosen: ' . $selected;
    } else {
        echo 'Please select the value.';
    }
    }
?>


@endsection

