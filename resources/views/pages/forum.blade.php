@extends('layouts.auth')

@section('style')
  <link href="{{ asset('css/forum.css') }}" rel="stylesheet">
@endsection

@section('content')
      <div class="forum">
        <h1>Forum</h1>
        <div class="forum-div">
          <div class="forum-div-left">
            <p class="member-title">Members</p>
            @each('partials.name', $project->users()->OrderBy('name')->get(), 'user');
          </div>
          <div class="forum-div-right">
            <div class="forum-div-right-all_msg">
              @each('partials.message', $project->comments()->OrderBy('date')->get(), 'message')
            </div>

            <div class="forum-div-right-msg">
              <form method="POST" action="{{ route('forum', $project->id) }}">
                {{ csrf_field() }}

                <input placeholder="Type a message here..." id="commemt" type="text" name="comment" value="{{ old('comment') }}" required autofocus>
                @if ($errors->has('comment'))
                  <span class="error">
                    {{ $errors->first('comment') }}
                  </span>
                @endif
                <button type="submit">Send</button>
              </form>
            </div>

          </div>

          <div class="forum-div-leftleft">
            <a href="{{ route('project', $project->id) }}"><button>Back to Project</button></a>
            <a href="{{ route('tasks', $project->id) }}"><button>Tasks</button></a>
          </div>
        </div>
      </div>
@endsection
