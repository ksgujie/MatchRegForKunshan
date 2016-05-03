@extends('layouts.admin.main')

@section('content')

<div id="main_body">    

    {{Form::open(['url'=>"admin/group/add"])}}
    <table class="tb">
        <tr>
            <th colspan="2"><h3>添加组别</h3></th>
        </tr>
        <tr>
            <td class="td_w120">组别名称</td>
          <td>
         
          {{Form::text('name')}}
          {{Form::submit('添加')}}
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


  <table width="500" border="0" cellpadding="10" cellspacing="0" class="tb">
    <tr>
      <th colspan="3"><h3>已设组别</h3></th>
    </tr>
    <tr>
      <td class="td_w120"><strong>序号</strong></td>
      <td><strong>组别名称</strong></td>
      <td><strong>改/删</strong></td>
    </tr>
<!-- {{$i=0}} -->
@foreach ($groups as $d)
<!-- {{$i++}} -->
    <tr>
      <td>{{$i}}</td>
      <td>{{$d->name}}</td>
      <td>
      {{HTML::link("admin/group/edit/$d->id", '修改')}}
      {{HTML::link("admin/group/del/$d->id", '删除', ['onclick'=>'return confirm("确认删除？")'] )}}
      </td>
    </tr>
@endforeach
  </table>
</div>

@stop