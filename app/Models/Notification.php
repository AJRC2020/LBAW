<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Notification extends Model
{
    public $timestamps = false;

    protected $table = 'lbaw-2195.notifications';

    public function user() {
        return $this->belongsTo(User::class, 'iduser');
    }
}