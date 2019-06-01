<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class requests extends Model
{
     
    public function responses(){
        return $this->hasMany(responses::class);

    }
}
