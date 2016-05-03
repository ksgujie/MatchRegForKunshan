<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>测试</title>
{{HTML::style('css/bootstrap.css')}}
{{HTML::style('css/bootstrap-theme.css')}}
{{HTML::style('css/reset.css')}}
{{HTML::style('css/main.css')}}

{{HTML::script('js/bootstrap.min.js')}}
{{HTML::script('js/jquery.min.js')}}

<style>
	td {line-height:30px;}
</style>

</head>

<body>
	@include('_message')
	@yield('content')
	
</body>
</html>