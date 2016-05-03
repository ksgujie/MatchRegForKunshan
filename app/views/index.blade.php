
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>昆山科技竞赛报名系统</title> {{HTML::style('css/reset.css')}}
{{HTML::style('css/style.css')}}

<script>
if(top!=this){
　window.parent.location.href='./';
}
</script>
</head>

<body>

	<!-- 头部 -->
	<div id="top">
		<em> 昆山科技竞赛报名系统 </em> <span class='user'> &nbsp;&nbsp;&nbsp;&nbsp;
			{{Auth::user()->username}}</span> 
	</div>

	<!-- 左菜单 -->
	<div id="left">
		<div class="menu_box">

			<div class="menu_block">
				<h3 class="menu_block_h">比赛报名</h3>
				<ul class="menu_block_ul">
					<li>{{HTML::link('user/leader/edit','领队/用餐')}}</li>
					<li>{{HTML::link('teacher/list','添加教练')}}</li>
					<li>{{HTML::link('student/add','新报名')}}</li>
					<li>{{HTML::link('student/list','已报名')}}</li>

				</ul>
			</div>
			<div class="menu_block">
				<h3 class="menu_block_h">用户管理</h3>
				<ul class="menu_block_ul">
					<li>{{HTML::link('user/editpwd','设置密码')}}</li>
					<li>{{HTML::link('user/logout','退出',['target'=>"_top"])}}</li>
				</ul>
			</div>

		</div>
	</div>

	<!-- 右边主体 -->
	<div id="right">
		<iframe id="main" frameborder="0" src=""></iframe>
	</div>

	<!-- js -->
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript">
$(document).ready(function(e) {
    // 高度自适应
	function auto_width_height() {
		var auto_width = $(window).width()- $('#left').outerWidth();
		var auto_height = $(window).height() - $('#top').outerHeight();
		$('#left').css('height', auto_height);
		$('#main').css({"width": auto_width, "height": auto_height});
	}
	auto_width_height();
	$(window).resize(function(e) {
        auto_width_height();
    });
	
	// 菜单开关效果
	$(".menu_block_h").click(function() {
		if($(this).attr("class") == 'menu_block_h') {
			$(this).addClass("close");
			$(this).parent(".menu_block").children(".menu_block_ul").addClass("none");
		} else {
			$(this).removeClass("close");
			$(this).parent(".menu_block").children(".menu_block_ul").removeClass("none");
		}
	});
	
	// 加载默认首页（默认加载菜单第一个链接）
	$('.menu_block_ul li a').eq(0).addClass('cur');
	$('#main').attr('src', $('.menu_block_ul li a').eq(0).attr('href'));
	
	// 点击菜单，iframe加载新页面
	$('.menu_block_ul li a').click(function(e) {
        $('.menu_block_ul li a').removeClass('cur');
		$(this).addClass('cur');
		$('#main').attr('src', $(this).attr('href'));
		return false;
    });
});
</script>

</body>
</html>