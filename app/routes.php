<?php

Route::get('test', 'TestController@getImportusers');

Route::get('user/logout','UserController@getLogout');
Route::get('user/login','UserController@getLogin');
Route::post('user/login','UserController@postLogin');

Route::group(array('before' => 'auth'), function()
{
	Route::get('/', 'MainController@index');
	Route::get('user/editpwd','UserController@getEditpwd');
	Route::post('user/editpwd','UserController@postEditpwd');
});

Route::group(array('before' => 'auth|checkEmptyPassword'), function()
{
	Route::get('user/leader', ['as'=>'userLeader', 'uses'=>'UserController@getLeader'] );
	Route::get('user/leader/edit', ['as'=>'userLeader', 'uses'=>'UserController@getEditLeader'] );
	Route::post('user/leader/edit', ['as'=>'userLeader', 'uses'=>'UserController@postEditLeader'] );
	Route::controller('user','UserController');
	
// 	Route::get('teacher/edit', ['as'=>'editTeacher', 'uses'=>'TeacherController@getEdit'] );
	Route::get('teacher/add/{itemId}', 'TeacherController@getAdd' );
	Route::controller('teacher', 'TeacherController');
	
});

Route::group(array('before' => 'auth|checkEmptyPassword|hasAddLeader'), function()
{
	Route::controller('student', 'StudentController');
});



////////////////////////admin//////////////////

Route::group(array('prefix' => 'admin', 'before'=>'auth|isAdmin'), function()
{

	Route::get('/', 'AdminMainController@index');
	Route::controller('user','AdminUserController');

	Route::get('item/edit/{id}', ['as'=>'itemEdit', 'uses'=> 'AdminItemController@getEdit'] );
	Route::controller('item','AdminItemController');

	Route::get('group/edit/{id}', ['as'=>'groupEdit', 'uses'=> 'AdminGroupController@getEdit'] );
	Route::controller('group','AdminGroupController');
	
	Route::controller('student', 'AdminStudentController');
	
	Route::controller('sys', 'AdminSysController');
	
});