@extends('layouts.admin.main')

@section('content')

<div id="main_body">    

<!-- @if ($errors->any()) -->
<!-- 	<ul> -->
<!-- 		{{ implode('', $errors->all('<li class="error">:message</li>')) }} -->
<!-- 	</ul> -->
<!-- @endif -->

    {{Form::open()}}
    <table class="tb">
        <tr>
            <th colspan="2"><h3>设置管理密码</h3></th>
        </tr>
        <tr>
            <td class="td_w120">管理密码</td>
          <td>
         
          {{Form::text('password')}}
          <div style='color:red'>{{$errors->first('password')}}</div>
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


</div>

@stop