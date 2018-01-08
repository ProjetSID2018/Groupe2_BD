<?php

namespace App\Http\Controllers;


use App\Http\JsonMapper\JsonMapper;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class Entite extends Controller
{

    private $json_mapper;

    public function __construct(JsonMapper $json_mapper)
    {
        $this->json_mapper = $json_mapper;
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
        //$entite = $this->json_mapper->json_mapper($request);
        //print($entite);

        print("coucou");
        $VENTITE = $request->input('entite');
        $results = DB::select('CALL PENTITE(?)',array($VENTITE));
        //DB::select('CALL PENTITE(?)',$entite);
        return(response('',200));
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
        //
        return(response('',200));
    }
}
