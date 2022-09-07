<?php

/**
 * This policy class is used to check the permission of the user.
 *
 */

namespace Modules\Appointment\Policies;

use Illuminate\Auth\Access\HandlesAuthorization;
use Modules\Core\Policies\BasePolicy;

class AppointmentPolicy extends BasePolicy
{
    use HandlesAuthorization;

    public function __construct()
    {
        $this->model_key = "appointments";
    }
}
