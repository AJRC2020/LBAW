<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

use App\Models\Notification;
use App\Models\User;

class NotificationController extends Controller
{
    public function list($id) {
        $user = User::find($id);

        return view('pages.notifications', ['user' => $user]);
    }

    public function create_single($text, $id) {
        $currentDate = Carbon::now();

        $note = new Notification();
        $note->iduser = $id;
        $note->content = $text;
        $note->date = $currentDate->toDateString();
        $note->save();
    }

    public function create_group($text, $users, $changer) {
        foreach($users as $user) {
            if ($user->id != $changer->id) {
                $this->create_single($text, $user->id);
            }
        }
    }

    public function delete($id) {
        $notification = Notification::find($id);

        $id = $notification->iduser;
        $notification->delete();
        
        return redirect()->route('notes', $id);
    }
}