<?php

class Group extends BaseModel {
	
	public $timestamps=false;

// 	protected $table = 'users';

	
	public static $rules = array(
		'name'	=>	'required',		
	);
	
	public static function getall() {
		$rs=Group::all();
		$r['']='请选择';
		foreach ($rs as $row) {
			$r[$row->id]=$row->name;
		}
		if(count($r)<=2) {
			unset($r['']);
		}
		return (array)$r;
	}

}