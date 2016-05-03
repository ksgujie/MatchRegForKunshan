<?php

use Illuminate\Support\Facades\Redirect;
class AdminItemController extends AdminController {
	
	public function getList() {
		$items = Item::all();
		return View::make('admin.item.list')->with('items',$items);
	}
	
	public function postAdd() {
		$input = Input::all ();
		$validation = Validator::make ( $input, Item::$rules );
	
		if ($validation->passes ()) {
				
			$item = new Item();
			$item->name = trim(Input::get('name'));
			$item->type = trim(Input::get('type'));
			$item->max = trim(Input::get('max'));
			$item->save ();
			return Redirect::to ( 'admin/item/list' )->with('message', '项目添加成功!');
		}
	
		return Redirect::to('admin/item/list')->withErrors($validation);
	}

	public function getDel($id) {
		Item::find($id)->delete();
		return Redirect::to ( 'admin/item/list' )->with('message', '删除项目成功!');
	}
	
	public function getEdit($id) {
		$item = Item::find($id);
		return View::make('admin.item.edit')->with('item', $item);
	}
	
	public function postEdit($id) {
		$name = trim(Input::get('name'));
		$item = Item::find($id);
		$item->name = $name;
		$item->type = trim(Input::get('type'));
		$item->max = trim(Input::get('max'));
		$item->save();
		return Redirect::to('admin/item/list')->with('message', '修改成功！');
	}
	
}