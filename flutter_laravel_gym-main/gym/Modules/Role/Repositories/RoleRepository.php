<?php

/**
 * This is the module configuration class.
 * Repository and services are registered here.
 * it validates the attributes of the module.
 * all the validation rules are defined here.
 */

namespace Modules\Role\Repositories;

use Modules\Role\Entities\Role;
use Modules\Core\Repositories\BaseRepository;

class RoleRepository extends BaseRepository
{
    public function __construct(Role $role)
    {
        $this->model = $role;
        $this->model_name = "Role";
        $this->model_key = "role";
        $this->rules = [
            "name" => "required",
            "permissions" => "sometimes|nullable|array"
        ];
    }
}
