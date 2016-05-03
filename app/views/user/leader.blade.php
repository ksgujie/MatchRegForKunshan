@extends('layouts.main')

@section('content')

<div id="main_body">
	
      <table class="tb">
        <tr>
            <th colspan="2"><h3>领队信息</h3></th>
        </tr>
        
        <tr>
            <td class="td_w120">姓名</td>
          <td> {{ Auth::user()->leader }}</td>
        </tr>
        <tr>
          <td class="td_w120">联系地址</td>
          <td>{{ Auth::user()->address }}
          </td>
        </tr>
        <tr>
          <td class="td_w120">联系电话</td>
          <td>{{ Auth::user()->tel }}
           </td>
        </tr>
        <tr>
          <td class="td_w120">用餐人数 <div>　</div> </td>
          <td>{{ Auth::user()->diners }}
				<div style="color:blue">注：这只是程序中预设的一个功能，具体比赛当天是否提供午餐请咨询承办单位！</div>
           </td>
        </tr>
        
        <tr>
            <td class="td_w120"></td>
            <td> {{HTML::link('user/leader/edit', '修改')}} </td>
        </tr>
    </table>

</div>

@stop