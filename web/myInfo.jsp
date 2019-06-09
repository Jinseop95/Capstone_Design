<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "clubMember.clubMemberDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "java.util.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
html, body {
   width: 100%;
   height: 100%;
}

.fixbar {
   margin: auto;
   padding: 0px;
   list-style: none;
   position: fixed;
   width: 100%;
   text-align: left;
   background-color: #114f7d;
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
   color: white;
}

.fixbar .login a {
   color: white;
   opacity: 1.0;
   /* text-decoration: non: ;e; */
   font-weight: bold;
   font-size: 15px;
}

table.type03 {
   border-collapse: collapse;
   text-align: center;
   line-height: 1.5;
   border-top: 1px solid #ccc;
   border-left: 20px solid #369;
   margin: auto;
   text-align: center;
   width: 100%;
   font-size: 30px;
}

table.type03 th {
   padding: 3px;
   font-weight: bold;
   vertical-align: top;
   color: #153d73;
   border-right: 1px solid #ccc;
   border-bottom: 1px solid #ccc;
}

table.type03 td {
   padding: 3px;
   vertical-align: top;
   border-right: 1px solid #ccc;
   border-bottom: 1px solid #ccc;
}

table.type04 {
   border-collapse: collapse;
   text-align: center;
   line-height: 1.5;
   border-left: 1px solid #ccc;
   border-top: 20px solid #369;
   margin: auto;
   text-align: center;
   width: 100%;
   font-size: 25px;
}

table.type04 th {
   padding: 3px;
   font-weight: bold;
   vertical-align: top;
   color: #153d73;
   border-right: 1px solid #ccc;
   border-bottom: 1px solid #ccc;
}

table.type04 td {
   padding: 3px;
   vertical-align: top;
   border-right: 1px solid #ccc;
   border-bottom: 1px solid #ccc;
}

#left_side {
   float: left;
   margin: 5px;
   margin-left: 3%;
   padding: 10px;
   min-height: 60%;
   width: 18.5%;
}

.mainLeft {
   border: 1px solid #ccc;
   float: left;
   margin-left: 3%;
   padding: 10px;
   min-height: 75%;
   width: 31%;
   overflow: auto;
}

.mainRight {
   border: 1px solid #ccc;
   float: left;
   margin-left: 3%;
   padding: 10px;
   min-height: 75%;
   width: 31%;
   overflow: auto;
}

table.type099 {
   border-collapse: collapse;
   text-align: center;
   line-height: 1.5;
   border-top: 1px solid #ccc;
   border-left: 20px solid #369;
   margin: auto;
   text-align: center;
   width: 100%;
   font-size: 30px;
}

table.type099 th {
   padding: 10px;
   font-weight: bold;
   vertical-align: top;
   color: #153d73;
   border-right: 1px solid #ccc;
   border-bottom: 1px solid #ccc;
}

table.type099 td {
   padding: 0px;
   vertical-align: top;
   border-right: 1px solid #ccc;
   border-bottom: 1px solid #ccc;
}


</style>
</head>
<body>
   <%
      String username = null;
      if (session.getAttribute("username") != null) {
         username = (String) session.getAttribute("username");
      }
      clubMemberDAO clubMember = new clubMemberDAO();
   %>

   <ul class="fixbar">
      <img src="img/logo.png" align="left" />
      <li><a href="#"></a></li>
      <li><a href="main.jsp">메인 페이지</a></li>
      <li><a href="유형.html">동아리 조회</a></li>
      <li><a href="무형.html">게시판</a></li>
      <li><a href="생활.html">D</a></li>
      <li><a href="feedback.html">E</a></li>
      <%
         if (username == null) {
      %>
      <div class="login">
         <form method="post" action="LoginAction.jsp">
            <input type="text" name="username"
               style="width: 130px; height: 30px;"> <input type="passWord"
               name="password" style="width: 130px; height: 30px;"> <input
               type="submit" value="로그인 "> <a href='#'
               onclick='javascript:window.open("signUp.jsp","name99", "width=720px,height=720px");'>회원가입</a>
         </form>
      </div>
      <%
         } else {
      %>
      <div class="login">
         <%
            out.print((String) session.getAttribute("username") + " 님 어서오세요.");
         %>
         <a href='logoutAction.jsp'>로그아웃</a> <a href='myInfo.jsp'>| 나의 정보</a>
         </li>
         </form>
      </div>
      <%
         }
      %>
   </ul>
   <br>
   <br>
   <br>
   <br>

   <br>
   <br>
   <div id="left_side">
      <table class="type03">
         <tr>
            <td>마이페이지</td>
         </tr>
         <tr>
            <td>회원정보</td>
         </tr>
      </table>
      <div style="margin-top:30%;">
         <table class="type03" style="font-size:16px;">
         <%
            String viewList[] = clubMember.ViewNews(username);
            
            if(viewList!=null){
            for(int i=0; i<viewList.length; i++){%>
               <tr>
                  <td><h5 style="opacity: 0.6;"><%=viewList[i]%></h5></td>
               </tr>
               <%
            }
            }%> 
         </table>
      </div>
      
   </div>

   <div class="mainLeft">
      <table class="type04">
         <tr>
            <td style="font-size: 30px;">가입 동아리</td>
         </tr>
         <%
                  List<String> join = clubMember.get_MyApplyList(username,1);
                  if (join!=null){
                   for (int i = 0; i < join.size(); i++){ %>
                        <tr>
                        <form method="post" action="applyDeleteAction.jsp" onSubmit="return confirm('탈퇴 신청을 하시겠습니까?');">
                          <td>
                          <input type="text" name="clubNM" value=<%=join.get(i)%>>
                           <input type="submit" value="탈퇴 신청">
                           
                        </form> 
                       <%--  <form method="post" action="applyModAction.jsp">
                          <input type="text" name="clubNM2" value=<%=join.get(i)%> style="display:none;">
                          <input type="submit" value="제출 정보 수정하기.">
                        </form> --%>
                        </td>
                        </tr>
               <%}
                  }
         %>

      </table>
   </div>

   <div class="mainRight">
      <table class="type04">
         <tr>
            <td style="font-size: 30px;">가입 신청 중 동아리</td>
         </tr>
         <%
               join = clubMember.get_MyApplyList(username,0);
               if (join!=null){
                   for (int i = 0; i < join.size(); i++){ %>
                        <tr>
                        <td>
                        <form method="post" action="applyDeleteAction.jsp" onSubmit="return confirm('가입 신청을 취소하시겠습니까?');">
                            <input type="text" name="clubNM" value=<%=join.get(i)%>> 동아리에 가입승인중 입니다.
                           <input type="submit" value="가입 신청 취소">
                        </form>
                        
                        <form method="post" action="applyMod.jsp" target="w" onsubmit="return postPopUp();">
                          <input type="text" name="clubNM2" value=<%=join.get(i)%> style="display:none;">
                          <input type="submit"  value="제출 정보 수정하기.">
                        </form>   
                        
                        <script>
                        function postPopUp(){
                              window.open('', 'w','width=900,height=650,location=no,status=no');
                              return true;
                        }
                     </script>   
                                             
                         </td>   
                      </tr>
               <%}
               }
               %>
      </table>
   </div>


</body>
</html>