<?php
/**
 * Created by PhpStorm.
 * User: Utilisateur
 * Date: 12/01/2018
 * Time: 22:05
 */

namespace App\Http\Controllers;


use App\Http\JsonMapper\JsonMapper;
use App\Services\V2\SemanticService;
use Illuminate\Http\Request;

class SemanticController extends Controller
{

    private $json_mapper;
    private $semantic_service;

    public function __construct()
    {
        $this->json_mapper = new JsonMapper();
        $this->semantic_service = new SemanticService();
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


        // Return the appropriate message to client
        return $this->parse($raw_data,$this->semantic_service);
    }
}