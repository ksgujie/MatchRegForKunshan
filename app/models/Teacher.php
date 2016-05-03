<?php

class Teacher extends BaseModel {
	
	public $timestamps=false;

 	protected $fillable = ['*'];


 	public static $rulesAdd = array(
 			'name'	=>	'required',
 			'tel'	=>	'required',
 			'item_id'	=>	'required',
 	);

 	public static $rulesEdit = array(
 			'name'	=>	'required',
 			'tel'	=>	'required',
//  			'item_id'	=>	'required',
 	);
 	

	public function item() {
		return $this->belongsTo('Item');
// 		return Item::find($this->item_id);
	}
	
	public function user() {
		return $this->belongsTo('User');
	}
	

}