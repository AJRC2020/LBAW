<div class="project-div1" id="{{ $project->id }}">
  <p class="project-div1-title">{{ $project->name }}</p>
  <div class="porject-div1-buttonsdiv">
    @if(!$project->archived)
      <a href="{{ route('update project', $project->id) }}"><button class="project-div1-button1">Update Project</button></a>
      <form method="POST" action="{{ route('archive', $project->id) }}">
        {{ csrf_field() }}
        {{ method_field('PUT') }}
        <button class="project-div1-button4" type="submit">Archive Project</button>
      </form> 
      <a href="{{ route('create invite', $project->id) }}"><button class="project-div1-button6">Invite</button></a>
    @endif
    <form method="POST" action="{{ route('delete project', $project->id) }}">
      {{ csrf_field() }}
      {{ method_field('DELETE') }}
      <button class="project-div1-button2" type="submit">Delete Project</button>
    </form>  
    <a href="{{ route('members', $project->id) }}"><button class="project-div1-button4">Members</button></a>
    <form method="POST" action="{{ route('favourite', $project->id) }}">
      {{ csrf_field() }}
      {{ method_field('PUT') }}
      @if ($project->is_favourite(Auth::id()))
      <button class="project-div1-button2" type="submit">Unfavourite</button>
      @else
        <button class="project-div1-button5" type="submit">Favourite</button>
      @endif
    </form>
  </div>

  <div class="project-div1-imagediv">
    <img src="/img/projectImg1.jpg"/> 
  </div>

  <div class="project-div1-infodiv">
    <p class="project-div1-details-title">Details</p>
    <p class="project-div1-details">{{ $project->details }}</p>
    <p class="project-div1-details-title">Subject</p>
    <p class="project-div1-subject">{{ $subject->name }}</p>
    <p class="project-div1-date">This project has to be delivered by {{ $project->enddate }}</p>
  </div>

  <a href="{{ route('forum', $project->id) }}"><button class="project-div1-button3">Forum</button></a>  
  <a href="{{ route('tasks', $project->id) }}"><button class="project-div1-button9">Tasks</button></a>
</div>

