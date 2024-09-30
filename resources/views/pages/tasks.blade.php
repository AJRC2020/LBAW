@extends('layouts.auth')

@section('style')
  <link href="{{ asset('css/tasks.css') }}" rel="stylesheet">
@endsection

@section('title', 'tasks')

@section('content')
<div class="tasks">
  <h1>Tasks</h1>
  <div class="tasks-div">
    <div class="tasks-div-left">
      <a href="{{ route('create task', $project->id) }}"><button class="createTask_button">Create Task</button></a>

      <p class="complete-title">Complete</p>

      <div class="task-container-undone2">
        <p class="task-titlulo">Task</p>
        <p class="task-responsavel">Owner</p>
        <p class="task-pessoaafazer">Assignee</p>
        <p class="task-date">Date</p>
      </div>
      @each('partials.completed', $project->tasks()->orderBy('id')->get(), 'task')

      <p class="uncomplete-title">Uncomplete</p>

      <div class="task-container-undone2">
        <p class="task-titlulo">Task</p>
        <p class="task-responsavel">Owner</p>
        <p class="task-pessoaafazer">Assignee</p>
        <p class="task-date">Date</p>
        <p class="task-edit">Edit</p>
        <p class="task-finish">Finish</p>
      </div>
      @each('partials.noncompleted', $project->tasks()->orderBy('id')->get(), 'task')
    
    </div>
    <div class="tasks-div-right">
      <a href="{{ route('project', $project->id) }}"><button>Back to Project</button></a>
      <a href="{{ route('forum', $project->id) }}"><button>Forum</button></a>
    </div>
  </div>
</div>
@endsection
