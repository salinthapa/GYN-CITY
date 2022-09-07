<?php

/**
 * This is the module configuration class.
 * All the attributes which are used in the api are defined here.
 * attributes availabe in requests are defined here
 */


namespace Modules\Role\Transformers;

use Illuminate\Http\Resources\Json\JsonResource;

class RoleResource extends JsonResource
{
    public function toArray($request): array
    {
        return [
            "id" => $this->id,
            "name" => $this->name,
            "permissions" => $this->permissions,
            "created_at" => $this->created_at->format("dS F, Y H:i a"),
            "created_at_diff" => $this->created_at->diffForHumans()
        ];
    }
}
