<?php

class BaseModel extends Eloquent {
	
//	public $userId;
	
	public function __construct() {
		parent::__construct();
	
//		if (!Auth::guest()) {
//			$this->userId = Auth::user()->id;
//		}
	}

}