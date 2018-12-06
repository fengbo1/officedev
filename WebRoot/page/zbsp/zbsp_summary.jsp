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
$('#year').attr('value',x[0].value);
$('#keyword').attr('value',x[1].value);
});
 
 function expressout()
	{
		var year = document.getElementById("year").value;
		var name = document.getElementById("name").value;
		var keyword = document.getElementById("keyword").value;	
		window.location = "<%=path%>/exportzbspsummary.action?year="+year+"&name="+name+"&keyword="+keyword;
	}
 </script>
 <link href="<%=path%>/css/table_back.css" rel="stylesheet" type="text/css">
  </head>
  
  <body>
  ${daohang}
  <form action="<%=path%>/viewzbspsummary.action" method="post" name="fm1">
					<table style="width:600px" height="80" align="center" cellpadding="0"
						cellspacing="2" border: 0px;">
						<tr>
							<td
								style="color: #1778C2; padding-top: 0px; padding-bottom: 5px; border: 0px; font-size: 26px; font-family: '黑体';"
								colspan="6" align="center" bordercolor="#FFFFFF"><b>值班审批-个人汇总</b>
							</td>
						</tr>
						<tr height="50px" class="表格表头背景1" id="hang">
							<td  width="110px" align="center" valign="middle" nowrap
								bordercolor=none><div align="center">
									<p>序号</p>
								</div></td>
							<td  width="110px" align="center" valign="middle" nowrap
								bordercolor=none><div align="center">
									<p>年度</p>
								</div></td>
							<td  width="100px"  align="center" valign="middle" nowrap
								bordercolor=none><div align="center">
									<p>姓名</p>
								</div></td>	
							<td  width="100px"  align="center" valign="middle" nowrap
								bordercolor=none><div align="center">
									<p>值班次数</p>
								</div></td>	
							<td  width="100px"  align="center" valign="middle" nowrap
								bordercolor=none><div align="center">
									<p>值班天数</p>
								</div></td>
							<td  width="100px"  align="center" valign="middle" nowrap
								bordercolor=none><div align="center">
									<p>已抵用天数</p>
								</div></td>
						</tr>
							<c:forEach items="${list}" var="js" varStatus="status">
							<tr class="btbj" id="hang" style="height:20px">
								
								<td height="25" align="center" valign="middle" nowrap><div
										align="center">${status.index+1+(currentPage-1)*pageSize}</div></td>
								<td height="25" align="center" valign="middle" nowrap><div
										align="center">${js.year}</div></td>
								<td height="25" align="center" valign="middle" nowrap><div
										align="center">${js.name}</div></td>
								<td height="25" align="center" valign="middle" nowrap><div
										align="center">${js.times}</div></td>
								<td height="25" align="center" valign="middle" nowrap><div
										align="center">${js.days}</div></td>
								<td height="25" align="center" valign="middle" nowrap><div
										align="center">${js.didays}</div></td>
							</tr>
							</c:forEach>
							<tr class="表格表头背景">
							<td colspan="6">
								<div align="center">
								<a	href="<%=path%>/viewzbspsummary.action?newnumber=${newnumber}&zhuan=1&year=${year}&name=${name}&keyword=${keyword}&currentPage=${previousPage}"
							style="padding-right: 30px;color: #104E8B">上一页</a> 
									${currentPage} of ${totalPages}
								<a	href="<%=path%>/viewzbspsummary.action?newnumber=${newnumber}&zhuan=1&year=${year}&name=${name}&keyword=${keyword}&currentPage=${nextPage}"
							style="padding-right: 30px;color: #104E8B">下一页</a> 	
									共有 ${totalRows} 条记录
									&nbsp;&nbsp;&nbsp;
								第<input style="width:30px" type="text" name="currentPage"/>页
								<input type="submit" value="跳转"/>	
								</div><br/></td>
						</tr>
		</table>
		</form>
  </body>
</html>
