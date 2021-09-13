<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>Kistagram</title>
<link rel="stylesheet" href="${path}/assets/css/header.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script><!-- 라이브러리 -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#logoimg").on("click", function(){
		window.location.href="${path }/";
	});
	$("#homenav").on("click", function(){
		window.location.href="${path }/";
	});
	$("#directnav").on("click", function(){
		window.location.href="${path }/direct";
	});
	$("#notinav").on("click", function(){
		if($("#sub-notinav").css("display")=="none"){
			$("#sub-notinav").show();
			$("#sub-usernav").hide();
			
		} else {
			$("#sub-notinav").hide();
		}
	});
	$("#usernav").on("click", function(){
		if($("#sub-usernav").css("display")=="none"){
			$("#sub-usernav").show();
			$("#sub-notinav").hide();
		} else {
			$("#sub-usernav").hide();
		}
	});
	
	$("#profile-li").on("click", function(){
		
	});
	$("#logout-li").on("click", function(){
		window.location.href="${path }/login/logout";
	});
});
</script>
</head>
<body>
<% 
   String id = (String)session.getAttribute("id");
%>
	<header>
		<div class="centerize_wrapper">
			<div id="header-main-nav">
				<div id="logoimg">
					<img alt="로고이미지" src="${path }/image/logo.svg" id="logo">
				</div>
				<div id="wrapperbox">
					<div id="searchInput" class="inputWithIcon">
						<input type="text" id="search" name="search" class="form_input"
							placeholder="Search"> <i class="fas fa-search fa-lg fa-fw"
							aria-hidden="true"></i>
					</div>
					<div id="nav">
						<div class="iconnav" id="usernav"></div>
						<div class="iconnav" id="notinav"></div>
						<div class="iconnav" id="editnav"></div>
						<div class="iconnav" id="directnav"></div>
						<div class="iconnav" id="homenav"></div>
					</div>
				</div>
			</div>
			<div id="header-sub-nav">
				<div class="sub-nav" id="sub-notinav">
					<div class="sub-nav-pointer"></div>
					<div class="sub-nav-box" id="sub-notinav-box"></div>
				</div>
				<div class="sub-nav" id="sub-usernav">
					<div class="sub-nav-pointer"></div>
					<div class="sub-nav-box" id="sub-usernav-box">
						<ul class="sub-usernav">
							<li id="profile-li"><i class="far fa-user-circle" aria-hidden="true"></i><span>프로필</span></li>
							<li id="logout-li"><span>로그아웃</span></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</header>