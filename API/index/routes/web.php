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

// Word's routes
Route::post('word', 'WordController@store');

// Word_Root's routes
Route::post('wordroot', 'WordRootController@store');

// Word_Position's routes
Route::post('wordposition', 'WordPositionController@store');

// Synonym's routes
Route::post('synonym', 'SynonymController@store');

// Wiki's routes

// Classification's routes

// Pos_Tagging's routes

// Written's routes

// Article's routes

