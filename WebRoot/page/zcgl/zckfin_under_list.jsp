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
 </script>
 <link href="<%=path%>/css/table_back.css" rel="stylesheet" type="text/css">
  </head>
  
  <body>
  ${daohang}
  <form action="<%=path%>/viewzckfinunder.action" method="post" name="fm1">
					<br>
						<br>
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
									<p>序号</p>
								</div></td>
							<td  width="125px" align="center" valign="middle" nowrap
								bordercolor=none><div align="center">
									<p>编号</p>
								</div></td>
							<td  width="100px"  align="center" valign="middle" nowrap
								bordercolor=none><div align="center">
									<p>日期</p>
								</div></td>	
							<td  width="120px"  align="center" valign="middle" nowrap
								bordercolor=none><div align="center">
									<p>入库资产管理员</p>
								</div></td>
									
							<td  width="120px"  align="center" valign="middle" nowrap
								bordercolor=none><div align="center">
									<p>当前承办人</p>
								</div></td>
							<td  width="70px"  align="center" valign="middle" nowrap
								bordercolor=none><div align="center">
									<p>状态</p>
								</div></td>	
							<td  width="150px"  align="center" valign="middle" nowrap
								bordercolor=none><div align="center">
									<p>备注</p>
								</div></td>			
							<td  width="200px"  align="center" valign="middle" nowrap
								bordercolor=none><div align="center">
									<p>操作</p>
								</div></td>												
						   </tr>
							<c:forEach items="${list}" var="zckfin" varStatus="status">
							<tr class="btbj" id="hang" style="height:20px">
								
								<td  width="40px" height="25" align="center" valign="middle" nowrap><div
										align="center">${status.index+1+(currentPage-1)*pageSize}</div></td>
								<td width="125px" height="25" align="center" valign="middle" nowrap><div
										align="center">${zckfin.number}</div></td>
								<td width="100px" height="25" align="center" valign="middle" nowrap><div
										align="center">${zckfin.date}</div></td>
								<td width="120px" height="25" align="center" valign="middle" nowrap><div
										align="center">${zckfin.name}</div></td>
							
								<td width="120px" height="25" align="center" valign="middle" nowrap><div
										align="center">${fb:newnumbertoname(zckfin.thisunder)}</div></td>
								<td width="70px" height="25" align="center" valign="middle" nowrap><div
										align="center">${fb:newstatustostring(zckfin.status)}</div></td>		
								<td width="150px" height="25" align="center" valign="middle" nowrap><div
										align="center">${zckfin.remark}</div></td>		
								
								 
								<td width="200px" height="25" align="center" valign="middle" nowrap><div
										align="center">
										<c:choose>	
										<c:when test="${(newnumber==zckfin.initiator)&&(zckfin.status==0||zckfin.status==5)}">
												<a href="<%=path%>/deletezckfinpage.action?number=${zckfin.number}&newnumber=${newnumber}">撤销</a>&nbsp;&nbsp;
												<a href="<%=path%>/viewzckfindetail.action?number=${zckfin.number}&newnumber=${newnumber}">查看详情</a> 
										</c:when>
                                     
										<c:otherwise>
										<a href="<%=path%>/checkzckfin.action?number=${zckfin.number}&newnumber=${newnumber}">复核</a> 
										&nbsp;&nbsp;&nbsp;&nbsp;
										</c:otherwise>
			                            </c:choose>	
										
										</div></td>	
							</tr>
							</c:forEach>
							<tr class="表格表头背景">
							<td colspan="14">
								<div align="center">
								<a	href="<%=path%>/viewzckfinunder.action?newnumber=${newnumber}&currentPage=${previousPage}"
							style="padding-right: 30px;color: #104E8B">上一页</a> 
									${currentPage} of ${totalPages}
								<a	href="<%=path%>/viewzckfinunder.action?newnumber=${newnumber}&currentPage=${nextPage}"
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
