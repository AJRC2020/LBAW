<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Completed extends Model
{
    public $timestamps = false;

    protected $table = 'lbaw-2195.completed';

    public function task() {
        return $this->hasOne(Task::class, 'id');
    }
}