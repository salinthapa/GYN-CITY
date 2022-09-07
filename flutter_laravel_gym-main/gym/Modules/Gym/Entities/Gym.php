<?php

/**
 * This Entity class is used to store the data of the module.
 * This entity is used to store the data of the module.
 * This class is used across the application.
 */

namespace Modules\Gym\Entities;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Gym extends Model
{
    use HasFactory;

    protected $guarded = [];
    protected $casts = [
        "permissions" => "array"
    ];

    protected static function newFactory()
    {
        return \Modules\Gym\Database\factories\GymFactory::new();
    }
}
