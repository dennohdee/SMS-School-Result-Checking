<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class parents extends Model
{
    //
    public function student(){
        return $this->hasMany(student::class);

    }
}
