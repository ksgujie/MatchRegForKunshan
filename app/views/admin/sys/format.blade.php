@extends('layouts.admin.main')

@section('content')


<div id="main_body">    

    <table class="tb">
        <tr>
            <th colspan="2"><h3>警告：危险！！！</h3></th>
        </tr>
        <tr>
            <td colspan="2">
        <div>初始化后系统中的数据将全部清空，所有帐号密码将初始化为空密码！！<div>
        <div> {{HTML::link('admin/sys/doformat', '@@开始初始化@@')}} </div>
        	</td> 
        </tr>
    </table>
</div>

@stop