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
	display:flex;
	align-items: center;
}

.memberthumnail{
	width:44px;
	height:44px;
	margin : 10px;
}

.memberthumnail > img{
	border-radius:50%;
	
}

img {
	width: 100%;
	height: 100%;
}

#content{
	margin: 10px;
}
#regdate{
	margin-left: 15px;
	font-size:small;
	color:gray;
}
</style>
<script>
	$(document).ready(function() {
		console.log('${feedList}');
	});
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
			<div id="content">${feedvo.content }</div>

			<div id="regdate">${feedvo.regdate}</div>
		</div>
	</c:forEach>
</div>

</body>
</html>