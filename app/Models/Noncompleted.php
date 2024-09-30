<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Noncompleted extends Model
{
    public $timestamps = false;

    protected $table = 'lbaw-2195.noncompleted';

    public function task() {
        return $this->hasOne(Task::class, 'id');
    }
}