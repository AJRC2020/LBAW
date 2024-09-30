<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Forum extends Model
{
    public $timestamps = false;

    protected $table = 'lbaw-2195.forum_comments';

    public function project() {
        return $this->belongsTo(Project::class, 'idproject');
    }

    public function user() {
        return $this->belongsTo(User::class, 'iduser');
    }
}