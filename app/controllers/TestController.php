<?php


class TestController extends BaseController {
	
// 	public $layout = 'layout/user';

	public function getImportusers()
	{
		$users = file(app_path().'/users.txt');
        foreach ($users as $line) {
            $line = trim($line);
            $a = explode("\t", $line);
            $name=$a[0];
            $type=$a[1];
            $user = new User;
            $user->username=$name;
            $user->type = $type;
            $user->password = Hash::make('');
            $user->isadmin = 0;
            $user->save();
            echo "$name\t$type\n";
        }

        echo 'ok';
    }

}