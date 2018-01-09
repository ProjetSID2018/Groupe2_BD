<?php
/**
 * Created by PhpStorm.
 * User: Utilisateur
 * Date: 08/01/2018
 * Time: 17:53
 */

namespace App\Http\Controllers;


use App\Http\JsonMapper\JsonMapper;
use App\Services\ArticleService;
use Illuminate\Http\Request;

class ArticleController extends Controller
{

    private $json_mapper;
    private $pos_tagging_service;

    public function __construct()
    {
        $this->json_mapper = new JsonMapper();
        $this->article_service = new ArticleService();
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
        $response = $this->pos_tagging_service->store($data);

        // Send to client the message and the status code
        return(response($response['message'],$response['code']));
    }
}