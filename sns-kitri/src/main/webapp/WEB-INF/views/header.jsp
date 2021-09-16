<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kistagram</title>
<link rel="stylesheet" href="${path}/assets/css/header.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
// $(document).ready(function(){
// 		$("#uploadBtn").on("click",function(){
// 			var formData = new FormData();
// 			formData.append("uploadfile",$("#uploadfile").val());
			
// 			$ajax({
// 				type: "post",
// 				enctype="multipart/form-data",
// 				url: "${path }/fileupload",
// 				data: data,
// 				dataType: "json",
// 				success:function(data){
					
				
// 					}
// 				});
// 		$("#cancleBtn").on("click", function(){
			
// 		  $("#preview").remove();
			
		
// 		});

// });


</script>
</head>
<body>
	
	<div>
 	<!-- 클릭할 이미지 -->
	<div id="imgList">
<!-- 		<div id="imgC"> -->
<!-- 			<img src="" alt="모달할 이미지"> -->
		<a href="#" id="editnav">
		<img src="${path}/image/icon/edit.png" alt="모달할 이미지"></a>	
		</div>

</div>
		<!-- 모달창 -->  
	<div id="modal-wrapper"> 
		<div id="modal-cancle-btn">X</div> 
		<div id="modal-box">
			<form action="${path }/header/fileupload" method="post" enctype="multipart/form-data" id="form">
				<div>
					<input multiple="multiple" type="file" name="uploadfile" id="uploadfile">
				</div>
				<!-- 이미지  -->
				<img alt="a" src="" id="preview">
				
				
				<!-- 게시글 작성 -->
				<div>
					<input type="text" placeholder="설명을 입력하세요" id="content" name="content">
				</div>
				
				<!--전송 버튼  -->
				<div>
					<input type="submit" value="취소" id="cancleBtn">
					<input type="submit" value="사진업로드"  id="uploadBtn">
				</div>
		
			</form> 
			<!--  이미지 미리보기  -->
		<script type="text/javascript">
		$('#uploadfile').change(function(){
		    setImageFromFile(this, '#preview');
		});

		function setImageFromFile(input, expression) {
		    if (input.files && input.files[0]) {
		        var reader = new FileReader();
		        reader.onload = function (e) {
		            $(expression).attr('src', e.target.result);
		        }
		        reader.readAsDataURL(input.files[0]);
		    }
		}
		
		</script>
		</div> 
		<div id="modal-cancle-area"></div> 
	</div>
	
	<script type="text/javascript">
	$(function(){
//	 	이미지 클릭시 해당 이미지 모달
		$("#editnav").click(function(){
			$("#modal-wrapper").show();
	
		});
		
		//.modal안에 button을 클릭하면 .modal닫기
		$("#modal-cancle-btn").click(function(){
			$("#modal-wrapper").hide();
		});	
	
	});
		
	</script>
	</body>
	</html>
