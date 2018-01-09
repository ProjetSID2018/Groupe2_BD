<?php

namespace App\Http\Controllers;

use App\Http\JsonMapper\JsonMapper;
use App\Services\NewspaperService;
use Illuminate\Http\Request;


class NewspaperController extends Controller
{
    private $json_mapper;
    private $newspaper_service;

    public function __construct()
    {
        $this->json_mapper = new JsonMapper();
        $this->newspaper_service = new NewspaperService();
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
        $data = $this->json_mapper->json_mapper($request->all());

        // Get the response from entity_service's associated method
        $response = $this->newspaper_service->store($data);

        // Send to client the message and the status code
        return(response($response['message'],$response['code']));
    }

    public function show($id) {

    }

}
