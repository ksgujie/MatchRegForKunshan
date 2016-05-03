<?php

use Illuminate\Support\Facades\Redirect;
class StudentController extends BaseController {
	
// 	protected $fillable = ['*'];

	public function getAdd()
	{
		return View::make('student.add');
	}
	
	public function postAdd() {
		$input = Input::all();

		$rules = Student::$rules;
		$item = Item::find((int)Input::get('item_id'));
	    if ($item) {
			if ($item->type=='个人项目') {
				$rules['name'] = 'required|max:4';
			}
		}

		$valication = Validator::make($input, $rules, Student::$messages);
		if ($valication->passes() ) {
			/////////begin 检测是否超过限制报名人数/////////////
			//print_r($item);die;
    	    if (Auth::user()->limitItemMax && $item->max) {
    	        $count = Student::whereRaw("user_id=? and item_id=? and group_id=?", [Auth::user()->id, $item->id, Input::get('group_id')])->count();
    	        if ($count >= $item->max) {
    	            return Redirect::to('student/add')->with('danger', "操作失败！{$item->name} 最多只能报{$item->max}人！")->withInput();
    	        }
    	    }
	        /////////end 检测是否超过限制报名人数//////////////
	        
			$student = new Student();
			$student->user_id = Auth::user()->id;
			$student->group_id = Input::get('group_id');
			$student->item_id = Input::get('item_id');
			$student->name = trim( Input::get('name') );
			$student->remark = trim( Input::get('remark') );
			$student->save();
	
			return Redirect::to('student/add')->with('message', "选手 {$student->name} 添加成功！");
		}
	
		return Redirect::to('student/add/')->withErrors($valication)->withInput();
	}
	
	public function getList() {
		$students = Student::where('user_id', $this->userId)
			->orderBy('item_id')
			->orderBy('group_id')
			->get();
		return View::make('student.list')->with('students', $students );
	}
	
	public function getEdit($id) {
		$student = Student::where('id',$id)
			->where('user_id', $this->userId)
			->first();
		return View::make('student.edit')->with('student', $student );
	}
	
	public function postEdit($id) {
		$input = Input::all();
		
		$rules = Student::$rules;
		$item = Item::find((int)Input::get('item_id'));
		if ($item) {
			if ($item->type=='个人项目') {
				$rules['name'] = 'required|max:4';
			}
		}

		$valication = Validator::make($input, $rules, Student::$messages);
		if ($valication->passes() ) {
			$student = Student::where('id',$id)
				->where('user_id', $this->userId)
				->first();
			$student->group_id = Input::get('group_id');
			$student->item_id = Input::get('item_id');
			$student->name = trim( Input::get('name') );
			$student->remark = trim( Input::get('remark') );
			$student->save();
	
			return Redirect::to('student/list')->with('message', "选手 {$student->name} 修改成功！");
		}
	
		return Redirect::to('student/edit/'.$id)->withErrors($valication)->withInput();
	}
	
	public function getDel($id) {
		Student::where('id', $id)->where('user_id', Auth::user()->id)->delete();
		return Redirect::to('student/list')->with('message', '选手删除成功!');
	}
	
	public function getTest() {
		echo '<pre>';
		$item = Item::find(3);
		print_r($item);
		$rs=$item->student();
		dd($rs);
		foreach ($rs as $v) {
			print_r($v->name);
		}
	}

}