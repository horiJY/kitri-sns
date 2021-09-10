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
	$("#img").on("click", function(){
		window.location.href="${path }/";
	});
	$("home").on("click", function(){
		window.location.href="${path }/";
	});
});
</script>
</head>
<body>
<header>
	<div class="wrapper">
		<div id="img">
			<img alt="로고이미지" src="${path }/image/logo.svg" id="logo">
		</div>
		<div id="searchInput" class="inputWithIcon">
			<input type="text" id="search" name="search" class="form_input" placeholder="Search">
			<i class="fas fa-search fa-lg fa-fw" aria-hidden="true"></i>
		</div>
		<div id="nav">
			<div>
				<button type="button"><img id="home" class="icons" alt="home" src="${path }/image/icon/home (1).png"></button>
			</div>
			<div>
				<button type="button"><img id="catting" class="icons" alt="chatting" src="${path }/image/icon/chatting.png"></button>
			</div>
			<div>
				<button type="button"><img id="edit" class="icons" alt="edit" src="${path }/image/icon/edit.png"></button>
			</div>
			<div>
				<button type="button"><img id="noti" class="icons" alt="noti" src="${path }/image/icon/noti.png"></button>
			</div>
			<div>
				<button type="button"><img id="user" class="icons" alt="user" src="${path }/image/icon/user.png"></button>
			</div>
		<div>
	</div>
</header>

