<?php

use Illuminate\Auth\UserInterface;
use Illuminate\Auth\Reminders\RemindableInterface;

class User extends Eloquent implements UserInterface, RemindableInterface {
	
	public $timestamps=false;

    protected $guarded=[];

	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'users';

	/**
	 * The attributes excluded from the model's JSON form.
	 *
	 * @var array
	 */
	protected $hidden = array('password');
	
	public static $rulesLeader = array(
// 		'password'	=>	'required',
		'leader'		=>	'required',
		'address'	=>	'required',
		'tel'			=>	'required',
		'diners'			=>	'numeric',
	);

	/**
	 * Get the unique identifier for the user.
	 *
	 * @return mixed
	 */
	public function getAuthIdentifier()
	{
		return $this->getKey();
	}

	/**
	 * Get the password for the user.
	 *
	 * @return string
	 */
	public function getAuthPassword()
	{
		return $this->password;
	}

	/**
	 * Get the e-mail address where password reminders are sent.
	 *
	 * @return string
	 */
	public function getReminderEmail()
	{
		return $this->email;
	}
	
	public static function getAll() {
		$users=User::orderby('username','desc')->get();
		$r[]='请选择帐号';
// 		$r['admin']='管理员';
		foreach ($users as $user) {
			$r[$user->type][$user->id]=$user->username;
		}
		
		$rr[]=$r[0];
		$rr['管理员']=$r['管理员'];
        $rr['小学']=$r['小学'];
        $rr['初中']=$r['初中'];
        $rr['中小学']=$r['中小学'];
        $rr['幼儿园']=$r['幼儿园'];
        $rr['高中']=$r['高中'];
        $rr['中职']=$r['中职'];
		return $rr;
	}

	public function students() {
		return $this->hasMany('Student');
	}


	

}