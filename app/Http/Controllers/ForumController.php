<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

use App\Models\Forum;
use App\Models\User;
use App\Models\Project;

class ForumController extends Controller
{
    public function list($id) {
        $project = Project::find($id);

        $this->authorize('comments', $project);

        return view('pages.forum', ['project' => $project]);
    }

    public function create(Request $request, $id) {

        $project = Project::find($id);

        $validated = $request->validate([
            'comment' => 'required|string|max:256'
        ]);

        $currentDate = Carbon::now();

        $comment = new Forum();
        $comment->content = $request->input('comment');
        $comment->iduser = Auth::id();
        $comment->idproject = $project->id;
        $comment->date = $currentDate->toDateString();
        $comment->save();

        return redirect()->route('forum', $project->id);
    }
}