@extends('layouts.admin.main')

@section('content')

<div id="main_body">    

    {{Form::model($group, ['route'=>["groupEdit", $group->id] ])}}
    <table class="tb">
        <tr>
            <th colspan="2"><h3>修改组别</h3></th>
        </tr>
        <tr>
            <td class="td_w120">组别名称</td>
          <td>
         
          {{Form::text('name')}}
          {{Form::submit('保存修改')}}
          <div style='color:red'>{{$errors->first('name')}}</div>
          </td>
        </tr>
        <tr>
            <td class="td_w120"></td>
            <td>
            
            </td>
        </tr>
    </table>
  {{Form::close()}}



</div>

@stop