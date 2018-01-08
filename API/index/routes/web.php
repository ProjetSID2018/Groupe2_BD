<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

/*
Route::get('/hello/{name}', function () {
    #return view('welcome');
    return response('hello', 200);
});

*/


use Illuminate\Support\Facades\Route;


Route::post('Entite', ['uses', 'uses' => 'Entite@store']);

Route::post('Journal', ['uses', 'uses' => 'Journal@store']);
