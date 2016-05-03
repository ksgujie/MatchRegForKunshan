@extends('layouts.main')

@section('content')

<div id="main_body">    

      <table class="tb">
        <tr>
            <th colspan="7"><h3>报名详单</h3> </th>
        </tr>

        <tr>
            <th><h3>序号</h3></th>
            <th><h3>姓名</h3></th>
            <th><h3>项目</h3></th>
            <th><h3>组别</h3></th>
            <th><h3>学校</h3></th>
            <th><h3>学校类别</h3>
            <th><h3>备注</h3></th>
        </tr>
        
<!-- {{$i=0}} -->
@foreach ($students as $s)        
<!-- {{$i++}} -->
        <tr>
            <td style="width:50px;">{{$i}}</td>
            <td> {{ $s->name }} </td>
          <td>	{{ $s->item->name }}</td>
          <td>  {{ $s->group->name }} </td>
          <td> {{$s->user->username}} </td>
          <td> {{$s->user->type}} </td>
          <td> {{$s->remark}} </td>

        </tr>
@endforeach
    </table>
</div>

@stop