<?php

namespace App\Policies;

use App\Models\Task;
use App\Models\Completed;
use App\Models\Noncompleted;
use App\Models\Project;
use App\Models\User;

use Illuminate\Auth\Access\HandlesAuthorization;
use Illuminate\Support\Facades\Auth;

class TaskPolicy
{
    use HandlesAuthorization;


    public function finish(User $user, Task $task)
    {
        if ($user->tasks()->find($task->id) == null) return false;

        $doing = $user->tasks()->find($task->id)->pivot;

        return $user->id == $doing->iduser && $doing->idtask == $task->id;
    }
}