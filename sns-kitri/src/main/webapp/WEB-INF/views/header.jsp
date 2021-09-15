<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>Kistagram</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script><!-- 라이브러리 -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet" href="${path}/assets/jquery-ui/jquery-ui.css"> <!-- jQuerycss 파일을 연결해준다 -->
<script src="${path}/assets/jquery-ui/jquery-ui.js"></script> <!-- jQueryUI 파일을 연결해준다 -->
<link rel="stylesheet" href="${path}/assets/css/header.css">
</head>
<body>
<% 
   String id = (String)session.getAttribute("id");
%>
	<header>
		<div class="centerize_wrapper">
			<form id="header-main-nav">
				<input type="hidden" value="${id } ">
				<div id="logoimg">
					<img alt="로고이미지" src="${path }/image/logo.svg" id="logo">
				</div>
				<div id="wrapperbox">
					<div id="searchInput" class="inputWithIcon">
						<input type="text" id="search" name="search" class="form_input" placeholder="Search">
						<i class="fas fa-search fa-lg fa-fw" aria-hidden="true"></i>
					</div>
					<div id="nav">
						<div class="iconnav" id="usernav"></div>
						<div class="iconnav" id="notinav"></div>
						<div class="iconnav" id="editnav"></div>
						<div class="iconnav" id="directnav"></div>
						<div class="iconnav" id="homenav"></div>
					</div>
				</div>
			</form>
			<form id="header-sub-nav">
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
			</form>
		</div>
	</header>
<script type="text/javascript">
var usersource = new Array();
$.ajax({
	type : 'get',
	url: '${path }/searchuser',
	dataType : 'json',
	success : function(data) {
		var usersource = new Array();
		$.each(data, function(idx, obj) {
			var user = new Object();
			user.value = obj.id;
			user.name = obj.name;
			usersource.push(user);
		});
		$( "#search" ).autocomplete({
			minLength: 1,
			source: usersource,
			focus: function( event, ui ) {
		 		$( "#search" ).val( ui.item.value );
			 	return false;
			},
			autofocus: true,
			select: function( event, ui ) {
				$( "#search" ).val( ui.item.value );
			 	return false;
			},
			position : { my : 'right top', at : 'right bottom'},
			disable : false, // 해당 값 true 시, 자동완성 기능 꺼짐
		})
		.autocomplete( "instance" )._renderItem = function( ul, item ) {
			return $( "<li class='searchlist'>" )
			.append( "<div class='searchitem'>"
					+ "<img src='${path}/image/members/" + item.value + "/thumnail.jpg'>" 
					+ "<div class='user'><span class='searchid'>" + item.value + "</span><br>" 
					+ "<span class='searchname'>" + item.name + "</span><div>" 
					+ "</div>" )
			.appendTo( ul );
		};
	}
});

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
</script>