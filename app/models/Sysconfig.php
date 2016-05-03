<?php

class Sysconfig extends BaseModel {
	
	public $timestamps=false;

// 	protected $table = 'users';

	public static function get($key) {
		return Sysconfig::find($key)->value;
	}
	
	public static function getAll() {
		$rs=Sysconfig::all();
		$r=array();
		foreach ($rs as $row) {
			$r[$row->id]=$row->value;
		}
		return (array)$r;
	}
	
	public static function saveAll($values) {
		foreach ($values as $id=>$value) {
			if ($cfg = Sysconfig::find($id)) {
				$cfg->value=$value;
				$cfg->save();
			} else {
				$cfg = new Sysconfig();
				$cfg->id = $id;
				$cfg->value = $value;
				$cfg->save();
			}
		}
	}

}