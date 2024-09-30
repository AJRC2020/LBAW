<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    public $timestamps = false;

    protected $table = 'lbaw-2195.project';

    public function subject() {
        return $this->belongsTo(Subject::class, 'idsubject');
    }

    public function users() {
        return $this->belongsToMany(User::class, 'lbaw-2195.member', 'idproject', 'iduser')->withPivot('favourite', 'creator', 'coordinator');
    }

    public function tasks() {
        return $this->hasMany(Task::class, 'idproject');
    }

    public function comments() {
        return $this->hasMany(Forum::class, 'idproject');
    }

    public function invites() {
        return $this->hasMany(Invite::class, 'idproject');
    }

    public function creator() {
        $users = $this->users;
        foreach($users as $user) {
            if ($user->pivot->creator){
                return $user->name;
            }
        }
    }

    public function is_favourite($id) {
        if ($this->users()->find($id) == null) return false;

        $member = $this->users()->find($id)->pivot;
        
        return $member->favourite;
    }
}