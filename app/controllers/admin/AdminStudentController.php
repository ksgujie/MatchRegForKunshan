<?php

class AdminStudentController extends AdminController {
	
	public function getLogout() {
		Auth::logout ();
		return Redirect::to ( '/' );
	}
	
	public function getList() {
		
		$students = Student::orderBy('item_id')
			->orderBy('user_id')
			->orderBy('group_id')
			->get();
// 		dd($students);

		return View::make('admin.student.list')->with('students', $students);
	}
	
	//秩序册名单
	public function getStudents4cxc()
	{
		$users = User::where('isAdmin',0)->orderBy('type', 'desc')->get();
		$txt='';
		$n=1;
		foreach ($users as $user) {
			if (Student::where('user_id', $user->id)->get()->toarray()) {
				//教练名单
				$teachers = Teacher::where('user_id', $user->id)->get();
				$arrTeachers = [];
				foreach ($teachers as $teacher) {
					$name = trim($teacher->name);
					$names = preg_split('/\s+/', $name);
					foreach ($names as $_name) {
    					if (mb_strlen($_name)==2) {
    					    $_name = mb_substr($_name, 0, 1) . '　' . mb_substr($_name, 1, 1);
    					}
						$arrTeachers[] = $_name;
					}
				}
				$arrTeachers = array_unique($arrTeachers);
				$txt .= "$n.{$user->username}\n领　队：{$user->leader}\t教　练：" . join(" ", $arrTeachers) . "\n";
				//学生
				$students = Student::where('user_id', $user->id)->get();
				$arrStudents = [];
				foreach ($students as $student) {
					$name = trim($student->name);
					$names = preg_split('/\s+/', $name);

					foreach ($names as $_name) {
    					if (mb_strlen($_name)==2) {
    					    $_name = mb_substr($_name, 0, 1) . '　' . mb_substr($_name, 1, 1);
    					}
					    $arrStudents[] = $_name;
					}
				}
				$arrStudents=array_unique($arrStudents);
				$txt .= "运动员：" . join(" ", $arrStudents) . "\n\n";
				$n++;
			}
		}

		
		echo "<pre>\n\n";
		echo $txt;
	}
		
	
	public function getExport() {
		set_include_path ( app_path () . '/libs/PEAR/' );
		include_once ('Spreadsheet/Excel/Writer.php');
		if (is_file(storage_path () . '/data.xls')) unlink(storage_path () . '/data.xls');
		$workbook = new Spreadsheet_Excel_Writer_Workbook ( storage_path () . '/data.xls' );
		
		//学生
		$worksheet = $workbook->addWorkSheet ( gbk ('选手名单') );		
		$worksheet->writeRow( 0, 0, array_map('gbk', ['报名ID','姓名','项目','组别','参赛队','学校类别','备注', '教练', '教练电话','报名时间']) );
	
		$students = Student::orderBy('user_id')
			->orderBy('item_id')
			->orderBy('group_id')
			->get();

		$n=1;
		foreach ($students as $s) {
//            dd($s->teacher()->name);
			$row = [$s->id,
                $s->name,
                $s->item->name,
                $s->group->name,
                $s->user->username,
                $s->user->type,
                $s->remark,
                $s->teacher()->name,
                $s->teacher()->tel,
                $s->updated_at,
            ];
			$worksheet->writeRow( $n, 0,  array_map('gbk', $row) );
			$n++;			
		}	
		
		//领队
		$sheetLeader = $workbook->addWorkSheet ( gbk ('领队') );
		$sheetLeader->writeRow( 0, 0, array_map('gbk', ['序号','学校','地址','领队','领队电话','用餐人数']) );
		$users = User::where('isadmin',0)
			->where('leader','!=','')
			->orderBy('type')
			->orderBy('id')
			->get();
		$n=1;
		foreach ($users as $u) {
			$row = [$n, $u->username, $u->address, $u->leader, $u->tel, $u->diners];
			$sheetLeader->writeRow( $n, 0,  array_map('gbk', $row) );
			$n++;			
		}
		
		//教练
		$sheetTeacher = $workbook->addWorkSheet ( gbk ('教练') );
		$sheetTeacher->writeRow( 0, 0, array_map('gbk', ['序号','学校','项目','教练','电话']) );
		$teachers = Teacher::orderBy('user_id')->orderBy('item_id')->get();
		$n=1;
		foreach ($teachers as $u) {
			$row = [$n, $u->user->username, $u->item->name, $u->name, $u->tel];
			$sheetTeacher->writeRow( $n, 0,  array_map('gbk', $row) );
			$n++;			
		}
		
		
		$workbook->close ();
		
		return Response::download(
				storage_path().DIRECTORY_SEPARATOR.'data.xls',
				'Students.xls',
				["Expires:-1","Cache-Control:no-cache","Pragma:no-cache"]
		);
		
	}
	
	public function getStatistics() {
		//学生总人数
		$studentsCount = count(Student::all());
		//分项目
		$items = Item::all();
		//已报名、未报名学校
		$users = User::where('isadmin', 0)->orderBy('type')->orderby('id')->get();
		
		$signupSchools = $unsignupSchools = array();
		foreach ($users as $user) {
			if ( $user->students->count() ) {
				$signupSchools[] = $user;
			} else {
				$unsignupSchools[] = $user;
			}
		}
		
		return View::make('admin.student.statistics')
			->with('studentsCount', $studentsCount)
			->with('items', $items)
			->with('signupSchools', $signupSchools)
			->with('unsignupSchools', $unsignupSchools);
	}
	
	public function getTest() {
		dd(User::find(2)->students);
	}
	
	
}