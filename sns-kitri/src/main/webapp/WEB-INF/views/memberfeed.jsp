<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<style>
body {
	margin: 0px auto;
	max-width: 1200px;
}

#infowrapper {
	margin: auto;
	width: 95%;
	max-width: 935px;
	height: 25%;
	max-height: 150px;
	margin-top: 50px;
	display: flex;
	align-items: center;
	justify-content: center;
}

#memberbigthumnail {
	width: 40%;
	max-width: 150px;
	height: 100%;
	max-width: 150px;
	margin-right: 10%;
}

#memberbigthumnail>img {
	border-radius: 50%;
}

#memberinfowrapper {
	width: 33%;
}

#infomemberid {
	font-size: xx-large;
	font-weight: 100;
}

#cntwrapper {
	width: 100%;
	height: 100%;
	justify-content: space-between;
	display: flex;
	font-size: medium;
	font-weight: 600;
	margin-top: 5%;
	margin-bottom: 5%;
}

#name {
	font-weight: bold;
}

#introduce {
	width: 100%;
	height: auto;
	margin-top: 5%;
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

#likes {
	font-size: small;
	margin-left: 10px;
	display: flex;
}

.likebtn {
	margin-right: 10px;
	width: 20px;
	height: 20px;
}

#feedcontent {
	margin: 10px;
	height: 100px;
	overflow-x: auto;
}

#replybox {
	margin: 10px;
	max-height: 120px;
	overflow-x: auto;
}

#regdate {
	margin-left: 10px;
	margin-bottom: 10px;
	font-size: small;
	color: gray;
}

.replyline {
	display: flex;
}

.replymemberid {
	margin-left: 1%;
	width: fit-content;
	font-weight: 600;
}

.replycontent {
	width: 55%;
	margin-left: 2%;
}

.replydate {
	font-size: xx-small;
	font-weight: 900;
	margin-left: auto;
}

#replytextwrapper {
	width: 100%;
	height: 21px;
	display: flex;
}

#pushreply {
	background-image: url("http://localhost:8080/sns/image/icon/edit.png");
	width: 20px;
	height: 100%;
	background-size: cover;
}

#inputreply {
	height: 16px;
	width: 94.5%;
}

#morelist {
	border: 0;
	cursor: pointer;
	text-align: center;
	margin: 5px;
}
</style>

<div>
	<%-- 	<c:set value="${infoList}" var="infoList" /> --%>
	<div id="infowrapper">
		<div id="memberbigthumnail">
			<img src="${path}/image/members/${infoList.memberId}/thumnail.jpg">
		</div>
		<div id="memberinfowrapper">
			<div id="infomemberid">${infoList.memberId }</div>
			<div id="cntwrapper">
				<div id="feednum">????????? ${infoList.feedsCnt }</div>
				<div id="followernum">????????? ${infoList.follower }</div>
				<div id="followingnum">????????? ${infoList.following }</div>
			</div>
			<div id="name">${infoList.name }</div>
			<div id="introduce">${infoList.introduce }</div>
		</div>
	</div>
</div>

<hr style="margin-top: 5%; border-bottom-width: thick;">
<script type="text/javascript">
	console.log('${feedList}');
</script>
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
				<img class="likebtn" src="${path}/image/icon/noti.png" /> ?????????
				${feedvo.likes } ???
			</div>
			<div id="feedcontent">${feedvo.content }</div>
			<div id="regdate">${feedvo.regdate}</div>
			<div id="replybox">
				<c:forEach items="${feedvo.replys }" var="replys">
					<div class="replyline">
						<div class="replymemberid">${replys.member_Id }</div>
						<div class="replycontent">${replys.reply }</div>
						<div class="replydate">${replys.reg_date }</div>
					</div>
				</c:forEach>
			</div>
			<div id="replytextwrapper">
				<div id="pushreply"></div>
				<input id="inputreply" type="text" />
			</div>
		</div>
	</c:forEach>
	<div id="morefeedwrapper"></div>
</div>



<!-- <div id="morelist">??? ??????</div> -->
<script>
	// 	$(document).ready(function() {
	// 		$("#morelist").on("click", function() {
	// 			let start = $("#morefeedwrapper").length;
	// 			let end = start + 8;

	// 				$.ajax({
	// 					url:"${path}/morefeedlist",
	// 					type:"post",
	// 					data:{"start":start,"end":end},
	// 					dataType:"json",
	// 					success:function(data){
	// 					console.log(data);
	// 					if(data.length < 9){
	// 						$("#morelist").remove();
	// 					}

	// 					if(data.length>0){
	// 						let morefeedlist = "";
	// 						for(let i=0; i < data.length; i++){
	// 							morefeedlist += "<div class='feedwrapper'>"
	// 										+"<input type='hidden' id='feedid' value='"+data[i].feedId+"'/>"
	// 										+"<div id='memberid'>"
	// 										+"<div class='memberthumnail'>"
	// 										+"<img src='${path}/image/members/"+data[i].memberId+"/thumnail.jpg' />"
	// 										+"</div>"
	// 										+data[i].memberId
	// 										+"</div>"
	// 										+"<div id='imgListWrapper'>";
	// 										for(let j=0; j<data[i].imageURL.split(',').length; j++){
	// 											morefeedlist += "<img class='feedimgbox' src='${path}/image/members/"+data[i].memberId+"/"+data[i].feedId+"/"+data[0].imageURL.split(',')[j]+"'>"; 
	// 										}
	// 							morefeedlist += "</div>"
	// 										+"    <div id='likes'> ????????? "+data[i].likes+"???</div>"
	// 										+"    <div id='feedcontent'>"+data[i].content+"</div>"
	// 										+"    <div id='regdate'>"+data[i].regdate+"</div>"
	// 										+"</div>";
	// 						}
	// 						$("#morefeedwrapper").append(morefeedlist).trigger("create");
	// 					}
	// 				},
	// 				error:function(request,status,error){
	// 					console.log("code:"+request.status);
	// 					console.log("message:"+request.responseText);
	// 					console.log("error:"+error);
	// 				}
	// 			});
	// 		});
	// 	});
</script>
</body>
</html>
