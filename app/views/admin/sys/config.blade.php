@extends('layouts.admin.main')

@section('content')


{{ HTML::script("js/formset.js") }}
{{ HTML::script("js/My97DatePicker/WdatePicker.js") }}

{{ HTML::script("js/editor/editor.js") }}
<script language="javascript">
CD.IniEditor({
    id   : ["info9"],
    use  : [true],
    root : '{{asset("js/editor/")}}/'
});
</script>

<div id="main_body">    

    {{Form::open()}}
    <table class="tb">
        <tr>
            <th colspan="2"><h3>设置</h3></th>
        </tr>
        <tr>
            <td><h3>公告</h3></td>
            <td>
            	{{Form::textarea('info', '', ['style'=>"width:520px;height:200px;"])}}
            	<p>显示在登录页</p>
            </td>
        </tr>

        <tr>
          <td class="td_w120">报名开启/关闭</td>
          <td>
          	<div> {{Form::radio('siteClosed', 0)}}开启</div>
          	<div> {{Form::radio('siteClosed', 1)}}关闭 </div>
          	<div> {{Form::radio('siteClosed', 2)}}自动关闭 
          		于{{Form::text('siteCloseTime', '', [ 'onFocus'=>"WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss'})"])}}自动关闭 </div>
          	</div>
          </td>
        </tr>
        <tr>
            <td class="td_w120"></td>
            <td>
            {{Form::submit('确定')}}            </td>
        </tr>
    </table>
  {{Form::close()}}

{{$formset}}
</div>

@stop