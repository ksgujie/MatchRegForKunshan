<?php
include app_path().'/libs/FormHelper.class.php';

class AdminSysController extends AdminController {

	public function getConfig() {
		$formset = FormHelper::formset(Sysconfig::getAll());
		return View::make('admin.sys.config')->with('formset', $formset);
	}
	
	public function postConfig() {
		Sysconfig::saveAll(Input::except('_token'));
		return Redirect::to('admin/sys/config')->with('message', '设置保存成功！');
	}
	
	public function getFormat() {
		return View::make('admin.sys.format');
	}
	
	public function getDoformat() {
		DB::select('TRUNCATE groups');
		DB::select('TRUNCATE items');
		DB::select('TRUNCATE students');
		DB::select('TRUNCATE teachers');
		DB::update("update users set password=?, leader='', tel='', address='', diners='0', limitItemMax='1' where isadmin='0'", [Hash::make('')]);
		return Redirect::to('admin/sys/format')->with('message', '初始化成功！！所有帐号密码都为空。');
	}
}