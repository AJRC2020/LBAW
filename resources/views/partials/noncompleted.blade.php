@if ($task->noncompleted()->exists())
    <div class="task-container-undone">
        <p class="task-titlulo2">{{ $task->name }}</p>
        <p class="task-responsavel2">{{ $task->creator() }}</p>
        <p class="task-pessoaafazer2">{{ $task->assignee() }}</p>
        <p class="task-date2">{{ $task->datestarted }}</p>
        <button class="task-buttonEdit2">Edit</button>
        <form method="POST" action="{{ route('finish task', $task->id) }}">
            {{ csrf_field() }}
            {{ method_field('PUT') }} 
            <button class="task-buttonFinish2" type="submit">Finish</button>
        </form>
    </div>
@endif