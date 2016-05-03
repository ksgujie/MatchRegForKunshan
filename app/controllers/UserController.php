<?php


class UserController extends BaseController {
	
// 	public $layout = 'layout/user';

	public function getLogin()
	{
		$this->layout = '';
		if (Sysconfig::get('siteClosed')==1) {
			Session::flash('danger', '系统已关闭！');
		}
		if (Sysconfig::get('siteClosed')==2) {
			$closeTime = strtotime(Sysconfig::get('siteCloseTime'));
			if (time()>=$closeTime) {
				Session::flash('danger', '系统已关闭！');
			}
		}
		
		$info = Sysconfig::get('info');
		if ($info) {
			Session::flash('message', nl2br($info));
		}
		
		return View::make('user.login');
	}
	
	public function postLogin() {
		if ( Auth::attempt(['id'=>Input::get('id'), 'password'=>Input::get('password')], false) ) {
			if (Auth::user()->isadmin==1) {
				return Redirect::to('admin');
			} else {
				return Redirect::to('/');
			}
		} else {
			return Redirect::to('user/login')->with('danger', '密码错误！');
		}
	}
	
	
	public function getLogout() {
		Auth::logout();
		return Redirect::to('/');
	}
	
	public function getEditpwd() {
		return View::make('user.editpwd');
	}
	
	public function postEditpwd() {
		$user = Auth::user();
		$valication = Validator::make(Input::all(), ['password'=>'required']);
		if ($valication->passes() ) {
			$user->password=Hash::make(Input::get('password'));
			$user->save();
			return Redirect::to('user/editpwd')->with('message', '密码设置成功！');
		} 
		
		return Redirect::to('user/editpwd')->withErrors($valication);

	}
	
	public function getLeader() {
		return View::make('user.leader');
	}
	
	
	public function getEditLeader() {
		$user = Auth::user();
		return View::make('user.editleader')->with('user', $user);
	}
	
	public function postEditLeader() {
		$input = Input::all();
		$validation = Validator::make($input, User::$rulesLeader);
		if ($validation->fails()) {
			return Redirect::to('user/leader/edit')->withErrors($validation)->withInput();
		}
		
		$user = Auth::user();
		$user->leader = trim(Input::get('leader'));
		$user->address = trim(Input::get('address'));
		$user->tel = trim(Input::get('tel'));
		$user->diners = Input::get('diners');
		$user->save();
		return Redirect::to('user/leader')->with('message', '领队信息保存成功！');
	}



}