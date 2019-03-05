<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fb" uri="http://template.fb.com/article/taglib"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <script language="javascript" type="text/javascript" src="<%=path%>/js/My97DatePicker/WdatePicker.js"></script>
    <title>My JSP 'authorityfailed.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="<%=path%>/js/jquery-1.2.6.js" charset= "gbk"></script>
	<script type="text/javascript">
	
	function a(){
		 alert("仅添加本处室人员！");
		 $('#p').append("<input type='text' name='people' style='width:50px'  onblur='check(this.value)'/>");
		}
	function b(){
		$("input[name='people']").eq($("input[name='people']").size()-1).remove();
		}
	function check(val)
	{
		var allname= document.getElementById("allname").value;
		var chuname= document.getElementById("chuname").value;
		var fndchu = chuname.indexOf(val+'、');
		var fndall = allname.indexOf(val+'、');
		if(fndall==-1)
		{
			alert("姓名【"+val+"】在员工信息中查询不到，请确认是否书写正确！");
		}
		else if(fndchu==-1)
		{
			alert("姓名【"+val+"】在本处室信息中查询不到，请填写本处室员工！");
		}
	}
	//计算休假日期使用 -->
	function jisuan() {
		////////////////////////////////计算日期//////////////////
		var halfday1s=document.getElementsByName("RadioGroup1");
		var halfday2s=document.getElementsByName("RadioGroup2");
		var halfday1="false";
		var halfday2="false";
		if(halfday1s[1].checked==true){
			halfday1="true";
			}
		if(halfday2s[0].checked==true){
			halfday2="true";
			}

		
		var begindate= document.getElementById("begindate").value;
		var enddate= document.getElementById("enddate").value;
	    inoutdate(begindate,enddate,5,halfday1,halfday2);
	}
	//传入日期返回天数
	function inoutdate(begindate,enddate,type,halfday1,halfday2){
	////////提交计算前检查一下///////////////////////////
		var rg10=document.getElementById("RadioGroup1_0");
		var rg11=document.getElementById("RadioGroup1_1");
		var rg20=document.getElementById("RadioGroup2_0");
		var rg21=document.getElementById("RadioGroup2_1");
	    var result = begindate.match(/((^((1[8-9]\d{2})|([2-9]\d{3}))(-)(10|12|0?[13578])(-)(3[01]|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))(-)(11|0?[469])(-)(30|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))(-)(0?2)(-)(2[0-8]|1[0-9]|0?[1-9])$)|(^([2468][048]00)(-)(0?2)(-)(29)$)|(^([3579][26]00)(-)(0?2)(-)(29)$)|(^([1][89][0][48])(-)(0?2)(-)(29)$)|(^([2-9][0-9][0][48])(-)(0?2)(-)(29)$)|(^([1][89][2468][048])(-)(0?2)(-)(29)$)|(^([2-9][0-9][2468][048])(-)(0?2)(-)(29)$)|(^([1][89][13579][26])(-)(0?2)(-)(29)$)|(^([2-9][0-9][13579][26])(-)(0?2)(-)(29)$))/);
        if(result==null)
        { return ;
		 }
        var result2 = enddate.match(/((^((1[8-9]\d{2})|([2-9]\d{3}))(-)(10|12|0?[13578])(-)(3[01]|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))(-)(11|0?[469])(-)(30|[12][0-9]|0?[1-9])$)|(^((1[8-9]\d{2})|([2-9]\d{3}))(-)(0?2)(-)(2[0-8]|1[0-9]|0?[1-9])$)|(^([2468][048]00)(-)(0?2)(-)(29)$)|(^([3579][26]00)(-)(0?2)(-)(29)$)|(^([1][89][0][48])(-)(0?2)(-)(29)$)|(^([2-9][0-9][0][48])(-)(0?2)(-)(29)$)|(^([1][89][2468][048])(-)(0?2)(-)(29)$)|(^([2-9][0-9][2468][048])(-)(0?2)(-)(29)$)|(^([1][89][13579][26])(-)(0?2)(-)(29)$)|(^([2-9][0-9][13579][26])(-)(0?2)(-)(29)$))/);
        if(result2==null)
        {        
            return;
        }
        var begindates=begindate.replace(/-/g,"/");
		var begindates=new Date(begindates);
		var enddates=enddate.replace(/-/g,"/");
		var enddates=new Date(enddates);	
		if(begindates>enddates){
			alert("加班开始时间不能晚于加班结束时间！");
			return ;
		}
		if(!rg10.checked&&!rg11.checked)
			{
				return;
			}
		if(!rg20.checked&&!rg21.checked)
			{
				return;
			}	
	
	////////提交计算前检查一下///////////////////////////
	var sumdate; 
	var xmlhttp;
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}	
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				sumdate=xmlhttp.responseText;			
				document.getElementById("sumdate").value=sumdate;
							
			}				
		} 
		var url="sumdate.action?begindate="+begindate+"&enddate="+enddate+"&type="+type+"&halfday1="+halfday1+"&halfday2="+halfday2;
		xmlhttp.open("GET",url,true);
		xmlhttp.send();
	}	
	
		function tijiao() {
		  	var begindate= document.getElementById("begindate").value;
			var begindate=begindate.replace(/-/g,"/");
			var begindate=new Date(begindate);
			var reason=document.getElementsByName("reason")[0].value;
			var enddate= document.getElementById("enddate").value;
			var enddate=enddate.replace(/-/g,"/");
			var enddate=new Date(enddate);
		  var xuanze = document.getElementById("xuanze").value;
		  var rg10=document.getElementById("RadioGroup1_0");
		  var rg11=document.getElementById("RadioGroup1_1");
		  var rg20=document.getElementById("RadioGroup2_0");
		  var rg21=document.getElementById("RadioGroup2_1");
		  var tel=document.getElementById("tel").value;
		  var name=document.getElementById("name").value;
		
		  var sumdate=document.getElementById("sumdate").value;
		 // var panduan= sumdate.selectedIndex;
		  var message = "确认提交？";
		
		  if(name=="")
		  {
			  alert("请填写姓名");
			  document.getElementById("name").focus();
			  return;
			}
		
		  else if(trim(tel)=="")
		  {
			  alert("请填写联系电话");
			  document.getElementById("tel").focus();
			  return;
			}
		  else if(trim(reason)=="")
		  {
			  alert("请输入加班事由");
			}
		  else if(!rg10.checked&&!rg11.checked)
			{
				alert("请选择上午或下午");
				return;
			}
		  else if(!rg20.checked&&!rg21.checked)
			{
				alert("请选择上午或下午");
				return;
			}
		  else if(xuanze=="wu")
			{
				alert("请选择下一级审批人");
				return;
			}
			
		  else if(begindate>enddate){
				document.getElementById("begindate").value="";
				document.getElementById("enddate").value="";
				alert("加班开始时间不能晚于加班结束时间！");return;
	     }
		 else if(((enddate-begindate)/(1000 * 60 * 60*24)+1)<(sumdate)){
				document.getElementById("begindate").value="";
				document.getElementById("enddate").value="";
				alert("开始时间与结束时间之差不应小于加班时间");return;
	     }
			else
			{
				if (window.confirm(message)) {
					with(document.forms[0]) {
						action='subjbsppage.action';
						method="post";
						submit();
					}
				}
			}
	  }
	 function trim(str){ //删除左右两端的空格
		    return str.replace(/(^\s*)|(\s*$)/g, "");
		}  
</script>

<script type="text/javascript">
function change1(){

var yesorno="";
var name=document.getElementById('name').value;
var newnumber=document.getElementById('newnumber').value;
name = encodeURI(name); 
var xmlhttp;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}	
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			yesorno=xmlhttp.responseText;
			//alert(yesorno);
				var arr=yesorno.split("|");
				if(arr[0].length==4)
				{
				//alert(arr[0].length);
				//alert(arr[0]);
					alert("您输入姓名有误！");
				}
				if(arr[0].length==5)
				{
					alert("不能跨处室代申请！");
				}
					document.getElementById("chutuan").innerHTML=arr[0];
					bossname(arr[1]);
					document.getElementById("allname").value=arr[2];
					document.getElementById("chuname").value=arr[3];
					
		}				
	} 
	xmlhttp.open("GET","showjbsppagedfajax.action?name="+name+"&newnumber="+newnumber,true);
	xmlhttp.send();
}

//确定审批下一人
function bossname(bossnames){

var arry= new Array();
arry=bossnames.split(";"); //字符分割 
var obj=document.getElementById('xuanze'); 
obj.options.length=0;
for (var i=0;i<arry.length;i++){	
	var brry= new Array();
	brry=arry[i].split(":");
	obj.options.add(new Option(brry[0],brry[1])); //这个兼容IE与firefox 
}
} 
</script>

  <style type="text/css">
  .as {
	text-align: center;
}
b{
	color:red;
}
  </style>
  </head>
  
  <body>
  ${daohang}
    <form action="subjbsppage.action" method="post">
    	  <p align="center" style="padding:0px;margin:0px; font-size: 24px;"><strong><font id="bu" style="display:none;">（补）</font>业务处理中心加班审批备案表</strong><strong> </strong></p>
       <table width="860" height="398" border="1" align="center" cellpadding="1" cellspacing="0">
    		<tr>
    			<td width="121" class="as">
    				姓名<b>*</b>
    			</td>
    			<td width="176">
    				<input type="text" id="name" name="name" onblur="change1()"/> 
    			</td>
    			<td width="72" class="as">
    				处室<b>*</b>
    			</td>
    			<td width="175">
    				<div align="center" id="chutuan">&nbsp;</div>
    			</td>
    			<td width="89" class="as">
    				联系方式<b>*</b>
    			</td>
    			<td width="201">
    				<input id="tel" style="IME-MODE: disabled;" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="11" name="tel" type="text" />
    			</td>
    		</tr>
    		<tr>
    			<td>
    				<input type="button" id="button" value="增加一位加班人" onclick="a()"/>
    			</td>
    			<td colspan="4" id="p">&nbsp;
    			</td>
    			<td><input type="button" id="button" value="减少一位加班人" onclick="b()"/></td>
    		</tr>
    		<tr>
    			<td class="as">
    				加班事由<b>*</b>
    			</td>
    			<td colspan="5">
    				<input type="text" name="reason" style="width:400px"/>
    			</td>
    		</tr>
    		<tr>
    			<td class="as">
    				加班时间<b>*</b>
    			</td>
    			 <td colspan="5" >
     				<div style="float:left;padding-top:8px;width:110px">从<input size="9" type="text" name="begindate" id="begindate" class="Wdate" onClick="WdatePicker();jisuan()" ></div>
    				 <div style="float:left">  
     					<input type="radio" name="RadioGroup1" value="sw" id="RadioGroup1_0" onClick="jisuan()">上午<br>
        				<input type="radio" name="RadioGroup1" value="xw" id="RadioGroup1_1" onClick="jisuan()">下午    
    				 </div>    
    				 <div style="float:left;padding-top:8px;width:120px"> 起至<input size="9" type="text" name="enddate" id="enddate" class="Wdate" onClick="WdatePicker();jisuan()" ></div>      
    				 <div style="float:left">      
     					<input type="radio" name="RadioGroup2" value="sw" id="RadioGroup2_0" onClick="jisuan()">上午<br>     
       				 <input type="radio" name="RadioGroup2" value="xw" id="RadioGroup2_1" onClick="jisuan()">下午 
     				</div>
    			 <div style="float:left;padding-top:8px;width:140px"> 	
      			 	 止，共<input size="4" readonly="readonly" type="text" name="sumdate"  id="sumdate" onchange="check()">天
    			 </div>
        		</td>
        		 
    		</tr>
    		<tr>
    			<td class="as">
    				所在处室意见
    			</td>
    			<td colspan="5">
    				&nbsp;
    			</td>
    		</tr>
    		<tr>
    			<td class="as">
    				中心审批意见
    			</td>
    			<td colspan="5">
    				&nbsp;
    			</td>
    		</tr>
    		<tr>
    			<td class="as">
    				备注
    			</td>
    			<td colspan="5">
    				<input type="text" name="remark" style="width:400px"/>
    			</td>
    		</tr>
    		<tr>
    			<td class="as">
    				选择审批人<b>*</b>
    			</td>
    		    <td colspan="5">
    				<select name="thisunder" id="xuanze">
    				<option value="wu">请选择下一级审批人</option>
        			</select>
    			</td>
        			
    		</tr>
    		<tr>
    			<td>
    				&nbsp;
    			</td>
    			<td colspan="5">
    				<input type="hidden" id="newnumber"  name="newnumber" value="${newnumber}"/>
    				<input type="hidden" id="chuname"  name="chuname" value=""/>
    				<input type="hidden" id="chuname" name="chuname" value=""/>
    				<input type="button" onclick="tijiao()" value="提  交"/>
    				<span class="tip">（本次加班产生的调休将于6个月后失效！）</span>
    				
    			</td>
    		</tr>
    	</table>
    </form>
  </body>
</html>
