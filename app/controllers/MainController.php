<?php

class MainController extends BaseController {
	
	public function Index() {
		if (Auth::user()->isadmin=='1') {
			return Redirect::to('admin');
		}
		return View::make('index');
	}

}