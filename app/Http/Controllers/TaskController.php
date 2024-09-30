<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

use App\Models\Task;
use App\Models\Completed;
use App\Models\Noncompleted;
use App\Models\User;
use App\Models\Project;
use App\Http\Controllers\NotificationController;

class TaskController extends Controller 
{
    public function list($id) {

        $project = Project::find($id);
        
        return view('pages.tasks', ['project' => $project]);
    }

    public function showCreate($id) {

        $project = Project::find($id);
        
        $this->authorize('create_task', $project);

        return view('pages.create_task', ['project' => $project]);

    }

    public function create(Request $request, $id) {

        $project = Project::find($id);
        $task = new Task();
        $nc = new NotificationController();
        $currentDate = Carbon::now();

        $validated = $request->validate([
            'name' => 'required|string|max:127',
            'iduser' => 'required',
            'details' => 'required|string|max:1000',
        ]);

        $task->name = $request->input('name');
        $task->datestarted = $currentDate->toDateString();
        $task->details = $request->input('details');
        $task->idproject = $id;
        $task->save();
        
        $noncomp = new Noncompleted();
        $noncomp->id = $task->id;
        $noncomp->save();

        $creator = Auth::user();
        $assignee = User::find($request->input('iduser'));
        if ($creator->id == $assignee->id) {
            $creator->tasks()->attach($task->id, ['creator' => true]);
            $creator->save();
        }
        else {
            $creator->tasks()->attach($task->id, ['creator' => true]);
            $creator->save();
            $assignee->tasks()->attach($task->id, ['creator' => false]);
            $assignee->save();
        }

        $text = "You have been assigned a task on project " . $project->name;
        $nc->create_single($text, $assignee->id);

        return redirect()->route('tasks', $project->id);
    }    

    public function finish($id) {
        $nc = new NotificationController();
        $task = Task::find($id);

        $this->authorize('finish', $task);

        $uncomp = $task->noncompleted;
        $currentDate = Carbon::now();

        $uncomp->delete();

        $comp = new Completed();
        $comp->id = $id;
        $comp->dateended = $currentDate->toDateString();
        $comp->save();

        $text = $task->name . " has been finished";
        $nc->create_group($text, $task->users, Auth::user());        

        return redirect()->route('tasks', $task->idproject);
    }
}