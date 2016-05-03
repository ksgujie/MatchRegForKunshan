<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>登录 - 昆山科技竞赛报名系统</title>

<script>
	if( window.top != window.self ){
		top.location.href=window.self;
		
     }
</script>

{{HTML::style('css/bootstrap.css')}}
{{HTML::style('css/bootstrap-theme.css')}}
{{HTML::style('css/reset.css')}}
{{HTML::style('css/login.css')}}
{{HTML::script('js/bootstrap.min.js')}}
{{HTML::script('js/jquery.min.js')}}

</head>

<body>

<div style="width:500px; margin:0 auto">
	@include("_message")
</div>

<!-- 登陆外围 -->
<div id="login_wrap">
    
    {{Form::open()}}
   <h1>登 录</h1> 
	  	学校{{Form::select('id', User::getAll(), null, ['style'=>'width:100%;'] )}}
	  	
	  	密码{{Form::password('password', ['style'=>'width:100%;', 'placeholder'=>'密 码'])}}
	  {{Form::submit('登 录')}}

  {{Form::close()}}
    
    <br><br>
    已报名 {{Student::count()}} 人
    <br><br>
</div>


</body>
</html>