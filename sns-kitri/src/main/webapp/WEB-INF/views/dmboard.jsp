<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<style>
body {
  padding: 5%;
  background-color: #F5F5F5;
}
.container {
  padding:0;
  background-color: #FFF; 
  box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
  height: 700px;
}
/* === CONVERSATIONS === */
.discussions {
  width: 35%;
  height: 700px;
  box-shadow: 0px 8px 10px rgba(0,0,0,0.20);
  overflow: hidden;
  background-color: #87a3ec;
  display: inline-block;
}
.discussions .discussion {
  width: 100%;
  height: 90px;
  background-color: #FAFAFA;
  border-bottom: solid 1px #E0E0E0;
  display:flex;
  align-items: center;
  cursor: pointer;
}
.discussions .search {
  display:flex;
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
    margin-left:20px;
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
  width:50%;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
.discussions .discussion .name {
  margin: 0 0 0 20px;
  font-family:'Montserrat', sans-serif;
  font-size: 11pt;
  color:#515151;
}
.discussions .discussion .message {
  margin: 6px 0 0 20px;
  font-family:'Montserrat', sans-serif;
  font-size: 9pt;
  color:#515151;
}
.timer {
  margin-left: 15%;
  font-family:'Open Sans', sans-serif;
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
  box-shadow: 0px 3px 2px rgba(0,0,0,0.100);
  display:flex;
  align-items: center;
}
.text-only {
  margin-left: 45px;
}
.time {
  font-size: 10px;
  color:lightgrey;
  margin-bottom:10px;
  margin-left: 85px;
}
.response-time {
  float: right;
  margin-right: 40px !important;
}
.response {
  float: right;
  margin-right: 0px !important;
  margin-left:auto; /* flexbox alignment rule */
}
.response .text {
  background-color: #e3effd !important;
}
.footer-chat {
  width: calc(65% - 66px);
  height: 80px;
  display:flex;
  align-items: center;
  position:absolute;
  bottom: 0;
  background-color: transparent;
  border-top: 2px solid #EEE;
  
}
.write-message {
  border:none !important;
  width:60%;
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
  margin-left:5px;
}
.footer-chat input *:-ms-input-placeholder {
  color: #C0C0C0;
  font-size: 13pt;
}
.clickable {
  cursor: pointer;
}
.discussion search{
   text-align: left;
}
.icon-back{
   color: black;
   font-size: 25pt;
   left: 40pt;
   padding: 10px;
}
.my-id{
   color: black;
   font-size: 13pt;
   padding: 10px;
}
.icon-message{
   font-size: 22pt;
   left: 230pt;
   padding: 10px;
}
.left-discussion{
   width: 63%;
   margin-left: 5px;
    height: 700px;
    box-shadow: 0px 8px 10px rgb(0 0 0 / 20%);
    overflow: hidden;
    display: inline-block
}
.left-text{
   text-align: center;
   height: 50%;
   margin-top: 10%;
}
.message-icon{
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
</style>

<script>

</script>



<body>
   <div class="container">
      <div class="row">
         <section class="discussions">
            <div class="discussion search">
               <a class="icon-back" href="#">❮</a>
               <a class="my-id">${id1}</a>
               <a class="icon-message" href="#">💬</a>
            </div>
            <!-- <div class="discussion message-active"> -->
            <div id="discussion" class="discussion">
               <div class="photo"
                  style="background-image: url(https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80);">
               </div>
               <div class="desc-contact">
                  <p class="name">Megan Leib</p>
                  <p class="message">9 pm at the bar if possible 😳</p>
               </div>
               <div class="timer"></div>
            </div>

            <div id="discussion" class="discussion">
               <c:forEach items="${dmList}" var="dmvo">
                  <div class="photo"><img alt="프로필" src="${dmvo.img}"></div>
                  <div class="desc-contact">
                     <p class="name">${dmvo.sender}</p>
                     <p class="message">${dmvo.lastmsg}</p>
                  </div>
                  <p class="timer">${dmvo.day}</p>
               </c:forEach>
            </div>
         </section>
         
         <section class="left-discussion">
            <div class="left-text">
               <div class="message-icon">✉</div>
               <h2>내 메시지</h2>
               <h3>친구나 그룹에 비공개 메시지를 보내세요.</h3>
               <a href="#" class="button">메세지 보내기</a>
            </div>
         </section>
      </div>
   </div>
</body>
</html>