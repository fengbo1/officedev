<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fb" uri="http://template.fb.com/article/taglib"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>

<html>
	<head>
		<title>Home</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="css/style11.css" rel="stylesheet" type="text/css"  media="all" />
	
		<link rel="stylesheet" href="css/responsiveslides.css">
	
		

	</head>
	<body>
	<!---start-wrap---->
		<!---start-header---->
		<div class="header" id="top">
			<div class="wrap">
			<!---start-logo---->
			<div class="logo">
				
				<a href="index.html"><img src="images/logo.gif"  title="logo" /></a>
				
			</div>
			<div style = "float:right">
			<br/>
			
			 <input  type="button" name="exit" id="button1" value="退出" style=" width:80px; height:25px; background:url(/office/images/grid.png) repeat-x ; border:none; color:#FFF; padding-bottom:2px; font-size:14px; font-weight:bold; opacity: 0.7;">
			
			</div>
			<!---End-logo---->
			<!---start-top-nav---->
		
			<div class="clear"> </div>
			<!---End-top-nav---->
		</div>
		
		<!---End-header---->
	</div>
		<!--start-image-slider---->
					<div class="image-slider">
						<!-- Slideshow 1 -->
					    <ul class="rslides" id="slider1">
					    
					      <li><img src="images/shouye3.gif" height="320" width="1200" alt=""></li>
					    
					    </ul>
						 <!-- Slideshow 2 -->
					</div>
					<!--End-image-slider---->
		<!---start---content----->
		<div class="wrap">
		<div class="content">
			<!---start-grids----->
			<div class="grids">
				 <div class="grid" >
				 	<h3 >自助办公工具</h3 >
				 <img src="images/bangong.jpg"  height="180" width="290" title="Buliding" />
				 	
				 <a class="button" href="/office/login.action?username=<s:property value="username"/>&password=${password}" >进入工具</a>
				 </div>
				 <div class="grid">
				 	<h3>生产信息工具</h3>
				 	<a href="#"><img src="images/shengchan.jpg"  height="180" width="290" title="Buliding" /></a>
				 	
				 	<a class="button" href="http://172.20.10.12:8080/work/login.action?username=<s:property value="username"/>&password=${password}">进入工具</a>
				 </div>
				 <div class="grid">
				 	<h3>安防值班工具</h3>
				 	<a href="#"><img src="images/anbao.jpg"  height="180" width="290" title="Buliding" /></a>
				 
				 	<a class="button" href="/security/login.action?username=<s:property value="username"/>&password=${password}">进入工具</a>
				 </div>
				 <div class="grid last-grid">
				 	<h3>绩效管理工具</h3>
				 	<a href="#"><img src="images/jixiao.jpg" height="180" width="290" title="Buliding" /></a>
				 	
				 	<a class="button" href="/performance/login.action?username=<s:property value="username"/>&password=${password}">进入工具</a>
				 </div>
				 <div class="clear"> </div>
			</div>
			<!---End-grids----->
		</div>
		</div>
			<!---start-box---->
		<br>
		<br>
		<br>
		<br>
		
	<!---End-wrap---->
	</body>
</html>


