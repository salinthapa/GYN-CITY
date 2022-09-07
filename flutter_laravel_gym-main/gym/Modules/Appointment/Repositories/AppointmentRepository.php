<?php

/**
 * This is the module configuration class.
 * Repository and services are registered here.
 * it validates the attributes of the module.
 * all the validation rules are defined here.
 */

namespace Modules\Appointment\Repositories;

use Modules\Appointment\Entities\Appointment;
use Modules\Core\Repositories\BaseRepository;

class AppointmentRepository extends BaseRepository
{
    public function __construct(Appointment $appointment)
    {
        $this->model = $appointment;
        $this->model_name = "Appointment";
        $this->model_key = "Appointment";
        $this->rules = [
            "trainer_id" => "required",
            "customer_id" => "required",
            "appointment_time" => "required",
            "appointment_date" => "required",
            "status" => "required",
        ];
    }
}
