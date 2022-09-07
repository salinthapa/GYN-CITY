<?php

/**
 * This is the module configuration class.
 * Repository and services are registered here.
 * it validates the attributes of the module.
 * all the validation rules are defined here.
 */

namespace Modules\Shop\Repositories;

use Modules\Shop\Entities\Shop;
use Modules\Core\Repositories\BaseRepository;

class ShopRepository extends BaseRepository
{
    public function __construct(Shop $shop)
    {
        $this->model = $shop;
        $this->model_name = "Shop";
        $this->model_key = "shop";
        $this->rules = [
            "name" => "required",
            "contact" => "required",
            "location" => "required",
        ];
    }
}
