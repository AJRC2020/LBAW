@if($task->completed()->exists())
    <div class="task-container-done">
        <p class="task-titlulo2">{{ $task->name }}</p>
        <p class="task-responsavel2">{{ $task->creator() }}</p>
        <p class="task-pessoaafazer2">{{ $task->assignee() }}</p>
        <p class="task-date2">{{ $task->completed->dateended }}</p>
    </div>
@endif
