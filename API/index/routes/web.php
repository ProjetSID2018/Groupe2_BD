<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
*/
Route::prefix('var/www/html/projet2018/code/bd_index/API/index')->group(function () {

    // Label's routes
    Route::post('label', 'LabelController@store');

    // Filtering group's routes
    Route::post('filtering', 'FilteringController@store')->name("code/bd_index/API/filtering");

    // Semantic group's routes
    Route::patch('semantic', 'SemanticController@store');
});

