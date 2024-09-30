<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Subject extends Model
{
    public $timestamps = false;

    /*protected $fillable = [
        'code', 'course', 'year', 'name'
    ];*/

    protected $table = 'lbaw-2195.subjects';

    public function project() {
        return $this->hasMany(Project::class, 'idsubject');
    }
}