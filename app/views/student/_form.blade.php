      <table class="tb">
        <tr>
            <th colspan="2"><h3>添加选手</h3></th>
        </tr>
        <tr>
          <td class="td_w120">姓名 <div>　</div><div>　</div><div>　</div> </td>
            <td>{{ Form::text('name',null,['style'=>'width:250px']) }}
            	{{ $errors->first('name', '<div style="color:red">:message</div>') }}   
           <div style="color:blue">注：<strong>学生姓名</strong> 里不要出现空格。</div>
           <div style="color:blue">　　<strong>个人项目</strong> 需按单个学生分别报名。</div>
           <div style="color:blue">　　<strong>团体项目</strong> 将多人姓名一并录入，以空格间隔，请勿分别报名。例：张三 李四</div>
            		       </td>
        </tr>        
        <tr>
          <td class="td_w120">项目</td>
            <td>{{ Form::select('item_id', Item::getall()) }}
            	{{ $errors->first('item_id', '<div style="color:red">:message</div>') }}          </td>
            	
            </td>
        </tr>        

        <tr>
          <td class="td_w120">组别</td>
            <td>{{ Form::select('group_id', Group::getall() ) }}
            	{{ $errors->first('group_id', '<div style="color:red">:message</div>') }}          </td>
            
          </td>
        </tr>
<!---
        <tr>
          <td class="td_w120">备注</td>
            <td>{{ Form::textarea('remark', null, ['style'=>'width:350px; height:80px;']) }}</td>
            
          </td>
        </tr>
-->
        <tr>
          <td class="td_w120">&nbsp;</td>
          <td>{{ Form::submit('保存') }}
        
          </td>
        </tr>
    </table>