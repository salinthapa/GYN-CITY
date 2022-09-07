<?php

/**
 * Controller file is used to handle the requests of the module.
 * it accepts the requests and calls the respective methods of the model and view.
 * it got functions which handles respective requests like GET, POST, PUT, DELETE.
 * it connects the model and view.
 * 
 */

namespace Modules\Shop\Http\Controllers;

use Exception;
use Illuminate\Http\Request;
use Modules\Shop\Entities\Shop;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Resources\Json\JsonResource;
use Modules\Core\Http\Controllers\BaseController;
use Modules\Shop\Repositories\ShopRepository;
use Modules\Shop\Transformers\ShopResource;

class ShopController extends BaseController
{
    protected $repository;

    public function __construct(Shop $shop, ShopRepository $shopRepository)
    {
        $this->model = $shop;
        $this->model_name = "Shop";
        $this->repository = $shopRepository;

        $this->restrict = ["index", "show", "store", "update", "destroy"];

        parent::__construct();
    }

    public function collection(object $resources): JsonResource
    {
        return ShopResource::collection($resources);
    }

    public function resource(object $resource): JsonResource
    {
        return new ShopResource($resource);
    }

    public function index(Request $request): JsonResponse
    {
        try {
            $fetched = $this->repository->fetchAll($request);
        } catch (Exception $exception) {
            return $this->handleException($exception);
        }

        return $this->successResponse($this->collection($fetched), $this->lang("fetch-all-success"));
    }

    public function store(Request $request): JsonResponse
    {
        try {
            $data = $this->repository->validateData($request);
            $created = $this->repository->store($data);
        } catch (Exception $exception) {
            return $this->handleException($exception);
        }

        return $this->successResponse($this->resource($created), $this->lang("store-success"), 201);
    }

    public function show(int $id): JsonResponse
    {
        try {
            $fetched = $this->repository->fetch($id);
        } catch (Exception $exception) {
            return $this->handleException($exception);
        }

        return $this->successResponse($this->resource($fetched), $this->lang("fetch-success"));
    }

    public function update(Request $request, int $id): JsonResponse
    {
        try {
            $data = $this->repository->validateData($request);
            $updated = $this->repository->update($data, $id);
        } catch (Exception $exception) {
            return $this->handleException($exception);
        }

        return $this->successResponse($this->resource($updated), $this->lang("update-success"));
    }

    public function destroy(int $id): JsonResponse
    {
        try {
            $this->repository->delete($id);
        } catch (Exception $exception) {
            return $this->handleException($exception);
        }

        return $this->successResponseMessage($this->lang("delete-success"));
    }
}
