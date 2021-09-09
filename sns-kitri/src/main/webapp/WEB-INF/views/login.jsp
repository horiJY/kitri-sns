<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
<link rel="stylesheet" href="${path}/assets/css/login.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script><!-- 라이브러리 -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	let loginBtn = $("#loginBtn");
	let joinBtn = $("#joinBtn");
	
	loginBtn.on("click", function(){
		let id = $("#useridL").val();
		let pw = $("#pwL").val();
		if(id == ""){
			alert("아이디를 입력하세요.");
			$("#useridL").focus();
			return;
		}
		if(pw == ""){
			alert("비밀번호를 입력하세요.");
			$("#pwL").focus();
			return;
		}
		$.ajax({
			url: "${pageContext.request.contextPath}/login/logincheck",
			type : "post",
			data : {"id" : id , "pw": pw},
			dataType :"json",
			success:function(data){
			
				if(data){
					window.location.replace("${pageContext.request.contextPath}/");
				} else {
					$("#loginMsg").css("color", "red");
					$("#loginMsg").text("아이디 또는 비밀번호가 일치하지 않습니다.");
				}
			}, error:function(request, status, error){
				
			}
		});
	});
	$("#joinBtn").on("click",function(){
		let id = $("#useridJ").val();
		let pw = $("#pwJ").val();
		let name = $("#name").val();
		let age = $("#age").val();
		let thumnail = $("#thumnail").val();
			
		if(id==""){
			alert("아이디를 입력하세요.");
			$("#useridJ").focus();
			return;
		}
		if(pw==""){
			alert("비밀번호를 입력하세요.");
			$("#pwJ").focus();
			return;
		}
		if(name=="" ){
			alert("이름 입력하세요.");
			$("#name").focus();
			return;
		}
		if(age==""){
			alert("생일 입력하세요.");
			$("#age").focus();
			return;
		} 
		console.log(age);
		$.ajax({
			url: "${path }/login/idcheck",
			type: "post",
			data: {"id" : id},
			dataType: "json",
			success:function(data){
			console.log(data);
				if(data){
					$("#signupForm").submit();
					console.log("1111111111111");
				} else {
					$("#idcheckMsg").css("color","red");
					$("#idcheckMsg").text("아이디가 존재합니다");		
				}
					
			}, 
			error:function(request, status, error ){
				console.log(error);
			}
		});
	});
	
	$("#signupclick").click(function(){
		$("#useridL").val("");
		$("#pwL").val("");
		$("#loginMsg").val("");
		$("#login").hide();
		$("#join").show();
	});
	$("#signinclick").click(function(){
		$("#useridJ").val("");
		$("#pwJ").val("");
		$("#name").val("");
		$("#age").val("");
		$("#idcheckMsg").val("");
		$("#login").css({"display":"block"});
		$("#join").css({"display":"none"});
	});
});
</script>
</head>
<body>
	
	<div id="sign_form">
		<div id="img">
			<img alt="로고이미지" src="${path }/image/logo.svg" id="logo">
		</div>
		<div id="container">
			<div id="login" class="form_field">
				<form action="" method="POST" class="form login">
					<div id="signupclick"  class="change">
						<span class="or">or</span>
						<span class="sign">SIGNUP?</span>
					</div>
					<div class="inputWithIcon">
						<input type="text" id="useridL" name="id" class="form_input" placeholder="Id">
						<i class="fa fa-user fa-lg fa-fw" aria-hidden="true"></i>
					</div>
					<div class="inputWithIcon">
						<input type="password" id="pwL" name="pw" class="form_input" placeholder="Password">
						<i class="fas fa-lock fa-lg fa-fw" aria-hidden="true"></i>
					</div>
					<div>
						<span id="loginMsg"></span>
					</div>
					<input type="button" id="loginBtn" value="LOGIN">
					
				</form>
			</div>
			<div id="join" class="form_field">
				<form action="${path }/login/signup-regist" id="signupForm" method="POST" class="form join">
					<input type="hidden" id="thumnail" name="thumnail" value="${path }/image/members/' + id + '/thumnail.jpg">
					<input type="hidden" id="introduce" name="introduce" value="">
					<div id="signinclick" class="change">
						<span class="or">or</span>
						<span class="sign">SIGNIN?</span>
					</div>
					<div class="inputWithIcon">
						<input type="text" id="useridJ" name="id" class="form_input" placeholder="Id">
						<i class="fa fa-user fa-lg fa-fw" aria-hidden="true"></i>
					</div>
					<div class="inputWithIcon">
						<input type="password" id="pwJ" name="pw" class="form_input" placeholder="Password">
						<i class="fas fa-lock fa-lg fa-fw" aria-hidden="true"></i>
					</div>
					<div class="inputWithIcon">
						<input type="text" id="name" name="name" class="form_input" placeholder="Name">
						<i class="fas fa-id-card fa-fw" aria-hidden="true"></i>
					</div>
					<div class="inputWithIcon">
						<input type="date" id="age" name="age" class="form_input" placeholder="19000101">
						<i class="fas fa-birthday-cake fa-lg fa-fw" aria-hidden="true"></i>
					</div>
					<div>
						<span id="idcheckMsg"></span>
					</div>
					<input type="button" id="joinBtn" name="joinBtn" value="JOIN">
				</form>
			</div>
		</div>
		<div>
		</div>
	</div>
</body>
</html>