<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp"%>
<style>
body {
	margin: 0px auto;
	max-width: 1200px;
}

#feedList {
	margin: auto;
	width: 44%;
	max-width: 870px;
	height: auto;
	margin-top: 50px;
}

.feedwrapper {
	width: auto;
	height: auto;
	border: 1px solid gray;
	margin: 5px;
}

#imgListWrapper {
	width: 100%;
	height: 100%;
	overflow: hidden;
	white-space: nowrap;
}

#imgListWrapper:hover {
	overflow-x: auto;
}

.feedimgbox {
	max-height: 95%;
	margin: 5px;
	display: inline-block;
	flex-shrink: 0;
	white-space: normal;
}

#memberid {
	display: flex;
	align-items: center;
}

.memberthumnail {
	width: 44px;
	height: 44px;
	margin: 10px;
}

.memberthumnail>img {
	border-radius: 50%;
}

img {
	width: 98%;
	height: 100%;
}

#likes{
	font-size: small;
	margin-left:10px;
	display: flex;
}

.likebtn{
	margin-right:10px;
	width:20px;
	height:20px;
}

#feedcontent {
	margin: 10px;
	height: 100px;
    overflow-x: auto;
}

#regdate {
	margin-left: 10px;
	margin-bottom: 10px;
	font-size: small;
	color: gray;
}

#morelist {
	border: 0;
	cursor: pointer;
	text-align: center;
	margin: 5px;
}
</style>

<div id="feedList">
	<c:forEach items="${feedList}" var="feedvo">
		<div class="feedwrapper">
			<input type="hidden" id="feedid" value="${feedvo.feedId}" />
			<div id="memberid">
				<div class="memberthumnail">
					<img src="${path}/image/members/${feedvo.memberId}/thumnail.jpg">
				</div>
				${feedvo.memberId}
			</div>
			<div id="imgListWrapper">
				<c:forEach items="${feedvo.imageURL}" var="imgurl">
					<img class="feedimgbox"
						src="${path}/image/members/${feedvo.memberId}/${feedvo.feedId}/${imgurl}">
				</c:forEach>
			</div>
			<div id="likes">
				<img class="likebtn" src="${path}/image/icon/noti.png"/>
				좋아요 ${feedvo.likes } 개
			</div>
			<div id="feedcontent">${feedvo.content }</div>

			<div id="regdate">${feedvo.regdate}</div>
		</div>
	</c:forEach>
	<div id="morefeedwrapper">
	</div>
</div>
<div id="morelist">더 보기</div>
<script>
	$(document).ready(function() {
		$("#morelist").on("click", function() {
			let start = $("#morefeedwrapper").length;
			let end = start + 8;

					$.ajax({
						url:"${path}/morelist",
						type:"post",
						data:{"start":start,"end":end},
						dataType:"json",
						success:function(data){
							console.log(data);
							if(data.length < 9){
								$("#morelist").remove();
							}

							if(data.length>0){
								let morefeedlist = "";
								for(let i=0; i < data.length; i++){
									morefeedlist += "<div class='feedwrapper'>"
										+"<input type='hidden' id='feedid' value='"+data[i].feedId+"'/>"
										+"<div id='memberid'>"
										+"<div class='memberthumnail'>"
										+"<img src='${path}/image/members/"+data[i].memberId+"/thumnail.jpg' />"
										+"</div>"
										+data[i].memberId
										+"</div>"
										+"<div id='imgListWrapper'>";
										for(let j=0; j<data[i].imageURL.split(',').length; j++){
											morefeedlist += "<img class='feedimgbox' src='${path}/image/members/"+data[i].memberId+"/"+data[i].feedId+"/"+data[0].imageURL.split(',')[j]+"'>"; 
										}
										morefeedlist += "</div>"
													+"    <div id='likes'> 좋아요 "+data[i].likes+"개</div>"
													+"    <div id='feedcontent'>"+data[i].content+"</div>"
													+"    <div id='regdate'>"+data[i].regdate+"</div>"
													+"</div>";
								}
								$("#morefeedwrapper").append(morefeedlist).trigger("create");
							}
						},
						error:function(request,status,error){
							console.log("code:"+request.status);
							console.log("message:"+request.responseText);
							console.log("error:"+error);
						}
					});
		});
		
		$(".likebtn").on("click",function(event) {
			let selectfeed = $(event.target).parent().parent();
			
			$.ajax({
				url:"${path}/feedlike",
				type:"post",
				data:{"feedid": selectfeed.children('#feedid').val()},
				dataType:"json",
				success:function(data){
					selectfeed.children('#likes').html('<img class="likebtn" src="${path}/image/icon/likecheck.png"/> 좋아요 '+data+' 개');
				},
				error:function(request,status,error){
					console.log("code:"+request.status);
					console.log("message:"+request.responseText);
					console.log("error:"+error);
				}
			});
			
			
		});
	});
</script>
</body>
</html>