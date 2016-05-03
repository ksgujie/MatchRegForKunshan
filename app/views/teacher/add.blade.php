@extends('layouts.main')

@section('content')

<div id="main_body">    
	
    {{Form::open(['url'=>'teacher/add'])}}
      <table class="tb">
        <tr>
            <th colspan="2"><h3>添加教练</h3></th>
        </tr>
        
        <tr>
          <td class="td_w120">项目</td>
            <td>{{ Form::select('item_id', Item::getall() , $itemId) }}
            	
            </td>
        </tr>        
        <tr>
          <td class="td_w120">姓名</td>
            <td>{{ Form::text('name') }}
            	{{ $errors->first('name', '<div style="color:red">:message</div>') }}
                <div style="color:blue">姓名中不要加空格，如果有两名教练，用空格间隔。例：张三 李四</div>
            </td>
        </tr>
        <tr>
          <td class="td_w120">电话</td>
          <td>{{ Form::text('tel') }}
            	{{ $errors->first('tel', '<div style="color:red">:message</div>') }}
                <div style="color:blue">同上</div>
          </td>
        </tr>

        <tr>
          <td class="td_w120"></td>
          <td>{{ Form::submit('保存') }}
        
          </td>
        </tr>
    </table>
  {{Form::close()}}

</div>

@stop