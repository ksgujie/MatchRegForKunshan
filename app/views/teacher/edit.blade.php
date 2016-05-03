@extends('layouts.main')

@section('content')

<div id="main_body">    
	
    {{Form::model($teacher)}}
      <table class="tb">
        <tr>
            <th colspan="2"><h3>修改教练</h3></th>
        </tr>
        
        <tr>
          <td class="td_w120">项目</td>
            <td>{{ $teacher->item->name }}
            </td>
        </tr>        
        <tr>
          <td class="td_w120">姓名</td>
            <td>{{ Form::text('name') }}
            	{{ $errors->first('name', '<div style="color:red">:message</div>') }}
            </td>
        </tr>
        <tr>
          <td class="td_w120">电话</td>
          <td>{{ Form::text('tel') }}
            	{{ $errors->first('tel', '<div style="color:red">:message</div>') }}
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