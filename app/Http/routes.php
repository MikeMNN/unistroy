<?php

/*
|--------------------------------------------------------------------------
| Authentication & Password Reset Controllers
|--------------------------------------------------------------------------
|
| These two controllers handle the authentication of the users of your
| application, as well as the functions necessary for resetting the
| passwords for your users. You may modify or remove these files.
|
*/

// Home
Route::get('/', [
	'uses' => 'HomeController@index', 
	'as' => 'home'
]);
Route::get('language', 'HomeController@language');


// Admin
Route::get('admin', [
	'uses' => 'AdminController@admin',
	'as' => 'admin',
	'middleware' => 'admin'
]);

Route::get('medias', [
	'uses' => 'AdminController@filemanager',
	'as' => 'medias',
	'middleware' => 'redac'
]);


Route::get('service/order', 'BlogController@indexOrder');
Route::get('service/cellings', 'BlogController@indexCellings');
Route::get('service/walls', 'BlogController@indexWalls');
Route::get('service/floor', 'BlogController@indexFloor');
Route::get('service/opennings', 'BlogController@indexOpennings');
Route::get('service/etc', 'BlogController@indexEtc');
Route::get('service/tag', 'BlogController@tag');
Route::get('service/search', 'BlogController@search');
Route::get('service/create', 'BlogController@create');
Route::get('service/edit', 'BlogController@edit');
Route::get('service/destroy', 'BlogController@destroy');

Route::post('service/update', 'BlogController@update');

Route::put('postseen/{id}', 'BlogController@updateSeen');
Route::put('postactive/{id}', 'BlogController@updateActive');

Route::resource('service', 'BlogController');

// Comment
Route::resource('comment', 'CommentController', [
	'except' => ['create', 'show']
]);

Route::put('commentseen/{id}', 'CommentController@updateSeen');
Route::put('uservalid/{id}', 'CommentController@valid');


// Contact
Route::resource('contact', 'ContactController', [
	'except' => ['show', 'edit']
]);

//Gallery

Route::get('gallery/our',  'GalleryController@index');

Route::resource('gallery', 'BlogController');

// User
Route::get('user/sort/{role}', 'UserController@indexSort');

Route::get('user/roles', 'UserController@getRoles');
Route::post('user/roles', 'UserController@postRoles');

Route::put('userseen/{id}', 'UserController@updateSeen');

Route::resource('user', 'UserController');

// Auth
Route::controllers([
	'auth' => 'Auth\AuthController',
	'password' => 'Auth\PasswordController',
]);
