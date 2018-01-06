<?php

namespace App\Http\Controllers;
use DB;
use Illuminate\Http\Request;

class hello extends Controller
{
	public function index($VENTITE)
	{
    	#$name=json_decode($name);
    	#$results = DB::select('select * from journal where id_journal = :id_journal', ['id_journal' => 1]);

    	$results = DB::select('CALL PENTITE(?)',array($Param1));
    	#For insertion : decode json

    	#For a get : encode JSON
    	#return(response(json_encode($name), 200));
    	#return(response($Param1, 200));

        return $results;
	}

}
