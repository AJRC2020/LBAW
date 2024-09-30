<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Task extends Model 
{
    public $timestamps = false;

    protected $table = 'lbaw-2195.task';

    public function project() {
        return $this->belongsTo(Project::class, 'idproject');
    }

    public function users() {
        return $this->belongsToMany(User::class, 'lbaw-2195.doing', 'idtask', 'iduser')->withPivot('creator');
    }

    public function completed() {
        return $this->hasOne(Completed::class, 'id');
    }

    public function noncompleted() {
        return $this->hasOne(Noncompleted::class, 'id');
    }

    public function creator() {
        $users = $this->users;
        foreach($users as $user) {
            if ($user->pivot->creator){
                return $user->name;
            }
        }
    }

    public function assignee() {
        $users = $this->users;
        foreach($users as $user) {
            if (!$user->pivot->creator){
                return $user->name;
            }
        }
    }
}