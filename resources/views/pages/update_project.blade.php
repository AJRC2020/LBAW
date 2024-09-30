@extends('layouts.auth')

@section('title', 'Update Project')

@section('content')
<div class="updateproject-div1">
  <form method="POST" action="{{ route('update project', $project->id) }}">
    {{ csrf_field() }}

    <p class="updateproject-div1-title">Update Project</p>
      <p class="updateproject-div1-usernamepassword">Date</p>
      <input id="enddate" type="date" name="enddate" value="{{ old('enddate') }}" requiered>
      @if ($errors->has('enddate'))
        <span class="error">
            {{ $errors->first('enddate') }}
        </span>
      @endif
      <p class="updateproject-div1-usernamepassword">Details</p>
      <input placeholder="Details" id="details" type="text" name="details" value="{{ old('details') }}" required>
      @if ($errors->has('details'))
        <span class="error">
            {{ $errors->first('details') }}
        </span>
      @endif
      <button class="updateproject-button" type="submit" name="submit">Update</button>
  </form>
  <a href="{{ route('project', $project->id, $project->idsubject) }}"><button class="updateproject-button2">Quit</button></a>
</div>

@endsection
