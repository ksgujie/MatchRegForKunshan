@extends('layouts.admin.main')

@section('content')

<div id="main_body">    
	
    <table class="tb">
@foreach (array_keys($users) as $type)
        <tr>
            <th colspan="7"><h3 align="left"><strong>{{$type}}</strong></h3></th>
      </tr>
        <tr>
          <th>序号</th>
          <th>学校</th>
          <th>领队</th>
          <th>地址</th>
          <th>电话</th>
          <th>用餐人数</th>
          <th>密码重置</th>
          <th>限制项目报名人数</th>
      </tr>
	<!-- {{$i=0}} -->
    @foreach ($users[$type] as $user)
	<!-- {{$i++}} -->
        <tr>
          <td class="td_w120"> {{$i}} </td>
            <td>{{$user->username}}</td>
            <td>{{$user->leader}}</td>
            <td>{{$user->address}}</td>
            <td>{{$user->tel}}</td>
            <td>{{$user->diners}}</td>
            <td>{{HTML::link("admin/user/resetpwd/$user->id", '密码重置')}}</td>
            <td>
                @if ($user->limitItemMax)
                    {{HTML::link("admin/user/setlimititemmax/$user->id", '限制')}}
                @else
                    {{HTML::link("admin/user/setlimititemmax/$user->id", '不限制')}}
                @endif
            </td>
        </tr>
       
    @endforeach
        <tr>
            <td colspan="6"></td>
        </tr>    	
@endforeach
    </table>
    


</div>

@stop