<?php

class AdminGroupController extends AdminController {
	
	public function getList() {
		$groups = Group::all();
		return View::make('admin.group.list')->with('groups',$groups);
	}
	
	public function postAdd() {
		$input = Input::all ();
		$validation = Validator::make ( $input, Group::$rules );
	
		if ($validation->passes ()) {
				
			$group = new group();
			$group->name = trim(Input::get('name'));
			$group->save ();
			return Redirect::to ( 'admin/group/list' )->with('message', '组别添加成功!');
		}
	
		return Redirect::to('admin/group/list')->withErrors($validation);
	}

	public function getDel($id) {
		Group::find($id)->delete();
		return Redirect::to ( 'admin/group/list' )->with('message', '删除组别成功!');
	}
	
	public function getEdit($id) {
		$group = Group::find($id);
		return View::make('admin.group.edit')->with('group', $group);
	}
	
	public function postEdit($id) {
		$name = trim(Input::get('name'));
		$group = Group::find($id);
		$group->name = $name;
		$group->save();
		return Redirect::to('admin/group/list')->with('message', '修改成功！');
	}
	
}