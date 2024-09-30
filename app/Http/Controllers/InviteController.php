<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

use App\Models\Invite;
use App\Models\Project;
use App\Models\User;
use App\Http\Controllers\NotificationController;

class InviteController extends Controller
{
    public function list($id) {
        $user = User::find($id);

        return view('pages.invites', ['user' => $user]);
    }

    public function show_create($id) {
        $project = Project::find($id);

        return view('pages.invite', ['project' => $project]);
    }

    public function create(Request $request, $id) {
        $project = Project::find($id);
        $inviter = Auth::user();
        $nc = new NotificationController();

        $validated = $request->validate([
            'user' => 'required|email|max:255|string'
        ]);

        $invitee = User::where('email', $request->input('user'))->first();
        $currentDate = Carbon::now();

        $invite = new Invite();
        $invite->idinvitee = $invitee->id;
        $invite->idinviter = $inviter->id;
        $invite->idproject = $project->id;
        $invite->invdate = $currentDate->toDateString();
        $invite->save();

        $text = "You were invited to project " . $project->name . " by " . $inviter->name;
        $nc->create_single($text, $invitee->id);

        return redirect()->route('project', $project->id);
    }

    public function accept($id) {
        $invite = Invite::find($id);
        $project = Project::find($invite->idproject);
        $user = User::find($invite->idinvitee);

        if(Auth::id() != $user->id) {
            return redirect()->route('user projects', Auth::id());
        }

        $user->projects()->attach($project->id, [
            'favourite' => false,
            'creator' => false,
            'coordinator' => false,
        ]);
        $user->save();

        $invite->delete();

        return redirect()->route('user projects', $user->id);
    }

    public function decline($id) {
        $invite = Invite::find($id);
        $user = User::find($invite->idinvitee);

        if(Auth::id() != $user->id) {
            return redirect()->route('user projects', Auth::id());
        }

        $invite->delete();

        return redirect()->route('invites', $user->id);
    }
}