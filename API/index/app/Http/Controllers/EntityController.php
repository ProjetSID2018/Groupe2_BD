<?php

namespace App\Http\Controllers;

use App\Http\JsonMapper\JsonMapper;
use App\Services\EntityService;
use Illuminate\Http\Request;

class EntityController extends Controller
{

   private $json_mapper;
   private $entity_service;

    public function __construct()
    {
        $this->json_mapper = new JsonMapper();
        $this->entity_service = new EntityService();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // Parse automatically the json sent by client
        $raw_data = $this->json_mapper->json_mapper($request->all());

        foreach ($raw_data as $data) {
            // Get the response from entity_service's associated method
            $response = $this->entity_service->store($data);

            // Send to client the message and the status code
            return(response($response['message'],$response['code']));
        };

        // end for
    }


}
