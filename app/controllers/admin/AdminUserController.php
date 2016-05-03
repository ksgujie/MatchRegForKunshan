<?php

use Illuminate\Support\Facades\Redirect;
class AdminUserController extends AdminController {
	
	// public $layout = 'layout/user';
	public function getLogout() {
		Auth::logout ();
		return Redirect::to ( '/' );
	}
	
	public function getEditpwd() {
		return View::make ( 'admin.user.editpwd' );
	}
	
	public function postEditpwd() {
		$input = Input::all ();
		$validation = Validator::make ( $input, ['password'=>'required'] );
		
		if ($validation->passes ()) {
			
			$user = Auth::user ();
			$user->password = Hash::make ( Input::get ( 'password' ) );
			$user->save ();
			return Redirect::to ( 'admin/user/editpwd' )->with('message', '密码修改成功!');
		}
		
		return Redirect::to('admin/user/editpwd')->withErrors($validation);
	}
	
	public function getList() {
		$users = User::where('isadmin',0)->get();
		foreach ($users as $user) {
			$users2[$user->type][]=$user;
		}
		return View::make('admin.user.list')->with('users', $users2);
	}
	
	public function getResetpwd($id) {
		$user = User::find($id);
		$user->password = Hash::make('');
		$user->save();
		
		return Redirect::to('admin/user/list')->with('message', $user->username . ' 的密码已置为空密码！');
	}
	
	//限制项目报名人数
	public function getSetlimititemmax($id) {
	    $user = User::find($id);
	    if ($user->limitItemMax)
	        $user->limitItemMax = 0;
	    else 
	        $user->limitItemMax = 1;
	   $user->save();
	   return Redirect::to('admin/user/list')->with('message', $user->username . ' 操作成功！');
	}

    public function getImport() {
        $usersString['小学']='实验小学,培本实验小学,一中心小学,朝阳小学,司徒街小学,西塘街小学,开发区实验小学,城北中心校,高科园小学,裕元小学,新镇中心校,正仪中心校,巴城中心校,石牌中心校,周市中心校,陆杨中心校,晨曦小学,蓬朗中心校,陆家中心校,花桥中心校,千灯中心校,石浦中心校,锦溪中心校,淀山湖中心校,南港中心校,周庄中心校,大市中心校,三中心小学,中华园小学,爱心学校,华东台商子女学校,柏庐实验小学,张浦中心校,包桥小学,玉峰实验学校,花桥徐公桥小学,昆山国际学校,振华实验小学,炎武小学,正仪黄泥山小学,娄江实验学校,同心小学,周巷小学,世贸小学,蝶湖湾小学';
        $usersString['中学'] = '市二中,葛江中学,玉山中学,青阳港学校,城北中学,正仪中学,费俊龙中学,新镇中学,周市中学,石牌中学,蓬朗中学,兵希中学,石浦中学,花桥中学,张浦中学,周庄中学,锦溪中学,吴淞江学校,淀山湖中学,亭林中学,昆山中学,震川中学,开发区高级中学,市一中,陆家高级中学,陆家中学,昆山电大,第一中等专业学校,第二中等专业学校,玉山成校,周庄成校,张浦成校,青少年宫,巴城成校,教师进修学校,商务城中等专业学校,国际学校,秀峰中学,交大南洋附属学校,前景学校,鹿峰中学,文峰高级中学,珠江学校,开发区国际学校';
        foreach ($usersString as $type => $userString) {
            $users = explode(',', $userString);
            $registedUsers = [];
            foreach ($users as $user) {
                if (!in_array($user, $registedUsers)) {
                    User::create([
                        'username'=>$user,
                        'password'=>Hash::make(''),
                        'leader'=>'',
                        'address'=>'',
                        'tel'=>'',
                        'diners'=>0,
                        'type'=>$type,
                        'isadmin'=>0,
                    ]);
                    $registedUsers[]=$user;
                    echo $user;
                }

            }
        }
        return '完成';
    }
}