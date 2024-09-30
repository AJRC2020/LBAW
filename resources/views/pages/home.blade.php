@extends('layouts.newapp')

@section('title', 'Home')

@section('content')
<div class="home-div1">
  <div class="home-div1-divtext">
    <p><span class="home-div1-highlight">Manage Your<br/> College Projects</span> <br/><br/>
    <span class="home-div1-highlight2">Organize</span> and <span class="home-div1-highlight2">manage
    </span> your college projects in a visually clean and motivating environment.</p>
    @if(Auth::check())
      @if(Auth::user()->admin)
        <a href="{{ route('admin projects', Auth::id()) }}"><button>Projects</button></a>
      @else
        <a href="{{ route('user projects', Auth::id()) }}"><button>User Projects</button></a>
      @endif
    @else
      <a href="{{ route('register') }}"><button>Register</button></a>
    @endif
  </div>  
  <div class="home-div1-divimg">
    <img class="home-div1-img" src="/img/4457.jpg">
  </div>  
</div>
@endsection
