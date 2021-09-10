<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
   width: 64%;
    height: 700px;
    box-shadow: 0px 8px 10px rgb(0 0 0 / 20%);
    overflow: hidden;
    background-color: #87a3ec;
    display: inline-block
}


</style>

<script>
	
</script>
<body>
   <div class="container">
      <div class="row">
         <section class="discussions">
            <div class="discussion search">
               <span class="icon-back">❮</span>
               <span class="my-id">_____Myid</span>
               <span class="icon-message">💬</span>
            </div>
            <!-- <div class="discussion message-active"> -->
            <div class="discussion">
               <div class="photo"
                  style="background-image: url(https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80);">
               </div>
               <div class="desc-contact">
                  <p class="name">Megan Leib</p>
                  <p class="message">9 pm at the bar if possible 😳</p>
               </div>
               <!--  <div class="timer"></div>  -->
            </div>

            <div class="discussion">
               <div class="photo"
                  style="background-image: url(http://e0.365dm.com/16/08/16-9/20/theirry-henry-sky-sports-pundit_3766131.jpg?20161212144602);">
               </div>
               <div class="desc-contact">
                  <p class="name">Dave Corlew</p>
                  <p class="message">Let's meet for a coffee or something today
                     ?</p>
               </div>
               <!-- <div class="timer"></div> -->
            </div>

            <div class="discussion">
               <div class="photo"
                  style="background-image: url(https://images.unsplash.com/photo-1497551060073-4c5ab6435f12?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=667&q=80);">
               </div>
               <div class="desc-contact">
                  <p class="name">Jerome Seiber</p>
                  <p class="message">I've sent you the annual report</p>
               </div>
            </div>

            <div class="discussion">
               <div class="photo"
                  style="background-image: url(http://thomasdaubenton.xyz/portfolio/images/photo.jpg);">
               </div>
               <div class="desc-contact">
                  <p class="name">Thomas Dbtn</p>
                  <p class="message">See you tomorrow ! 🙂</p>
               </div>
            </div>

            <div class="discussion">
               <div class="photo"
                  style="background-image: url(https://images.unsplash.com/photo-1553514029-1318c9127859?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80);">
               </div>
               <div class="desc-contact">
                  <p class="name">Elsie Amador</p>
                  <p class="message">What the f**k is going on ?</p>
               </div>
            </div>

            <div class="discussion">
               <div class="photo"
                  style="background-image: url(https://images.unsplash.com/photo-1541747157478-3222166cf342?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=967&q=80);">
               </div>
               <div class="desc-contact">
                  <p class="name">Billy Southard</p>
                  <p class="message">Ahahah 😂</p>
               </div>
            </div>

            <div class="discussion">
               <div class="photo"
                  style="background-image: url(https://images.unsplash.com/photo-1435348773030-a1d74f568bc2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1050&q=80);">
               </div>
               <div class="desc-contact">
                  <p class="name">Paul Walker</p>
                  <p class="message">You can't see me</p>
               </div>
            </div>
         </section>
         
         <section class="left-discussion">
            <div>
            
            </div>
            <div>
            
            </div>
         </section>
      </div>
   </div>
</body>

</html>