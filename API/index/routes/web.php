<?php

use Illuminate\Support\Facades\Route;

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

// Entity's routes
Route::post('entity', 'EntityController@store');

// Newspaper's routes
Route::post('newspaper', 'NewspaperController@store');


// Author's routes
Route::post('author', 'AuthorController@store');