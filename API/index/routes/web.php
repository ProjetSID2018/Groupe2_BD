<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
*/
Route::prefix('API/index')->group(function () {

    // Label's routes
    Route::post('label', 'LabelController@store');

    // Filtering group's routes
    Route::post('filtering', 'FilteringController@store');

    // Semantic group's routes
    Route::patch('semantic', 'SemanticController@store');

    Route::get('test',function() {
        return view('welcome');
    });
});

