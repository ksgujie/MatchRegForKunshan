@extends('layouts.main')

@section('content')

<div id="main_body">    

      <table class="tb">
        <tr>
            <th colspan="5"><h3>教练</h3></th>
        </tr>

        <tr>
            <th><h3>序号</h3></th>
            <th><h3>项目</h3></th>
            <th><h3>教练</h3></th>
            <th><h3>电话</h3></th>
            <th><h3>改/删</h3></th>
        </tr>
        
<!-- {{$i=0}} -->
@foreach ($items as $item)        
<!-- {{$i++}} -->
        <tr>
            <td style="width:50px;">{{$i}}</td>
            <td style="width:200px;"> {{ $item->name }} </td>
      @if ( $item->teacher() )
          <td style="width:200px;">	{{ $item->teacher()->name }}</td>
          <td style="width:200px;">  {{ $item->teacher()->tel }} </td>
          <td>
          	  {{ HTML::link("teacher/edit/".$item->teacher()->id, '修改') }}
          	  {{ HTML::link("teacher/del/".$item->teacher()->id, '删除') }}
          </td>
      @else
          <td>	{{ HTML::link("teacher/add/$item->id", '添加教练') }} </td>
          <td></td>
          <td></td>
          
      @endif
        </tr>
@endforeach
    </table>

</div>

@stop