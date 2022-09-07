<?php

/**
 * This is the module configuration class.
 * Repository and services are registered here.
 * it validates the attributes of the module.
 * all the validation rules are defined here.
 */

namespace Modules\Gym\Repositories;

use Modules\Gym\Entities\Gym;
use Modules\Core\Repositories\BaseRepository;

class GymRepository extends BaseRepository
{
    public function __construct(Gym $gym)
    {
        $this->model = $gym;
        $this->model_name = "Gym";
        $this->model_key = "gym";
        $this->rules = [
            "name" => "required",
            "contact" => "required",
            "location" => "required",

        ];
    }
}
