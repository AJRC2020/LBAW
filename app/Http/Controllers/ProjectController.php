<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

use App\Models\Project;
use App\Models\Subject;
use App\Models\User;
use App\Http\Controllers\NotificationController;

class ProjectController extends Controller
{
    public function show($id) {

        $project = Project::find($id);
        $subject = Subject::find($project->idsubject);

        return view('pages.project', ['project' => $project, 'subject' => $subject]);

    }

    public function show_update($id) {
        
        $project = Project::find($id);
        $this->authorize('update', $project);
        return view('pages.update_project', ['project' => $project]);

    }

    public function show_create($id) 
    {
        $user = User::find($id);
        $subjects = Subject::all();

        if (!Auth::check()){
            return redirect()->route('home');
        }
        
        return view('pages.create_project', ['user' => $user, 'subjects' => $subjects]);
    }

    public function create(Request $request, $id)
    {
        $user = User::find($id);

        $validated = $request->validate([
            'name' => 'required|string|max:127',
            'enddate' => 'required|date|after_or_equal:today',
            'details' => 'required|string|max:1000',
            'idsubject' => 'required',
        ]);

        if (!Auth::check()){
            return redirect()->route('create project', $user->id);
        }

        $project = new Project();

        $project->name = $request->input('name');
        $project->enddate = $request->input('enddate');
        $project->details = $request->input('details');
        $project->archived = false;
        $project->idsubject = $request->input('idsubject');
        $project->save();

        $user->projects()->attach($project->id,[
            'favourite' => false,
            'creator' => true,
            'coordinator' => true,
        ]);
        $user->save();

        return redirect()->route('user projects', $user->id);
    }

    public function update(Request $request, $id) {
        
        $project = Project::find($id);
        $nc = new NotificationController;

        $validated = $request->validate([
            'enddate' => 'required|date|after_or_equal:today',
            'details' => 'required|string|max:1000',
        ]);

        $project->enddate = $request->input('enddate');
        $project->details = $request->input('details');
        $project->save();

        $text = $project->name . " has been updated";
        $nc->create_group($text, $project->users, Auth::user());

        return redirect()->route('project', $project->id);
    }
    
    public function list($id) {
        if (!Auth::check()) {
            return redirect()->route('home');
        }

        $project = Project::find($id);

        return view('pages.members', ['project' => $project]);
    }

    public function delete($id) {
        
        $project = Project::find($id);
        $nc = new NotificationController();

        $this->authorize('delete', $project);

        $text = $project->name . " has been deleted";
        $nc->create_group($text, $project->users, Auth::user());

        $project->delete();

        if(Auth::user()->admin) return redirect()->route('admin projects', Auth::id);
        else return redirect()->route('user', Auth::user()->id);
    }

    public function coordinator($iduser, $idproject) {
        $project = Project::find($idproject);
        $user = User::find($iduser);
        $nc = new NotificationController();

        $this->authorize('coordinator', $project);

        $member = $user->projects()->find($project->id)->pivot;
        $member->coordinator = true;
        $member->save();

        $text = "You are now a coordinator on project " . $project->name;

        $nc->create_single($text, $iduser);

        return redirect()->route('members', $idproject);
    }

    public function archive($id) {
        $project = Project::find($id);
        $nc = new NotificationController();

        $this->authorize('archive', $project);

        $project->archived = true;
        $project->save();

        $text = $project->name . " has been archived";
        $nc->create_group($text, $project->users, Auth::user());

        return redirect()->route('project', $id);
    }

    public function favourite($id) {
        $project = Project::find($id);

        $this->authorize('favourite', $project);

        $member = Auth::user()->projects()->find($project->id)->pivot;
        $favourite = $member->favourite;
        $member->favourite = !$favourite;
        $member->save();  
        
        return redirect()->route('user projects', Auth::id());
    }
}