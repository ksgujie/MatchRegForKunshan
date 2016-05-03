@extends('layouts.admin.main')

@section('content')

<div id="main_body">    

  <table border="0" class="tb">
    <tr>
      <th colspan="2"><h3>报名总人数：{{$studentsCount}}人</h3></th>
    </tr>
@foreach ($items as $item)
    <tr>
      <td align="left" width="40%"> {{$item->name}}</td>
      <td align="left"><strong> {{ count($item->students) }}人</strong></td>
    </tr>
@endforeach
  </table>
  		
   <table border="0" class="tb">
    <tr>
      <th colspan="2"><h3>已报名学校（{{ count($signupSchools) }}所）</h3></th>
    </tr>
<!-- {{$i=0}} -->
@foreach ($signupSchools as $s)
<!-- {{$i++}} -->
    <tr>
      <td align="left" style="width:50px"> {{$i}}</td>
      <td align="left"> {{$s->username}}</td>
    </tr>
@endforeach
  </table>
  		
  		
   <table border="0" class="tb">
    <tr>
      <th colspan="2"><h3>未报名学校（{{ count($unsignupSchools) }}所）</h3></th>
    </tr>
<!-- {{$i=0}} -->
@foreach ($unsignupSchools as $s)
<!-- {{$i++}} -->
    <tr>
      <td align="left" style="width:50px"> {{$i}}</td>
      <td align="left"> {{$s->username}}</td>
    </tr>
@endforeach
  </table>
  		
  		
</div>

@stop