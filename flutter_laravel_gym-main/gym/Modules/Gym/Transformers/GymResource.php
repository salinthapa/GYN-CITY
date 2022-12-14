<?php

/**
 * This is the module configuration class.
 * All the attributes which are used in the api are defined here.
 * attributes availabe in requests are defined here
 */

namespace Modules\Gym\Transformers;

use Illuminate\Http\Resources\Json\JsonResource;

class GymResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request
     * @return array
     */
    public function toArray($request)
    {
        return [
            "id" => $this->id,
            "name" => $this->name,
            "contact" => $this->contact,
            "location" => $this->location,
            "created_at" => $this->created_at->format("dS F, Y H:i a"),
            "created_at_diff" => $this->created_at->diffForHumans()
        ];
    }
}
