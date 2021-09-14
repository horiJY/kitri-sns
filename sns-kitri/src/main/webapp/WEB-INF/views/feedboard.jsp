<%@ include file="header.jsp" %>

<script>
$(document).ready(function(){
	console.log('${feedList}.val');
});
</script>

	<div id="feedList">
		<c:forEach items="${feedList}" var="feedvo">
			<div class="feedBox">
				<input type="text" name="no" value="${feedvo.feedId}">
				<input type="text" name="userid" value="${feedvo.memberId}">
				<c:forEach items="${feedvo.imageURL}" var="url">
					<input type="text" name="content" value="${url}">
					<img alt="저장된 이미지" src="${path}/image/member/${feedvo.memberId}/${feedvo.feedId}/${url}">
				</c:forEach>
				<input type="text" name="regdate" value="${feedvo.regdate}">
			</div>
		</c:forEach>
	</div>

</body>
</html>