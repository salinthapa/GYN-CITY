<?php

/**
 * Factory file is used to generate fake data for the database.
 * This file is automatically generated.
 * Data is generated using the database table structure.
 */

namespace Modules\Gym\Database\factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class GymFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = \Modules\Gym\Entities\Gym::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [

            "name" => $this->faker->title(),
            "contact" => $this->faker->title(),
            "location" => $this->faker->title(),


        ];
    }
}
