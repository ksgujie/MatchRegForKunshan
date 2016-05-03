<?php

class AdminMainController extends AdminController {
	
	public function Index() {
		return View::make('admin.index');
	}

}