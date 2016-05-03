var EType;
//DreamEcm Formset
//Date: Jul 13, 2006
//Copyright: DreamSoft Co.,Ltd.
//Mail: Dream@Dreamsoft.Ca
//Author: Egmax

function Submit(Fname)
{
        document.forms[Fname].submit();
}

function Dis(Eid)
{
        if(arguments.length == 1) { $(Eid).disabled = true; return; }
        var i;
        for (i=0; i<arguments.length; i++) 
        if(typeof(arguments[i]) == 'string')  $(arguments[i]).disabled = true;
}

function FormSet(Fid, v)
{
	if ($f(Fid)==undefined){return ;}
        EType = $f(Fid).type;
        switch(EType) {
        case 'select-one'       : _Select(Fid, v);    break;
        case 'select-multiple'  : _Select(Fid, v);    break;
        case 'checkbox'         : _Checkbox(Fid, v);  break;
        case 'radio'            : _Radio(Fid, v);     break;
        default		            : _Input(Fid, v);	  
        }
}

function Clk(Fname)
{
        $f(Fname).click();
}

function $f(EId)
{
		var obj;
        if(arguments.length == 1) {
        	obj=document.getElementsByName(EId)[0];
        	//alert(obj);
        	if (obj==undefined) {
        		obj=document.getElementById(EId);
        	//alert(obj);
        	}
       		return obj;
    	}
        var i,Es = new Array();
        for (i=0; i<arguments.length; i++) 
                if(typeof(arguments[i]) == 'string')  Es.push(document.getElementsByName(arguments[i])[0]);
        return Es;
}

function _Input(Eid, v)
{
        $f(Eid).value = v;
}

function _Select(Eid,v)
{
        var _obj = $f(Eid);
        for(var i=0; i<_obj.options.length; i++)
        if(_obj.options[i].value == v) { _obj.selectedIndex = i; break; }
}

function _Checkbox(Eid,v)
{
        if(v != 0) $f(Eid).click();
}

function _Radio(Eid, Evalue) 
{
        var __radio  = document.getElementsByName(Eid);
        for (var i=0; i<__radio.length; i++) if (__radio[i].value == Evalue) { __radio[i].click(); break; } 
}
