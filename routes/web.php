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

Route::get('/', function () {
    return view('auth.login');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::resource('student', 'studentController');
Route::resource('user', 'userController');
Route::resource('sms', 'smsController');
Route::resource('exam', 'examController');
Route::get('/help', 'smsreportsController@help')->name('help');
Route::get('/profile', 'profileController@profile')->name('profile');
Route::put('/profile', 'profileController@update');

