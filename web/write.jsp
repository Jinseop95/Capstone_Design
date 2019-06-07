<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 뷰포트 -->

<meta name="viewport" content="width=device-width" initial-scale="1">

<!-- 스타일시트 참조  -->

<link rel="stylesheet" href="css/bootstrap.css">

<title>jsp 게시판 웹사이트</title>
<style>
.fixbar {
   margin: auto;
   padding: 0px;
   list-style: none;
   position: fixed;
   width: 100%;
   text-align: left;
   background-color: #114f7d;
   z-index: 9999;
}

.fixbar li {
   display: inline-block;
}

.fixbar li a {
   color: white;
   text-decoration: none;
   font-weight: bold;
   font-size: 20px;
   padding: 27px 40px;
   display: block;
}

.fixbar .login {
   position: absolute;
   height: 100%;
   top: 50%;
   right: 10%;
   z-index: 9999;
   border-radius: 10px;
   float: left;
   text-align: center;
   font-size: 15px;
   color: white;;
}

.fixbar .login a {
   color: white;
   opacity: 1.0;
   /* text-decoration: non: ;e; */
   font-weight: bold;
   font-size: 15px;
}

ul li a:hover {
   font-size: 140%;
   opacity: 1.0;
   /* color: black; */
}

table.type03 {
   border-collapse: collapse;
   text-align: left;
   line-height: 1.5;
   border-top: 1px solid #ccc;
   border-left: 5px solid #369;
   margin: 5% 20%;
}

table.type03 td {
   padding: 3px;
   vertical-align: top;
   border-right: 1px solid #ccc;
   border-bottom: 1px solid #ccc;
}

.buttom {
   position: absolute;
   width: 20%;
   top: 90%;
   right: 5%;
   text-align: left;
   margin-right:13%;
   
}

.button {
   width: 80px;
   background-color: #046BB9;
   border: none;
   color: #fff;
   padding: 5px 0;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 15px;
   border-radius: 10px;
   cursor: pointer;
   
}

.button2 {
   width: 80px;
   background-color: #046BB9;
   border: none;
   color: #fff;
   padding: 5px 0;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 12px;
   border-radius: 5px;
   cursor: pointer;
}
h2{margin-left:20%;}
#wrap{
   width:80%;
}

</style>

<script type="text/javascript">
    
        var openWin;
    
        function openChild()
        {
            // window.name = "부모창 이름"; 
            window.name = "parentForm";
            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
            openWin = window.open("club_form.jsp",
                    "childForm", "width=450, height=350, resizable=yes,top=300,left=500, scrollbars = no");    
        }
        
        
   </script>

</head>

<body>
<%request.setCharacterEncoding("UTF-8");%>

   <%

      //로긴한사람이라면    userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값

      String username = null;

      if (session.getAttribute("username") != null) {

         username = (String) session.getAttribute("username");

      }

   %>

   <ul class="fixbar">
      <img src="img/logo.png" align="left" />
      <li><a href="#"></a></li>
      <li><a href="main.jsp">메인 페이지</a></li>
      <li><a href="club_search.jsp">동아리 조회</a></li>
      <li><a href="무형.html">게시판</a></li>
      <li><a href="생활.html">D</a></li>
      <li><a href="feedback.html">E</a></li>
      <%
   if(username==null){   
   %>
      <div class="login">
         <form method="post" action="LoginAction.jsp">
            <input type="text" name="username"
               style="width: 130px; height: 30px;" onfocus="this.select()">
            <input type="passWord" name="password"
               style="width: 130px; height: 30px;" onfocus="this.select()">
            <input type="submit" value="로그인 "> <a href='#'
               onclick='javascript:window.open("signUp.jsp","name99", "width=720px,height=720px");'>회원가입</a>
         </form>
      </div>
      <%
   } else{
   %>
      <div class="login">
         <%
               out.print((String)session.getAttribute("username")+" 님 어서오세요.");
            %>
         <a href='logoutAction.jsp'>로그아웃</a> <a href='myInfo.jsp'>| 나의 정보</a>
         </li>
         </form>
      </div>
      <%
   
   }%>


   </ul>





   <div class="container">

      <div class="row">

         <form name="board_form" method="post" action="writeAction.jsp"style="margin-top: 10%;">
            <h2>글 쓰기</h2>
            <table class="type03" width="800px;" height="80px;">
            
               <tr>
                  <td>분류/제목</td>
                  <td class="td_2"><select name="board_cd">
                        <option>안녕</option>
                        <option>Free</option>
                        <option>Plan</option>
                        <option>Question</option>
                        
                  </select> <input type="text" name="TITLE" size="70"></td>
               </tr>

               <!-- <tr>
                  <td>동아리명</td>
                  <td class="td_2"><input type="text" name="BOARD_NO"
                     id="title" size="20"> <input class="button2"
                     type="button" value="동아리검색" onclick="openChild()"></td>
               </tr>
               <tr>
                  <td>파일 업로드</td>
                  <td class="td_2"><input type="file"></td>
                  
         <td class="td_2">
            
            <input type="text" id="fileName" class="file_input_textbox" readonly="readonly">
            <div class="file_input_div"> 
            <input type="button" value="Search Files" class="file_input_button"/>
            <input type="file" class="file_input_hidden" onchange="javascript:
               document.getElementById('fileName').value=this.value"/>
            </div>
         </td>
        
               </tr> -->
               
               <tr>
                  <td>내용</td>
                  <td class="td_2"><textarea name="CONTENTS" id="bbsTitle"
                        rows="22" style="width: 645px;"></textarea> <script
                        type="text/javascript">
                var oEditors = [];
                nhn.husky.EZCreator.createInIFrame({
                 oAppRef: oEditors,
                 elPlaceHolder: "content", //textarea에서 지정한 id와 일치해야 합니다.
                 sSkinURI: "${contextPath}smarteditor2/demo/SmartEditor2Skin.html",
                fCreator: "createSEditor2"
               });
            </script></td>
               </tr>
            </table>
             <div class="buttom">
   <input class="button" type ="submit" name="작성" value="작성">
   <input class="button" type ="reset" name="취소" value="취소" onclick="location.href='bbs.jsp'">
   </div> 
         </form>

      </div>

   </div>









   <!-- 애니매이션 담당 JQUERY -->

   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

   <!-- 부트스트랩 JS  -->

   <script src="js/bootstrap.js"></script>



</body>

</html>


