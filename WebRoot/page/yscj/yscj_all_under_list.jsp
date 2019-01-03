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
});

function allshenpi()
{
	
    var message = "确认提交？";
	if (window.confirm(message)) {
		with(document.forms[0]) {
		action='allshenpi.action';
		method="post";
		submit();
	        }
	     }
		
	
}

 </script>
 <link href="<%=path%>/css/table_back.css" rel="stylesheet" type="text/css">
  </head>
  
  <body>
  ${daohang}
  <form action="<%=path%>/viewyscjallunder.action" method="post" name="fm1">
					<table height="80" align="center" cellpadding="0"
						cellspacing="2" border: 0px;">
						<tr>
							<td
								style="color: #1778C2; padding-top: 0px; padding-bottom: 5px; border: 0px; font-size: 26px; font-family: '黑体';"
								colspan="14" align="center" bordercolor="#FFFFFF"><b>待办事宜</b>
							</td>
						</tr>
	
						<tr height="50px" class="表格表头背景1" id="hang">
							<td  width="40px" align="center" valign="middle" nowrap
								bordercolor=none><div align="center">
									<p>全选</p>
								</div></td>
							<td  width="125px" align="center" valign="middle" nowrap
								bordercolor=none><div align="center">
									<p>编号</p>
								</div></td>
							<td  width="60px"  align="center" valign="middle" nowrap
								bordercolor=none><div align="center">
									<p>日期</p>
								</div></td>	
							<td  width="50px"  align="center" valign="middle" nowrap
								bordercolor=none><div align="center">
									<p>发起人</p>
								</div></td>
							<td  width="100px"  align="center" valign="middle" nowrap
								bordercolor=none><div align="center">
									<p>申请人</p>
								</div></td>
							<td  width="70px"  align="center" valign="middle" nowrap
								bordercolor=none><div align="center">
									<p>联系电话</p>
								</div></td>
							<td  width="100px"  align="center" valign="middle" nowrap
								bordercolor=none><div align="center">
									<p>拟去国家</p>
								</div></td>	
							<td  width="100px"  align="center" valign="middle" nowrap
								bordercolor=none><div align="center">
									<p>拟出国时间</p>
								</div></td>			
							<td  width="70px"  align="center" valign="middle" nowrap
								bordercolor=none><div align="center">
									<p>拟回国时间</p>
								</div></td>	
						 
							<td  width="80px"  align="center" valign="middle" nowrap
								bordercolor=none><div align="center">
									<p>出国（境）事由</p>
								</div></td>
							<td  width="70px"  align="center" valign="middle" nowrap
								bordercolor=none><div align="center">
									<p>申请证件</p>
								</div></td>		
							<td  width="140px"  align="center" valign="middle" nowrap
								bordercolor=none><div align="center">
									<p>操作</p>
								</div></td>												
						</tr>
							<c:forEach items="${list}" var="yscj" varStatus="status">
							<tr class="btbj" id="hang" style="height:20px">
								
								<td  width="40px" height="25" align="center" valign="middle" nowrap><div
										align="center"><input id="${yscj.number}" type="checkbox"  name="yscjchoose" value="${yscj.number}"  checked="checked" /></div></td>
								<td width="125px" height="25" align="center" valign="middle" nowrap><div
										align="center">${yscj.number}</div></td>
								<td width="60px" height="25" align="center" valign="middle" nowrap><div
										align="center">${yscj.date}</div></td>
								<td width="50px" height="25" align="center" valign="middle" nowrap><div
										align="center">${fb:newnumbertoname(yscj.initiator)}</div></td>
								<td width="100px" height="25" align="center" valign="middle" nowrap><div
										align="center">${fb:newnumbertoname(yscj.applicant)}</div></td>
								<td width="70px" height="25" align="center" valign="middle" nowrap><div
										align="center">${yscj.tel}</div></td>
								<td width="100px" height="25" align="center" valign="middle" nowrap><div
										align="center">${yscj.tocountry}</div></td>
								<td width="100px" height="25" align="center" valign="middle" nowrap><div
										align="center">${yscj.begindate}</div></td>
								<td width="70px" height="25" align="center" valign="middle" nowrap><div
										align="center">${yscj.enddate}</div></td>		
								
								<td width="80px" height="25" align="center" valign="middle" nowrap><div
										align="center">${fb:reasontoname(yscj.reason)}</div></td>
								<td width="70px" height="25" align="center" valign="middle" nowrap><div
										align="center">${fb:passporttypetoname(yscj.passporttype)}</div></td>
								 
								<td width="140px" height="25" align="center" valign="middle" nowrap><div
										align="center">
										<c:choose>	
									
										<c:when test="${(yscj.status!=8)&&(yscj.status!=9)&&(yscj.status!=4)}">
											<a href="<%=path%>/yscjunderdetail.action?number=${yscj.number}">查看详情</a>
										</c:when>
										<c:otherwise>
					
										</c:otherwise>
						
										</c:choose>	
										</div></td>	
							</tr>
							</c:forEach>
							<tr class="表格表头背景">
							<td colspan="14">
							
								<input type="hidden" name="type" value="${type}"/>
								<input type="hidden" name="newnumber" value="${newnumber}"/>
								
								
								<br/>
								<div align="center">
					     		<input style="width:150px" type="button" onclick="allshenpi()" value="一键审批"/>	
								
								</div>
								<br/>
								</td>
						</tr>
		</table>
		</form>
  </body>
</html>
