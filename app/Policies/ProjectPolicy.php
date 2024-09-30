<?php

namespace App\Policies;

use App\Models\User;
use App\Models\Project;

use Illuminate\Auth\Access\HandlesAuthorization;
use Illuminate\Support\Facades\Auth;

class ProjectPolicy
{
    use HandlesAuthorization;

    public function show(User $user)
    {
        return Auth::check();
    }

    public function list(User $user)
    {
        return Auth::check();
    }

    public function create(User $user)
    {
        return Auth::check();
    }

    public function create_task(User $user, Project $project)
    {
        if ($user->projects()->find($project->id) == null) return false;

        $member = $user->projects()->find($project->id)->pivot;

        return $user->id == $member->iduser && $project->id == $member->idproject && !$project->archived;
    }

    public function update(User $user ,Project $project)
    {
        if ($user->projects()->find($project->id) == null) return false;

        $member = $user->projects()->find($project->id)->pivot;

        return $user->id == $member->iduser && $member->coordinator && $project->id == $member->idproject && !$project->archived;
    }

    public function delete(User $user, Project $project)
    {
        if ($user->admin) return true; 

        if ($user->projects()->find($project->id) == null) return false;

        $member = $user->projects()->find($project->id)->pivot;

        return $user->id == $member->iduser && $member->coordinator && $project->id == $member->idproject;
    }

    public function comments(User $user, Project $project)
    {
        return $project->users()->find($project) == null || $user->admin;
    }

    public function coordinator(User $user, Project $project)
    {
        if ($user->projects()->find($project->id) == null) return false;

        $member = $user->projects()->find($project->id)->pivot;

        return $user->id == $member->iduser && $member->coordinator && $project->id == $member->idproject;
    }

    public function archive(User $user, Project $project)
    {
        if ($user->admin) return true; 

        if ($user->projects()->find($project->id) == null) return false;

        $member = $user->projects()->find($project->id)->pivot;

        return $user->id == $member->iduser && $member->coordinator && $project->id == $member->idproject;
    }

    public function favourite(User $user, Project $project)
    {
        if ($user->projects()->find($project->id) == null) return false;

        $member = $user->projects()->find($project->id)->pivot;

        return $user->id == $member->iduser && $project->id == $member->idproject;
    }
}