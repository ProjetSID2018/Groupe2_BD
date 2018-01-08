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
        $this->middleware('web');
        $this->json_mapper = new JsonMapper();
        $this->entity_service = new EntityService();
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        return(response('',200));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        return(response('',200));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = $this->json_mapper->json_mapper($request->all());

        $response = $this->entity_service->store($data);
        //$VENTITE = $request->input('entite');
        //$results = DB::select('CALL PENTITE(?)',array($VENTITE));
        return(response($response['message'],$response['code']));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        return(response('',200));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        return(response('',200));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $data = $this->json_mapper->json_mapper($request->all());

        //
        return(response('',200));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        return(response('',200));
    }
}
