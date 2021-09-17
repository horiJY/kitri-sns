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
}

#replybox {
   margin:10px;
   max-height: 120px;
    overflow-x: auto;
}

#regdate {
   margin-left: 10px;
   margin-bottom: 10px;
   font-size: small;
   color: gray;
}
.replyline{
display: flex;
}
.replymemberid{
margin-left:1%;
    width: 20%;
    font-weight: 600;
    
}
.replycontent{
    width: 60%;
}
.replydate{
    font-size: xx-small;
    width: 17%;
        font-weight: 900;
    
}
#replytextwrapper{
   width:100%;
   height:21px;
	display: flex;
   flex-wrap: wrap;
}
#pushreply {
   background-image: url("image/icon/edit.png");
    width: 20px;
    height: 100%;
    background-size: cover;
}
#inputreply{
   height:16px;
   width: 94.5%;
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
         <div id="replybox">
         	<c:forEach items="${feedvo.replys }" var="replys">
         		<div class="replyline">
	         		<div class="replymemberid">
	      				${replys.member_Id }
	         		</div>
	         		<div class="replycontent">
	         			${replys.reply }
	         		</div>
	         		<div class="replydate">
	         			${replys.reg_date }
	         		</div>
         		</div>
         	</c:forEach>
	     </div>
         <div id="replytextwrapper">
            <div id="pushreply"></div>
            <input id="inputreply" type="text" />
         </div>
   </c:forEach>
   </div>
	<div id="morefeedwrapper" />
<div id="morelist">더 보기</div>
<script>
   $(document).ready(function() {
	   
	   var likebtnupdate = function(event) {
	    	  console.log(event.target);
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
	       };
       $(".likebtn").on("click",likebtnupdate);
// 	   var loadreply = function(){
// 		   console.log('${replyList}');
// 		   var replyjson  = JSON.parse('${replyList}'.replace(/\"\[/g,'\[').replace(/\]\"/g,'\]'));
// 	    	  console.log(replyjson);
// // 	    	  console.log("keys: "+Object.keys(replyjson));
// // 	    	  console.log("values: "+Object.values(replyjson));
// 	//     	  console.log('reply length '+ Object.keys(replyjson).length);
// 	//     	  console.log('feed length '+$("#morefeedwrapper").length);
// 			var keyset = Object.keys(replyjson)
// 			console.log(keyset);
// 			if(Object.keys(replyjson).length > 0){
// 				let replylist = "";
// 			    for(let i = 0; i < $("#feedwrapper").length; i++){
// 				    console.log(Object.values(replyjson));
				    
// 					for(let c = 0; c < replyjson["1"].length; c++){
// 					    console.log(replyjson["1"][c] );
					    
// // 					    <div class="replymemberid">
// // 		         		rosie_and_rosei
// // 		         		</div>
// // 		         		<div class="replycontent">
// // 		         		내용123412341234
// // 		         		</div>
// // 		         		<div class="replydate">
// // 		         		2021-09-17 11:24
// // 		         		</div>
// 					}
// 			    }
// 			}
		   
// 	   }
// 	   loadreply();
      
      //피드 더 불러오기
      $("#morelist").on("click", function() {
         let start = $("#morefeedwrapper").length;
         let end = start + 8;

               $.ajax({
                  url:"${path}/morelist",
                  type:"post",
                  data:{"start":start,"end":end},
                  dataType:"json",
                  success:function(data){
//                      console.log(data);
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
                                       +"    <div id='likes'> <img class='likebtn' src='${path}/image/icon/noti.png' />좋아요 "+data[i].likes+"개</div>"
                                       +"    <div id='feedcontent'>"+data[i].content+"</div>"
                                       +"    <div id='regdate'>"+data[i].regdate+"</div>"
                                       +"<div id='replybox'>";
                                       
							  for(let j=0; j<data[i].replys.length; j++){
							  	morefeedlist += "<div class='replyline'>"
							  						+"<div class='replymemberid'>"		  
	                                			  	+data[i].replys[j].member_Id
	                                			  	+"</div>"
	                                			  	+"<div class='replycontent'>"
	                                			  	+data[i].replys[j].reply
	                                			  	+"</div>"
	                                			  	+"<div class='replydate'>"
	                                			  	+data[i].replys[j].reg_date
	                                			  	+"</div>"
	                                			+"</div>";
							  }
							  morefeedlist += "	     </div>"
							         +"<div id='replytextwrapper'>"
					            	 +"<div id='pushreply'></div>"
					            	 +"<input id='inputreply' type='text' />"
					         		+"</div>";
                                       
                        }
                        $("#morefeedwrapper").append(morefeedlist).trigger("create");
                        $(".likebtn").on("click",likebtnupdate);
                     }
                  },
                  error:function(request,status,error){
                     console.log("code:"+request.status);
                     console.log("message:"+request.responseText);
                     console.log("error:"+error);
                  }
               });
      });
      
   });//   $(document).ready end

</script>
</body>
</html>