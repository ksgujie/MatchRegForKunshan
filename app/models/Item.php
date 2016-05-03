<?php

class Item extends BaseModel {
	
	public $timestamps=false;

// 	protected $table = 'users';

	
	public static $rules = array(
		'name'	=>	'required',		
	);
	
	public static function getall() {
		$rs=Item::all();
		$items['']='请选择';
		foreach ($rs as $row) {
			$items[$row->id]=$row->name;
		}
		if(count($items)<=2) {
			unset($items['']);
		}
		return (array)$items;
	}
	
	public function teacher() {
// 		return $this->hasOne('Teacher', 'item_id', 'user_id');
		return Teacher::where('user_id', Auth::user()->id)->
							  where('item_id', $this->id)->first();
	}

	public function students() { 
		return $this->hasMany('Student');
	}
	
	
}