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
    
    <title>My JSP 'list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="<%=path%>/js/jquery-1.2.6.js" charset= "gbk"></script>
<script language="javascript" type="text/javascript" src="<%=path%>/js/My97DatePicker/WdatePicker.js"></script>
 <style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	background-color: #ffffff;
}
-->
</style>
<script type="text/javascript">
 $(document).ready(function(){ 

$("tr.btbj:odd").css({"background-color":"#F0F0F0","font-family": "黑体","font-size": "14px","font-weight":"lighter" }); 
$("tr.btbj:even").css({"background-color":"#bfd3fc","font-family": "黑体","font-size": "14px","font-weight":"lighter" }); 
var x=document.getElementsByName("para");
//$('#chutuan').attr('value',x[0].value);
});
 function expressout()
	{
		var begindate = document.getElementById("begindate").value;
		var enddate = document.getElementById("enddate").value;
	    var name = document.getElementById("name").value;	
		window.location = "<%=path%>/exportyscjtz.action?begindate="+begindate+"&enddate="+enddate+"&name="+name;
	}
 </script>
 <link href="<%=path%>/css/table_back.css" rel="stylesheet" type="text/css">
  </head>
  
  <body>
  ${daohang}
  <form action="<%=path%>/viewyscjtz.action" method="post" name="fm1">
					<table height="80" align="center" cellpadding="0" cellspacing="2" border: 0px;">
						<tr>
							<td
								style="color: #1778C2; padding-top: 0px; padding-bottom: 5px; border: 0px; font-size: 26px; font-family: '黑体';"
								colspan="14" align="center" bordercolor="#FFFFFF"><b>因私出国（境）证照领取台账</b>
							</td>
						</tr>
						<tr>
							<td colspan="26" height="10px">
								<div align="center">
									起始日期					
									<input size=10 type="text" name="begindate" id="begindate" class="Wdate" value="${begindate}" onClick="WdatePicker()" >
									截止日期
									<input size=10 type="text" name="enddate" id="enddate" class="Wdate" value="${enddate}" onClick="WdatePicker()" >
									
									
									姓名	
									<input type="text" name="name" value="${name}"/>	
														
									<input type="submit" value="查询"/>
									<input type="button" value="导出" onclick="expressout()"/>
									
							</div></td>	
						</tr>
					<tr height="50px" class="表格表头背景1" id="hang">
							<td  width="40px" align="center" valign="middle" nowrap
								bordercolor=none><div align="center">
									<p>序号</p>
								</div></td>
							<td  width="125px" align="center" valign="middle" nowrap
								bordercolor=none><div align="center">
									<p>编号</p>
								</div></td>
							<td  width="60px"  align="center" valign="middle" nowrap
								bordercolor=none><div align="center">
									<p>姓名</p>
								</div></td>	
							<td  width="100px"  align="center" valign="middle" nowrap
								bordercolor=none><div align="center">
									<p>拟去国家或地区</p>
								</div></td>
							<td  width="50px"  align="center" valign="middle" nowrap
								bordercolor=none><div align="center">
									<p>出国（境）事由</p>
								</div></td>
							<td  width="70px"  align="center" valign="middle" nowrap
								bordercolor=none><div align="center">
									<p>拟出国（境）总天数</p>
								</div></td>
							<td  width="100px"  align="center" valign="middle" nowrap
								bordercolor=none><div align="center">
									<p>拟出国（境）时间</p>
								</div></td>	
							<td  width="100px"  align="center" valign="middle" nowrap
								bordercolor=none><div align="center">
									<p>拟回国（境）时间</p>
								</div></td>			
							<td  width="70px"  align="center" valign="middle" nowrap
								bordercolor=none><div align="center">
									<p>证件类型</p>
								</div></td>	
						
							<td  width="80px"  align="center" valign="middle" nowrap
								bordercolor=none><div align="center">
									<p>证件编号</p>
								</div></td>
							<td  width="70px"  align="center" valign="middle" nowrap
								bordercolor=none><div align="center">
									<p>领取护照时间</p>
								</div></td>		
							<td  width="70px"  align="center" valign="middle" nowrap
								bordercolor=none><div align="center">
									<p>出入境证件归还日期</p>
								</div></td>	
							 <td  width="70px"  align="center" valign="middle" nowrap
								bordercolor=none><div align="center">
									<p>查看审批表</p>
								</div></td>											
						</tr>
						<c:forEach items="${list}" var="yscj" varStatus="status">
							<tr class="btbj" id="hang" style="height:20px">
								
								<td  width="40px" height="25" align="center" valign="middle" nowrap><div
										align="center">${status.index+1+(currentPage-1)*pageSize}</div></td>
								<td width="125px" height="25" align="center" valign="middle" nowrap><div
										align="center">${yscj.number}</div></td>
								<td width="60px" height="25" align="center" valign="middle" nowrap><div
										align="center">${yscj.name}</div></td>
								<td width="100px" height="25" align="center" valign="middle" nowrap><div
										align="center">${yscj.tocountry}</div></td>
								<td width="50px" height="25" align="center" valign="middle" nowrap><div
										align="center">${yscj.reason}</div></td>
								<td width="70px" height="25" align="center" valign="middle" nowrap><div
										align="center">${yscj.sumday}</div></td>
								<td width="100px" height="25" align="center" valign="middle" nowrap><div
										align="center">${yscj.begindate}</div></td>
								<td width="100px" height="25" align="center" valign="middle" nowrap><div
										align="center">${yscj.enddate}</div></td>
								<td width="70px" height="25" align="center" valign="middle" nowrap><div
										align="center">${yscj.passporttype}</div></td>		
								
								<td width="80px" height="25" align="center" valign="middle" nowrap><div
										align="center">${yscj.passportnumber}</div></td>
								<td width="70px" height="25" align="center" valign="middle" nowrap> <div
										align="center">${yscj.bringtime}</div></td>
								
								<td width="70px" height="25" align="center" valign="middle" nowrap> <div
										align="center">${yscj.returntime}</div></td>
								<td width="70px" height="25" align="center" valign="middle" nowrap><div
										align="center">
								<a href="<%=path%>/viewyscjdetail.action?number=${yscj.number}&newnumber=${newnumber}">查看详情</a>
										</div></td>	
							</tr>
							</c:forEach>
							<tr class="表格表头背景">
							<td colspan="14">
								<div align="center">
								<a	href="<%=path%>/viewyscjtz.action?begindate=${begindate}&enddate=${enddate}&name=${strtemp}&newnumber=${newnumber}&currentPage=${previousPage}"
							style="padding-right: 30px;color: #104E8B">上一页</a> 
									${currentPage} of ${totalPages}
								<a	href="<%=path%>/viewyscjtz.action?begindate=${begindate}&enddate=${enddate}&name=${strtemp}&newnumber=${newnumber}&currentPage=${nextPage}"
							style="padding-right: 30px;color: #104E8B">下一页</a> 	
									共有 ${totalRows} 条记录
									&nbsp;&nbsp;&nbsp;
								第<input style="width:30px" type="text" name="currentPage"/>页
								<input type="hidden" name="type" value="${type}"/>
								<input type="hidden" name="newnumber" value="${newnumber}"/>
								<input type="submit" value="跳转"/>	
								</div>
								<br/>
								</td>
						</tr>
		</table>
		</form>
  </body>
</html>
