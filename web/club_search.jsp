<%@page import="java.net.URLEncoder"%>
<%@page import="exam.jdbc.ClubVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="exam.jdbc.JDBC_clubDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <style>
    body{
    margin:0;}
    #wrap{
width:90%;
margin:auto;
}

#toptop
{   width:75%;
    background-color:white;
    float:left;
    margin-left:12.5%;
    margin-right:12.5%;
    text-align:left;
    
}

#menu{width:12.5%;
    height:1200px;

    float:left;
}

#img{
width:25%;
height:250px;
background-color:yellow;
float:left;
margin:auto;
margin-right:15px;
}

#t1{ 
    width:50%;
    height:100%;    
    float:left;
    margin-left:0.3%;
}

#serch{
   width:25%;
   height:250px;
   float:left;
   margin-left:5%;
}


table.type09 {
   
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;

}
table.type09 thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 1px solid black;
    border-top: 3px solid #036;
    text-align:left;
 
}
table.type09 tbody th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
    
    
}
table.type09 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 0.5px solid black;
}

button{
  background:#114F7D;
  color:#fff;
  border:none;
  position:relative;
  height:30px;
  font-size:12px;
  padding:0 1em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color: black;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #114F7D;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}



 .fixbar {
    margin: auto;
    padding: 0px;
    list-style: none;
    position: fixed;
    width: 100%;
    text-align: left;
    background-color: #114f7d ;
  }
  .fixbar li {
     
    display: inline-block;
    
  }
  .fixbar li a {
    color:white;
    text-decoration: none;
    font-weight: bold;
    font-size: 20px;
    padding: 27px 40px;
    display: block;
  }

  ul li a:hover{
    text-decoration: underline;
    font-size: 140%;
    opacity: 1.0;
    /* color: black; */
  }

h2 {margin-left:100px;]}

</style>
</head>

<body>
<%request.setCharacterEncoding("UTF-8");
String club_gb_cd ="";	//클럽 구분(중앙,과)
String club_at_cd ="";	//클럽 속성(학술,운동)

if(request.getParameter("club_gb_cd") != null){
	club_gb_cd = request.getParameter("club_gb_cd");
}

if(request.getParameter("club_at_cd") != null){
	club_at_cd = request.getParameter("club_at_cd");
}
%>

<jsp:useBean id="dao" class="exam.jdbc.JDBC_clubDAO" />


<ul class="fixbar">
    <img src="img/logo.png" align="left" />
    <li><a href="#"></a></li>
    
    <li><a href="main.html">메인 페이지</a></li>
    <li><a href="유형.html">동아리 조회</a></li>
    <li><a href="무형.html">게시판</a></li>
    <li><a href="생활.html">D</a></li>
    <li><a href="feedback.html">E</a></li>
  </ul>
  <br><br>
  <br><br>

  <br><br>
<div id="toptop">

<h2>동아리소개

<form method="get" action="club_search.jsp">
	<select name="club_gb_cd" onchange="this.form.submit();">
		<option value="">전체</option>
		<option value="001001" <%if(club_gb_cd.equals("001001")) out.println("selected");%>>중앙 동아리</option>
		<option value="001002" <%if(club_gb_cd.equals("001002")) out.println("selected");%>>과 동아리</option>
	</select>

	<button name="club_at_cd" onclick="this.form.submit()" value="">전체</button>
	<button name="club_at_cd" onclick="this.form.submit()" value="002001">학술</button>
	<button name="club_at_cd" onclick="this.form.submit()" value="002002">운동</button>
	<button name="club_at_cd" onclick="this.form.submit()" value="002003">봉사</button>
	<button name="club_at_cd" onclick="this.form.submit()" value="002004">문화</button>
	<button name="club_at_cd" onclick="this.form.submit()" value="002005">종교</button>
	<button name="club_at_cd" onclick="this.form.submit()" value="002006">기타</button>
</form>
</h2>

</div>
<div id="wrap">

<div id="menu">
</div>

<%
ArrayList<ClubVO> gb_list = dao.getClublist(club_gb_cd,club_at_cd);

for(ClubVO vo : gb_list){
%>

<div id="img">
<img src="img/b1.jpg" width=100%; height=100%;>
</div>
<div id="t1">
    <table class="type09">
    <thead>
    <tr>
        <th scope="col" colspan="4"><%=vo.getClub_nm() %></th>
        
    </tr>
    </thead>
    <tbody>
    <tr>
        <th scope="row">회원수</th>
        <td><%=vo.getCnt() %>명</td>
         <th scope="row">결성년도</th>
        <td><%=vo.getOpen_dt().substring(0,4) %>년</td>
    </tr>
   <tr>
        <th scope="row">회장</th>
        <td>이지훈</td>
         <th scope="row">지도교수</th>
        <td>이성룡 교수님</td>
    </tr>
    <tr>
        <th scope="row">설립목적</th>
        <td colspan="3"><%=vo.getClub_aim() %></td>
        
    </tr>
    
        <tr>
        <th scope="row">주요활동</th>
        <td colspan="3"><%=vo.getClub_active() %></td>
        
    </tr>
    
    </tbody>
</table>

<br><br>
<br><br>

</div>

<%} %>

</div>

</body>
</html>