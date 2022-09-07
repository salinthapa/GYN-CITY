<?php

/**
 * This Entity class is used to store the data of the module.
 * This entity is used to store the data of the module.
 * This class is used across the application.
 */

namespace Modules\Appointment\Entities;

use Modules\User\Entities\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Appointment extends Model
{
    use HasFactory;

    protected $guarded = [];
    protected $casts = [
        "permissions" => "array"
    ];
    protected $with = ["trainer", "customer"];

    protected static function newFactory()
    {
        return \Modules\Appointment\Database\factories\AppointmentFactory::new();
    }
    public function trainer(): BelongsTo
    {
        return $this->belongsTo(User::class, "trainer_id");
    }
    public function customer(): BelongsTo
    {
        return $this->belongsTo(User::class, "customer_id");
    }
}
