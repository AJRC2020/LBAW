<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Invite extends Model
{
    public $timestamps = false;

    protected $table = 'lbaw-2195.invites';

    public function inviter() {
        return $this->belongsTo(User::class, 'idinviter');
    }

    public function invitee() {
        return $this->belongsTo(User::class, 'idinvitee');
    }

    public function project() {
        return $this->belongsTo(Project::class, 'idproject');
    }
}