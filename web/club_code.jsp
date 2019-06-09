<%@page import="sun.security.krb5.internal.PAEncTSEnc"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="exam.jdbc.ClubVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="exam.jdbc.JDBC_clubDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"
   import="java.sql.DriverManager,
                   java.sql.Connection,
                   java.sql.Statement,
                   java.sql.ResultSet,
                   java.sql.SQLException"%>

<%@ page import="bbs.Bbs"%>

<%@ page import="bbs.BbsDAO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

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

#poster {
   width: 100%;
   height: 950px;
   
   float: left;
}

#board {
   width: 50%;
   height: 950px;
   background-color:red;
   float: left;
}

#fullstack {
   width: 100%;
   height: 100px;
   background-color: white;
   float: left;
}

#club_image {
   width: 100%;
   height: 900px;
   /* background-color: green; */
   border: 1px solid;
   z-index: 9999;
}

#board_image {
   width: 100%;
   height: 930px;
   /* background-color: lightblue; */
   border-radius: 10px;
}

#club_image_into {
   width: 90%;
   height: 800px;
   background-color: blue;
   margin: auto;
}

#selectform{
   width:100%;
   /* background-color:red; */
   margin-left:23%;
   margin-bottom:1%;
}
</style>
</head>
<body>
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
         if (username == null) {
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
      String name = request.getParameter("hello");
      String imgName="";
      String imgNext="";
      
      %>
   </ul>

   <%--  <%
String name = request.getParameter("hello");
 System.out.println("1");
 System.out.println(name);
 System.out.println("2");
%>  --%>






   <div id="poster">
      <div id="fullstack"></div>
      
      <div id="selectform">
         동아리 사진보기 <select id="avc" name="fruit" style="width: 50%; height:30px;"
            onchange="changeFunc();"><br>
            <option disabled hidden >동아리를 선택하세요</option>  

            <%
                           response.setContentType("text/html;charset=utf-8;");
                           request.setCharacterEncoding("utf-8"); //charset, Encoding 설정
                           Class.forName("com.mysql.jdbc.Driver"); // load the drive
                           String DB_URL = "jdbc:mysql://localhost/mydb";
                           // 주의 : test by changing mydb to name that you make
                           String DB_USER = "root";
                           String DB_PASSWORD = "2865";
                           Connection conn = null;
                           Statement stmt = null;
                           ResultSet rs = null;
                           
                           String club_name[] = new String[100];
                           String club_img[] = new String[100];
                           String club_next[] = new String[100];
                           int i=0;
                           
                           try {
                              conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                              stmt = conn.createStatement();

                              String Query = "SELECT CLUB_NM,INTRO_FILE_NM from club;";
                              
                              rs = stmt.executeQuery(Query);
                              
                               while(rs.next()) {
                                  club_name[i]= rs.getString(1);
                                  club_img[i]=rs.getString(2);
                                  i++;
                              } 
                              

                              rs.close(); // ResultSet exit
                              stmt.close(); // Statement exit
                              conn.close(); // Connection exit 
                              
                           } catch (Exception e) {
                              out.println("<script>alert('전화번호 오류');</script>");
                           }
                           
                           //System.out.println(club_img);
                           
                           for(int j=0; j<club_name.length; j++){
                              if(club_name[j]!=(null)){
                                 if(!name.equals(club_name[j])){
                                 %>
                              
            <option value=<%=club_name[j]%>>
               <%=club_name[j]%>
            </option>
            <%}else{%>
            <option id="aa" value=<%=name%>>
               <%=club_name[j]%>
            </option>
            <%
                              imgName=club_img[j];
                     System.out.println(imgName);
                       imgNext=club_img[j+1];
                       System.out.println(imgNext);
                                 }
                              }
                           }
                           for(int v =0; v<club_next.length;v++){
                              //System.out.println(club_next[v]);
                           }
                     %>
         </select>
</div>
 

         <script>
         
                         var val = document.getElementById("aa").value;
                         var sel = document.getElementById("avc");
                         var opts = sel.options;
                         for(var opt, j = 0; opt = opts[j]; j++) {
                             if(opt.value == val) {
                                 sel.selectedIndex = j;
                                 break;
                             }
                         }
               </script>

         
            <img id="imgimg" src=<%=imgName%> alt="동아리 포스터 이미지" width=49%; height=80%; style="border:1px solid;">
            <img id="imgimg2" src=<%=imgNext%> onerror="this.src='last.png'" width=50%; height=80%; style="border:1px solid;">
         

         <script>
   function changeFunc() {
    var selectBox = document.getElementById("avc");
    var selectedValue = selectBox.options[selectBox.selectedIndex].value;
    var selectImg="";
    
    
    var tmpArr = new Array();

    <%for(int z=0; z<10; z++){%>
    tmpArr[<%=z%>]='<%=club_name[z]%>';
    <%}%>
    
    <%for(int n=0; n<10; n++){%>
       if(tmpArr[<%=n%>]==selectedValue)
          selectImg='<%=club_img[n]%>';
          
    <%}%>
    
    
    <%for(int x=0; x<10; x++){%>
   if(tmpArr[<%=x%>]==selectedValue)
      selectImg2='<%=club_img[x+1]%>';
      
<%}%>
    
    
    
    var image = document.getElementById('imgimg');
    image.src = selectImg;
    
    
    
    var image2 = document.getElementById('imgimg2');
    image2.src = selectImg2;
    
    
   
    if(selectImg2==null){
       alert("안대");
    }

   }
  </script>
      </div>

   </div>


</body>
</html>