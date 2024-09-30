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

// Homepage and Others
Route::get('/', function () { return view("pages.home"); })->name('home');
Route::get('/contact', function () { return view("pages.contact"); })->name('contact');
Route::get('/faq', function () { return view("pages.faq"); })->name('faq');
Route::get('/services', function () { return view("pages.services"); })->name('services');
Route::get('/about', function () { return view("pages.about"); })->name('about');
Route::get('/privacy', function () { return view("pages.privacy"); })->name('privacy');

// Authentication
Route::get('login', 'Auth\LoginController@show')->name('login');
Route::post('login', 'Auth\LoginController@login');
Route::get('logout', 'Auth\LoginController@logout')->name('logout');
Route::get('register', 'Auth\RegisterController@show')->name('register');
Route::post('register', 'Auth\RegisterController@create');

//User
Route::get('user/{id}/projects', 'UserController@list')->name('user projects');
Route::get('user/{id}/createProject', 'ProjectController@show_create')->name('create project');
Route::post('user/{id}/createProject', 'ProjectController@create');
Route::get('user/{id}', 'UserController@show')->name('user');
Route::post('user/{id}', 'UserController@update');
Route::delete('user/{id}', 'UserController@delete')->name('delete user');

//Project
Route::get('project/{id}', 'ProjectController@show')->name('project');
Route::get('project/{id}/update', 'ProjectController@show_update')->name('update project');
Route::post('project/{id}/update', 'ProjectController@update');
Route::delete('project/{id}', 'ProjectController@delete')->name('delete project');
Route::get('project/{id}/members', 'ProjectController@list')->name('members');
Route::get('project/{id}/invite', 'ProjectController@show_invite')->name('show invite');
Route::put('project/coordinator/{iduser}/{idproject}', 'ProjectController@coordinator')->name('coordinator');
Route::put('project/{id}/archived', 'ProjectController@archive')->name('archive');
Route::put('project/{id}/favourite/', 'ProjectController@favourite')->name('favourite');

//Task
Route::get('project/{id}/tasks', 'TaskController@list')->name('tasks');
Route::put('tasks/{id}', 'TaskController@finish')->name('finish task');
Route::get('project/{id}/createTask', 'TaskController@showCreate')->name('create task');
Route::post('project/{id}/createTask', 'TaskController@create');

//Invite
Route::get('user/{id}/invites', 'InviteController@list')->name('invites');
Route::put('invites/{id}/accept', 'InviteController@accept')->name('accept invite');
Route::put('invites/{id}/decline', 'InviteController@decline')->name('decline invite');
Route::get('project/{id}/createInvite', 'InviteController@show_create')->name('create invite');
Route::post('project/{id}/createInvite', 'InviteController@create');

//Forum
Route::get('project/{id}/forum', 'ForumController@list')->name('forum');
Route::post('project/{id}/forum', 'ForumController@create');

//Notfications
Route::get('user/{id}/notifications', 'NotificationController@list')->name('notes');
Route::delete('notifications/{id}', 'NotificationController@delete')->name('delete notes');

//Admin
Route::get('admin/{id}/projects', 'UserController@list_admin')->name('admin projects');
Route::get('admin/{id}/users', 'UserController@list_all')->name('users');