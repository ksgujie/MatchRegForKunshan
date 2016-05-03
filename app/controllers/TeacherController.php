<?php

use Illuminate\Support\Facades\Redirect;
class TeacherController extends BaseController {

	public function getAdd($itemId)
	{
		return View::make('teacher.add')->with('itemId', $itemId);
	}
	

	public function postAdd() {
		$input = array_map('trim', Input::all());
		$valication = Validator::make($input, Teacher::$rulesAdd);
		if ($valication->passes() ) {
			if ( !$teacher = Teacher::where('user_id', Auth::user()->id)->where('item_id', Input::get('item_id'))->first() ) {
				$teacher = new Teacher();
				$teacher->user_id = Auth::user()->id;
				$teacher->save();
			}
				
	
			Teacher::where('id', $teacher->id)
				->where('user_id', $this->userId)
				->update( array_except($input, '_token') );
				
			return Redirect::to('teacher/list')->with('message', '教练添加成功！');
		}
	
		return Redirect::to('teacher/add/'.$input['item_id'])->withErrors($valication)->withInput();
	
	}
	

	public function postEdit($id) {
		$input = array_map('trim', Input::all());
		$valication = Validator::make($input, Teacher::$rulesEdit);
		if ($valication->passes() ) {
			Teacher::where('id', $id)
				->where('user_id', $this->userId)
				->update( array_except($input, '_token') );
			return Redirect::to('teacher/list')->with('message', '教练修改成功！');
		}
	
		return Redirect::to('teacher/edit/'.$id)->withErrors($valication)->withInput();
	
	}
	
	public function getDel($id) {
        if (Student::where('item_id', Teacher::find($id)->item_id)
            ->where('user_id', $this->userId)
            ->first()
        ) {
            return Redirect::to('teacher/list')->with('danger', '你校有学生参加该项目的比赛，不能删除该项目的教练！');
        }
		Teacher::where('id', $id)
			->where('user_id', $this->userId)
			->delete();
		return Redirect::to('teacher/list')->with('message', '删除成功！');
	}
	
	public function getList() {
		$items = Item::all();
		return View::make('teacher.list')->with('items', $items);
	}
	
	public function getEdit($id) {
		return View::make('teacher.edit')->with('teacher', Teacher::where('user_id', $this->userId)->find($id));
	}
	
	public function getTest() {
		echo '<pre>';
		$item = Item::find(3);
		print_r($item);
		$rs=$item->teacher();
		dd($rs);
		foreach ($rs as $v) {
			print_r($v->name);
		}
	}

}