<?php

namespace App\Models;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

use App\Models\Project;

class User extends Authenticatable
{
    use Notifiable;

    public $timestamps  = false;

    protected $table = 'lbaw-2195.users';

    
    public function projects() {
        return $this->belongsToMany(Project::class, 'lbaw-2195.member', 'iduser', 'idproject')->withPivot('favourite', 'creator', 'coordinator');
    }

    public function tasks() {
        return $this->belongsToMany(Task::class, 'lbaw-2195.doing', 'iduser', 'idtask')->withPivot('creator');
    }
    
    public function comments() {
        return $this->hasMany(Forum::class, 'iduser');
    }

    public function notifications() {
        return $this->hasMany(Notification::class, 'iduser');
    }

    public function inviters() {
        return $this->hasMany(Invite::class, 'idinviter');
    }

    public function invitees() {
        return $this->hasMany(Invite::class, 'idinvitee');
    }

    public function coordinator($id) {
        $member = $this->projects()->find($id)->pivot;

        return $member->coordinator;
    }

    public function allProjects() {
        return Project::all();
    }

    public function allUsers() {
        return User::all();
    }

}
