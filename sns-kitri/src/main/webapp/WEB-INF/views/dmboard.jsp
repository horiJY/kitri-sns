<!DOCTYPE html>
<html lang="ko">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>

    <style>
body {
	padding: 5%;
	background-color: #F5F5F5;
}

.container {
	padding: 0;
	background-color: #FFF;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px
		rgba(0, 0, 0, 0.23);
	height: 700px;
}
/* === CONVERSATIONS === */
.discussions {
	width: 35%;
	height: 700px;
	box-shadow: 0px 8px 10px rgba(0, 0, 0, 0.20);
	overflow: hidden;
	background-color: #87a3ec;
	display: inline-block;
}

.discussions .discussion {
	width: 100%;
	height: 90px;
	background-color: #FAFAFA;
	border-bottom: solid 1px #E0E0E0;
	display: flex;
	align-items: center;
	cursor: pointer;
}

.discussions .search {
	display: flex;
	align-items: center;
	justify-content: center;
	color: #E0E0E0;
}

.discussions .search .searchbar *::-webkit-input-placeholder {
	color: #E0E0E0;
}

.discussions .search .searchbar input *:-moz-placeholder {
	color: #E0E0E0;
}

.discussions .search .searchbar input *::-moz-placeholder {
	color: #E0E0E0;
}

.discussions .search .searchbar input *:-ms-input-placeholder {
	color: #E0E0E0;
}

.discussions .message-active {
	width: 98.5%;
	height: 90px;
	background-color: #FFF;
	border-bottom: solid 1px #E0E0E0;
}

.discussions .discussion .photo {
	margin-left: 20px;
	display: block;
	width: 45px;
	height: 45px;
	background: #E6E7ED;
	-moz-border-radius: 50px;
	-webkit-border-radius: 50px;
	background-position: center;
	background-size: cover;
	background-repeat: no-repeat;
}

.desc-contact {
	height: 43px;
	width: 95%;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.discussion .name {
	margin: 0 0 0 10px;
	width: 100%;
	font-family: 'Montserrat', sans-serif;
	font-size: 11pt;
	color: #515151;
}

.discussion .message {
	margin: 6px 0 0 20px;
	width: 100px;
	font-family: 'Montserrat', sans-serif;
	font-size: 9pt;
	color: #515151;
}

.discussions .discussion .timedate {
	position: absolute;
	margin-left: 22%;
	margin-top: 1.8%;
	font-family: 'Montserrat', sans-serif;
	font-size: 8pt;
	color: #515151;
}

.desc-contact .timer {
	font-family: 'Open Sans', sans-serif;
	font-size: 11px;
	padding: 3px 8px;
	color: #BBB;
	background-color: #FFF;
	border: 1px solid #E5E5E5;
	border-radius: 15px;
}

.header-chat {
	background-color: #FFF;
	height: 90px;
	box-shadow: 0px 3px 2px rgba(0, 0, 0, 0.100);
	display: flex;
	align-items: center;
}

.text-only {
	margin-left: 45px;
}

.time {
	font-size: 10px;
	color: lightgrey;
	margin-bottom: 10px;
	margin-left: 85px;
}

.response-time {
	float: right;
	margin-right: 40px !important;
}

.response {
	float: right;
	margin-right: 0px !important;
	margin-left: auto; /* flexbox alignment rule */
}

.response .text {
	background-color: #e3effd !important;
}

.footer-chat {
	width: calc(65% - 66px);
	height: 80px;
	display: flex;
	align-items: center;
	position: absolute;
	bottom: 0;
	background-color: transparent;
	border-top: 2px solid #EEE;
}

.write-message {
	border: none !important;
	width: 60%;
	height: 50px;
	margin-left: 20px;
	padding: 10px;
}

.footer-chat *::-webkit-input-placeholder {
	color: #C0C0C0;
	font-size: 13pt;
}

.footer-chat input *:-moz-placeholder {
	color: #C0C0C0;
	font-size: 13pt;
}

.footer-chat input *::-moz-placeholder {
	color: #C0C0C0;
	font-size: 13pt;
	margin-left: 5px;
}

.footer-chat input *:-ms-input-placeholder {
	color: #C0C0C0;
	font-size: 13pt;
}

.clickable {
	cursor: pointer;
}

.discussion search {
	text-align: left;
}

.icon-back {
	color: black;
	font-size: 25pt;
	left: 40pt;
	padding: 10px;
}

.my-id {
	color: black;
	font-size: 13pt;
	padding: 10px;
}

.icon-message {
	float: none;
	font-size: 22pt;
	left: 230pt;
	padding: 10px;
}

.leftdiscussion {
	width: 63%;
	margin-left: 5px;
	height: 700px;
	box-shadow: 0px 8px 10px rgb(0 0 0/ 20%);
	overflow: hidden;
	display: inline-block
}

.left-text {
	text-align: center;
	height: 50%;
	margin-top: 10%;
}

.message-icon {
	font-size: 200px;
	color: gray;
}

a {
	-webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	display: block;
	margin: 20px auto;
	max-width: 180px;
	text-decoration: none;
	border-radius: 4px;
	padding: 20px 30px;
}

a.button {
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}

a.button:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(102, 153, 255, 0.7) 0 0px 0px 40px inset;
}

/* 왼쪽 CSS */
@import "https://fonts.googleapis.com/css?family=Montserrat";

.chat {
	width: 63%;
	margin-left: 5px;
	height: 700px;
	box-shadow: 0px 8px 10px rgb(0 0 0/ 20%);
	overflow: hidden;
	display: inline-block
}

.chat_header {
	padding: 10px;
	background: #f0f0f0;
	color: teal;
}

.chat_status {
	float: left;
	size: 100%;
	width: 20px;
	color: red;
}

.chat .photo {
	margin-left: 20px;
	margin-right: 20px;
	display: block;
	width: 45px;
	height: 45px;
	background: #E6E7ED;
	-moz-border-radius: 50px;
	-webkit-border-radius: 50px;
	background-position: center;
	background-size: cover;
	background-repeat: no-repeat;
}

.chat_input {
	margin-bottom: 10%;
	bottom: 10pt;
	padding: 10px 4px 6px;
	background: #c8c8c8;
}

.chat_text {
	width: 80%;
	padding: 10px;
	box-sizing: border-box;
	margin: 0 5px 5px;
	vertical-align: top;
	font-family: "Montserrat", sans-serif;
}

.chat_submit {
	width: 5%;
	padding: 20px;
	box-sizing: border-box;
	margin: 0 5px 5px 0;
	vertical-align: top;
	border: 1px solid teal;
	cursor: pointer;
	color: teal;
	transition: all 0.4s;
}

.chat_id-1, .chat_id-2 {
	padding: 10px;
	margin: 13px 13px;
	width: 200px;
	font-size: 14px;
}

.id-1 {
	clear: both;
	margin-bottom: 3px;
	margin-right: 70%;
}

.id-2 {
	clear: both;
	margin-bottom: 3px;
	margin-left: 70%;
}

.chat_id-1 {
	border: 1px solid teal;
	border-radius: 12px 12px 12px 0;
}

.chat_id-2 {
	border: 1px solid grey;
	border-radius: 12px 12px 0 12px;
}

.message-time {
	margin-top: 10pt;
}

.chat_s {
	height: 80%;
	overflow-y: scroll;
	padding: 15px 0 0;
}

::-webkit-scrollbar {
	width: 13px;
}

::-webkit-scrollbar-thumb {
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 0 4px #fff;
	background: rgba(0, 0, 0, 0.2);
}

h3 {
	margin-left: 10%;
}
.leftsearchbar {
	width: 63%;
	margin-left: 5px;
	height: 700px;
	box-shadow: 0px 8px 10px rgb(0 0 0/ 20%);
	overflow: hidden;
	display: inline-block
}

.leftsearchbar .search {
	display: flex;
	align-items: center;
	justify-content: center;
	color: #E0E0E0;
}

.leftsearchbar .search .searchbar {
	height: 40px;
	background-color: #FFF;
	width: 70%;
	padding: 0 20px;
	border-radius: 50px;
	border: 1px solid #EEEEEE;
	display: flex;
	align-items: center;
	cursor: pointer;
}

.leftsearchbar .search .searchbar input {
	margin-left: 15px;
	height: 38px;
	width: 100%;
	border: none;
	font-family: 'Montserrat', sans-serif;;
}
</style>

<script>
    $(document).ready(function(){
    	$('.chat').hide();
		$('.leftsearchbar').hide(); 
		$('.leftdiscussion').show();
     	
		//나의 id
        var myId = "bn_sj2013";
        $('.my-id').html;
        $('.my-id').append(myId);
        
        var dmList = '${dmList}';
//        console.log(dmList);
        
        
        const obj = JSON.parse(dmList);
        

        
	 	//현제 날짜 체크
	 	let today = new Date();   

		let years = today.getFullYear(); // 년도
		let month = today.getMonth() + 1;  // 월
		let date = today.getDate();  // 날짜
		let day = today.getDay();  // 요일
		let year = years-2000;
		if(month<10){
			month = "0"+month;
		}
		if(date<10){
			month = "0"+date;
		}
		let todayDate = (year +  month +  date);
		//console.log(todayDate);
		
		
		
		
        //KEY값만 추출
       	var key = Object.keys(obj);
       	var value = Object.values(obj);
        
        //KEY 개수
        //console.log(name.length);
		
        
        //왼쪽 채팅 리스트
        for(var i=0; i<key.length; i++){
        	var chatvalues = value[i];
            if(myId == chatvalues[0]){
            	lastchat =
					"<p class='name'>"+chatvalues[1]+"</p>"+
					"<span class='message'>"+chatvalues[3]+"</span>"+
					"<span class='timer'>"+chatvalues[2];+"</span>"				
					$('.desc-contact').append(lastchat);

            }else if(myId == chatvalues[1]){
            	lastchat =
				"<p class='name'>"+chatvalues[0]+"</p>"+
				"<span class='message'>"+chatvalues[3]+"</span>"+
				"<span class='timer'>"+chatvalues[2];+"</span>"				
				$('.desc-contact').append(lastchat);
            	}
            	
         }
        
        
      //메세지 보내기 누를 때
        $('.button').on("click", function(){        	
			$('.leftdiscussion').hide();
			$('.chat').hide();
			$('.leftsearchbar').show();
			
			 $.ajax({
	              type : 'get',
	              url: '${path }/dmsearch',
	              data : {'memberId' : myId},
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
        });
        
        
        

       //위에 메세지 icon 누를 때
        $('.icon-message').on("click", function(){
            $('.leftdiscussion').hide();
            $('.chat').hide();
           	$('.leftsearchbar').show();
           	
           	
            $.ajax({
                type : 'get',
                url: '${path }/dmsearch',
                data : {'memberId' : myId},
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
           
        });
                   

        //채팅창 누를때
        /* 
        $('.desc-contact').on("click", function(){
    		$('.leftdiscussion').hide();
    		$('.leftsearchbar').hide();
    		$('.chat').show();
    		
    		//왼쪽 채팅창 아이디
    		var reveiverId = $(this).children().first().text();
    		//console.log(reveiverId);
    		//senderId=bn_sj2013&receiverId=jennierubyjane&day=210913
    		
     		
             $.ajax({
                 url:"http://localhost:8080/sns-kitri/message/detail",
                 type:"post",
                 data:{"senderId" : myId, "receiverId" : reveiverId, "day" : todayDate-4},
                 dataType:"json",
                 success:function(data){
                	 	//0: {sender: "bn_sj2013", receiver: "jennierubyjane", time: "20210914 13:21:33", msg: "^^"}
                 		//1: {sender: "jennierubyjane", receiver: "bn_sj2013", time: "20210915 08:21:33", msg: "TEST0915오전8시"}
                			for(var i=0; i<data.length; i++){
                				//시간값 자르기
                				var time = data[i].time;
                				var Stime = time.substring(9,14);
                				
                				//myId=sender일때 채팅창
                				if(myId==data[i].sender){
            						chat = 
            						"<div class='id-1'>"+
        								"<div class='chat_id-1'>"+data[i].msg+"</div>"+
        								"<span class='message-time-id1'>"+Stime+"</span>"+
        							"</div>"
       								//myId=sender일때 채팅추가			
                					$('.chat_s').append(chat);
                				}
                				//!myId=sender
                				else{
        							chat1 =
        							"<div class='id-2'>"+
    									"<div class='chat_id-2'>"+data[i].msg+"</div>"+
    									"<span class='message-time'>"+Stime+"</span>"+
    								"</div>"
    								$('.chat_s').append(chat1);
                				}
                			}
                			
                		}
             		});    		
			
			
         		}); 
        		*/
        		
        //채팅창 누를때
        $('.desc-contact').on("click", function(){
          $('.leftdiscussion').hide();
          $('.leftsearchbar').hide();
          $('.chat').show();
          
          //왼쪽 채팅창 아이디
          var reveiverId = $(this).children().first().text();
          //senderId=bn_sj2013&receiverId=jennierubyjane&day=210913
          
           
             $.ajax({
                 url:"http://localhost:8080/sns-kitri/message/detail",
                 type:"post",
                 data:{"senderId" : myId, "receiverId" : reveiverId, "day" : todayDate-4},
                 dataType:"json",
                 success:function(data){
                       //0: {sender: "bn_sj2013", receiver: "jennierubyjane", time: "20210914 13:21:33", msg: "^^"}
                       //1: {sender: "jennierubyjane", receiver: "bn_sj2013", time: "20210915 08:21:33", msg: "TEST0915오전8시"}
                         for(var i=0; i<data.length; i++){
                            //시간값 자르기
                            var time = data[i].time;
                            var Stime = time.substring(9,14);
                            
                            //myId=sender일때 채팅창
                            if(myId==data[i].sender){
                              chat = 
                              "<div class='id-1'>"+
                                "<div class='chat_id-1'>"+data[i].msg+"</div>"+
                                "<span class='message-time-id1'>"+Stime+"</span>"+
                             "</div>"
                               //myId=sender일때 채팅추가         
                               $('.chat_s').append(chat);
                            }
                            //!myId=sender
                            else{
                             chat1 =
                             "<div class='id-2'>"+
                               "<div class='chat_id-2'>"+data[i].msg+"</div>"+
                               "<span class='message-time'>"+Stime+"</span>"+
                            "</div>"
                            $('.chat_s').append(chat1);
                            }
                         }
                         
                      }
                   });          
         
         
               });
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    });
    



</script>
    

</head>
<body>
    <body>
        <div class="container">
        	
        		<section class="discussions">
                    <div class="discussion search">
                        <a class="icon-back" href="#">❮</a>
                        <a class="my-id"></a>
                        <a class="icon-message">💬</a>
                    </div>
                    
                    <!-- <div class="discussion message-active"> -->
						<div class="discussion">
							<div class="photo"
								style="background-image: url(https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80);">
							</div>
							
						<div class="desc-contact">
						<!-- 							
							<p class="name">aa</p>
							<p class="message">aa</p>
							<div class="timer">aa</div> 
						-->
						</div>
						</div>
                </section>
                

          <!-- 메세지 보내기 -->
                <section class="leftdiscussion">
                    <div class="left-text" >
						<div class="chat_header">
                        	<div class="message-icon">✉</div>
                        		<h4>내 메시지</h4>
                        		<h4>친구나 그룹에 비공개 메시지를 보내세요.</h4>
                        		<a class="button">메세지 보내기</a>
						</div>
					</div>
				</section>
                
         	<!-- 채팅창 -->
                <section class="chat">
					<div class="chat_header">
						<img class="photo" style="background-image: url(https://images.unsplash.com/photo-1541747157478-3222166cf342?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=967&q=80);"/>
						
						<hr class="chat_status"/>
					</div>
					<div class="chat_s">
						<!-- 채팅 말 풍선 -->
					</div>
					<div class="chat_input">
						<input placeholder="Type here..." class="chat_text" onkeypress="if(event.keyCode === 13){add()}">
						<button onclick="add()" class="chat_submit"></button>
					</div>
				</section>
				
				<!-- 채팅 엔터키 -->
				<script>
				//현재 시간 표시
				var nowtime = new Date();
				var hours = ('0' + nowtime.getHours()).slice(-2); 
				var minutes = ('0' + nowtime.getMinutes()).slice(-2);
				var timenow = hours + ':' + minutes;
				document.getElementsByClassName('message-time-id1').value = timenow;
				var addment = document.getElementsByClassName('chat_text').value;

				
		        function add() {
		        	  document.getElementsByClassName('chat_s')[0].innerHTML += '<div class="chat_id-1">' + document.getElementsByClassName('chat_text')[0].value + '</div>'
		        	  document.getElementsByClassName('chat_s').innerHTML += "<span class='message-time-id1'>"+document.getElementsByClassName('message-time-id1').value+"</span>"
		        	}
		        function add() {
		        	document.getElementsByClassName('chat_s')[0].innerHTML +=
		        	'<div class="id-1"> <div class="chat_id-1">'
		        	+ document.getElementsByClassName('chat_text')[0].value
		        	+'<div class="message-time-id1"> <div class="message-time-id1">'
		        	+ document.getElementsByClassName('message-time-id1').value
		        	+'</div>'
		        }
		      	//console.log(addment);
		        
		      	/*
		        $('.chat_submit').on("click", function(){
		        	$.ajax({
		                 url:"http://localhost:8080/sns-kitri/message/detail",
		                 type:"get",
		                 data:{"senderId" : myId, "receiverId" : reveiverId, "time" : time, "msg" : msg},
		                 dataType:"json",
		                 success:function(data){
								
		                			
		                		}
		             	}); 
		        });
		      	*/
		        
		        
				</script>
				
			<!-- 왼쪽 검색창 -->
				<section class="leftsearchbar">
					<h3>받는 사람</h3>
					<div class="discussion search">
						<div class="searchbar">
							<i class="fa fa-search" aria-hidden="true"></i> 
							<input type="text"placeholder="검색"></input>
						</div>
					</div>
				</section>       	
        </div>
	</body>
</html>