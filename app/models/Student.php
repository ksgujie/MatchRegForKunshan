<?php

class Student extends BaseModel {
	
// 	public $timestamps=false;

// 	protected $table = 'users';

	
	public static $rules = array(
		'name'		=>	'required|min:2',		
		'item_id'	=>	'required|isItemHasTeacher',		
		'group_id'	=>	'required',		
	);
	
	public static $messages = array(
		'is_item_has_teacher'	=>	'该项目的教练尚未添加，请先添加教练才能选择该项目 ！',
		'name.max' => '参加个人项目的学生需逐个报名，姓名长度不得超过4个汉字',
		'name.min' => '姓名至少2个汉字',
	);
	
	public function group() {
		return $this->belongsTo('Group');
	}
	
	public function item() {
		return $this->belongsTo('Item');
	}
	
	public function user() {
		return $this->belongsTo('User');
	}
	
	public function teacher() {
		return Teacher::where('user_id', $this->user_id)
			->where('item_id', $this->item_id)
			->first();
	}

}