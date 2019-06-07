
    <%@page import="sun.security.krb5.internal.PAEncTSEnc"%>
<%@page import="java.net.URLEncoder"%>
<%-- <%@page import="exam.jdbc.ClubVO"%> --%>
<%@page import="java.util.ArrayList"%>
<%-- <%@page import="exam.jdbc.JDBC_clubDAO"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"
   import="java.sql.DriverManager,
                   java.sql.Connection,
                   java.sql.Statement,
                   java.sql.ResultSet,
                   java.sql.SQLException,
                   java.util.ArrayList,
                java.util.List"%>
                   
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>한림대학교 음식점조회</title>
    <style>
    #gogo{
    width:150px;
    hieght:300px;
    text-align:center;}
    
    #gogo:hover{background-color:red;}
    #wrap{
    width:70%;
    margin:auto;}
    
#wrap2{
    width:70%;
    margin:auto;}
    
    
    a, a:hover {
   color: #000000;
   text-decoration: none;
}

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
   
a:hover{
   font-size:20px;
   text-decoration: underline;
}
    </style>
     
    
</head>
<body>

<%
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
      %>
   </ul>
<br><br><br><br><br><br>
<div id="wrap">
<div id="map" style="width:100%;height:350px;"></div>
</div>
<br>


</body>
<div id="wrap2">
<div class="container">

      <div class="row">

         <table class="table table-striped"
            style="text-align: center; border: 1px solid #dddddd">

            <thead>

               <tr>

                  <th style="background-color: #eeeeee; text-align: center; width:350px;">음식점</th>

                  <th style="background-color: #eeeeee; text-align: center; width:900px;">주소</th>
                  
                  <th style="background-color: #eeeeee; text-align: center; width:300px;">연락처</th>
                  
                  <!-- <th style="background-color: #eeeeee; text-align: center;">평점</th> -->

                  

               </tr>

            </thead>


            <tbody>


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
                           
                           
                           List<String> club_name = new ArrayList<String>();
                           List<String> club_x = new ArrayList<String>();
                           List<String> club_y = new ArrayList<String>();
                           List<String> club_phone = new ArrayList<String>();
                           List<String> club_address = new ArrayList<String>();
                           List<String> club_post = new ArrayList<String>();
                           List<String> club_internet = new ArrayList<String>();
                           
                          
                           int i=0;
                           
                           try {
                              conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                              stmt = conn.createStatement();

                              String Query = "select rest_nm,latitute,longitude,rest_phone_no,address,post,input_id from restaurant;";
                              
                              rs = stmt.executeQuery(Query);
                              
                               while(rs.next()) {
                                  club_name.add(rs.getString(1));
                                  club_x.add(rs.getString(2));
                                  club_y.add(rs.getString(3));
                                  club_phone.add(rs.getString(4));
                                  club_address.add(rs.getString(5));
                                  club_post.add(rs.getString(6));
                                  club_internet.add(rs.getString(7));
                                  i++;
                              } 
                              

                              rs.close(); // ResultSet exit
                              stmt.close(); // Statement exit
                              conn.close(); // Connection exit 
                              
                           } catch (Exception e) {
                              out.println("<script>alert('전화번호 오류');</script>");
                           }%>
                           
                           
                           <tr>
                           <% for(int k=0;k<club_name.size(); k++){%>
                                 <td style="border:1px solid #dddddd;"><a href=<%=club_internet.get(k)%> target=_blank><%=club_name.get(k)%></a></td>
                                 <td style="border:1px solid #dddddd;"><%=club_address.get(k)%></td>
                                 <td style="border:1px solid #dddddd;"><%=club_phone.get(k)%></td>
                                 <%-- <td  style="border:1px solid #dddddd;"><%=club_post[k]%></td> --%>
                           </tr>   
                           <%}%>
                           
</div>                           
                           

<script>
var tmpArr = new Array();

<%for(int q=0;q<club_name.size();q++){%>
tmpArr[<%=q%>]='<%=club_name.get(q)%>';
<%}%>

var tmpArr2 = new Array();

<%for(int w=0;w<club_x.size();w++){%>
tmpArr2[<%=w%>]='<%=club_x.get(w)%>';
<%}%>

var tmpArr3 = new Array();

<%for(int e=0;e<club_y.size();e++){%>
tmpArr3[<%=e%>]='<%=club_y.get(e)%>';
<%}%>




</script>

                          



<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8341261c4a8673a524c441e2ea3f9b04"></script>
<script>
 var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new daum.maps.LatLng(37.886297, 127.738137), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
<%--  var positions = [
    {
        content: '<div><%=club_name[1]%></div>', latlng: new daum.maps.LatLng(<%=club_x[1]%>, <%=club_y[1]%>)
    },
    {
       content: '<div><%=club_name[2]%></div>', latlng: new daum.maps.LatLng(<%=club_x[2]%>, <%=club_y[2]%>)
    }
];  --%>




 var tmpArr4 = new Array();

 <%for(int r=0;r<club_internet.size();r++){%>
 tmpArr4[<%=r%>]='<%=club_internet.get(r)%>';
 <%}%>

 var ad;
 var hi;
 hi=tmpArr4[0];
 //alert(hi);
 for (var i in tmpArr4) {
    // 마커를 생성합니다
   
    var marker = new daum.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: new daum.maps.LatLng(tmpArr2[i], tmpArr3[i]), // 마커의 위치
        
    });

    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new daum.maps.InfoWindow({
        content: '<div id=gogo>'+tmpArr[i]+'</div>' // 인포윈도우에 표시할 내용
    });

    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
    daum.maps.event.addListener(marker, 'click', function(mouseEvent) {        
       /* window.open(tmpArr4[0]); */
       /* alert(ad); */
       /* window.open('http://localhost/list?log= ? % d = '); */
       //alert(infowindow.content);
       window.open('https://map.kakao.com/');
       
    });
 }

// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}   
</script>
<!-- <a href='http://naver.me/FNEqFeYs' width='800px' height='1500px' frameborder='0' scrolling='auto'>음식점 평가하러가기 </a> -->


</html>