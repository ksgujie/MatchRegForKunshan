<?php

use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Redirect;
/*
|--------------------------------------------------------------------------
| Application & Route Filters
|--------------------------------------------------------------------------
|
| Below you will find the "before" and "after" events for the application
| which may be used to do any work before or after a request into your
| application. Here you may also register your custom route filters.
|
*/

App::before(function($request)
{


});


App::after(function($request, $response)
{
// 	echo '<pre>';	print_r(DB::getQueryLog());	echo '</pre>';
});

/*
|--------------------------------------------------------------------------
| Authentication Filters
|--------------------------------------------------------------------------
|
| The following filters are used to verify that the user of the current
| session is logged into this application. The "basic" filter easily
| integrates HTTP Basic authentication for quick, simple checking.
|
*/

Route::filter('checkEmptyPassword', function()
{
	if (!Auth::guest()) {
		if ( Hash::check('', Auth::user()->password) ) {
			//dd('hello world');
			return Redirect::to('user/editpwd')->with('danger', '您的密码还是空密码，请先设置新密码才能进行其它操作！！');
		}
	}
});


Route::filter('hasAddLeader', function()
{
	if (Auth::user()->leader=='') {
		return Redirect::to('user/leader/edit')->with('danger','在报名前必须先完善领队信息！');
	}
});


Route::filter('isAdmin', function()
{
	if (Auth::user()->isadmin!=1) {
		Auth::logout();
		return Redirect::to('user/login');
	}
});


Route::filter('auth', function()
{
// 	dd(Auth::user());
	if (Auth::guest()) {
		return Redirect::guest('user/login');
	}

    //检测系统是否已关闭
    if (Auth::user()->isadmin==0) {
        $siteClosed = Sysconfig::get('siteClosed');
        //手工关闭
        if ($siteClosed==1) {
            Auth::logout();
            return Redirect::to('user/login')->with('danger', '报名系统已经关闭！！');
        }
        //自动关闭
		if ($siteClosed==2) {
			$closeTime = strtotime(Sysconfig::get('siteCloseTime'));
			if (time()>=$closeTime) {
	            return Redirect::to('user/login')->with('danger', '报名系统已经关闭！！');
			}
		}        
    }
});


Route::filter('auth.basic', function()
{
	return Auth::basic();
});

/*
|--------------------------------------------------------------------------
| Guest Filter
|--------------------------------------------------------------------------
|
| The "guest" filter is the counterpart of the authentication filters as
| it simply checks that the current user is not logged in. A redirect
| response will be issued if they are, which you may freely change.
|
*/

Route::filter('guest', function()
{
	if (Auth::check()) return Redirect::to('/');
});

/*
|--------------------------------------------------------------------------
| CSRF Protection Filter
|--------------------------------------------------------------------------
|
| The CSRF filter is responsible for protecting your application against
| cross-site request forgery attacks. If this special token in a user
| session does not match the one given in this request, we'll bail.
|
*/

Route::filter('csrf', function()
{
	if (Session::token() != Input::get('_token'))
	{
		throw new Illuminate\Session\TokenMismatchException;
	}
});