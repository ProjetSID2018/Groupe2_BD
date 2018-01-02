<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class hello extends Controller
{
	public function index($name)
	{
    	return(response('hello world from controller : )' . $name, 200));
	}

}
