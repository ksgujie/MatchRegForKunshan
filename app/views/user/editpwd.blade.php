@extends('layouts.main')

@section('content')

<div id="main_body">    
	<!-- 增加某一项配置时，请注意name值对应数据库的字段，才能更新 -->
	
    {{Form::open()}}
    <table class="tb">
        <tr>
            <th colspan="2"><h3>设置密码</h3></th>
        </tr>
        <tr>
            <td class="td_w120">登陆密码</td>
          <td>
         
          {{Form::text('password')}}
          {{ $errors->first('password', '<div style="color: red">:message</div>') }}
          </td>
        </tr>
        <tr>
            <td class="td_w120"></td>
            <td>
            {{Form::submit('确定')}}
            </td>
        </tr>
    </table>
  {{Form::close()}}

·
</div>

@stop