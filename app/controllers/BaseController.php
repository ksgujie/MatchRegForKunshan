<?php

class BaseController extends Controller {
	
	public $userId;
	
	public function __construct() {
// 		parent::__construct();
		
		if (!Auth::guest()) {
			$this->userId = Auth::user()->id;
		}
	}

	/**
	 * Setup the layout used by the controller.
	 *
	 * @return void
	 */
	protected function setupLayout()
	{
		if ( ! is_null($this->layout))
		{
			$this->layout = View::make($this->layout);
		}
	}
	

}