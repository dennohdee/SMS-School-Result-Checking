<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class examresult extends Model
{
    //
    public function studentSpecials(){
        return $this->belongsTo('App\student');

    }
}
