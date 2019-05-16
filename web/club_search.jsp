<%@page import="sun.security.krb5.internal.PAEncTSEnc"%>
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
	width: 100%;
}
#wrapper{
	width: 100%;
	min-height: 300px;
	margin: 0 auto;
}
#left_side, #right_side, #contents{
	margin: 5px;
   	padding: 10px;
}

#left_side, #contents, #right_side {
	float: left;
	min-height: 300px;
}

#left_side {
        background-color: goldenrod;
        width: 12%;
    }
    
#contents {  
    width: 70%;
    
}
#right_side {
    background-color: goldenrod;
    width: 12%;
}

#footer {
        height: 70px;
        background-color: blue;
        position: relatiev;
        clear: both;
    }
    
#page_out {
	clear:both;
	width: 100%;
	text-align: center;
}
#page_in {
	display: inline-block;
}

    
.title{
font-size: x-large;
margin-right:50px;
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
    height:300px;    
    float:left;
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

ul {
list-style:none;
}

ul li{
display:inline;
}




</style>
</head>

<body>
<%request.setCharacterEncoding("UTF-8");
String club_gb_cd ="";	//클럽 구분(중앙,과)
String club_at_cd ="";	//클럽 속성(학술,운동)
int pageNumber = 1; //현재 페이지 번호

if(request.getParameter("club_gb_cd") != null){
	club_gb_cd = request.getParameter("club_gb_cd");
}

if(request.getParameter("club_at_cd") != null){
	club_at_cd = request.getParameter("club_at_cd");
}

if(request.getParameter("pageNumber") != null){
	try{
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));

	}catch(Exception e){
		System.out.println("검색 페이지 번호 오류");
	}
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



<div id="wrapper">
	<div id="left_side"></div>
	<div id="contents">
		<form method="get" action="club_search.jsp">
			
			<ul class="club_list">
			<li class="title">동아리소개</li>
			<li>
			<select name="club_gb_cd" onchange="this.form.submit();">
				<option value="">전체</option>
				<option value="001001" <%if(club_gb_cd.equals("001001")) out.println("selected");%>>중앙 동아리</option>
				<option value="001002" <%if(club_gb_cd.equals("001002")) out.println("selected");%>>과 동아리</option>
			</select>
			</li>
			<li><button name="club_at_cd" onclick="this.form.submit()" value="">전체</button></li>
			<li><button name="club_at_cd" onclick="this.form.submit()" value="002001">학술</button></li>
			<li><button name="club_at_cd" onclick="this.form.submit()" value="002002">운동</button></li>
			<li><button name="club_at_cd" onclick="this.form.submit()" value="002003">봉사</button></li>
			<li><button name="club_at_cd" onclick="this.form.submit()" value="002004">문화</button></li>
			<li><button name="club_at_cd" onclick="this.form.submit()" value="002005">종교</button></li>
			<li><button name="club_at_cd" onclick="this.form.submit()" value="002006">기타</button></li>
			</ul>
		</form>
	
<%
ArrayList<ClubVO> gb_list = dao.getClublist(club_gb_cd,club_at_cd,pageNumber);
int totalcount=0;
try{
	 totalcount = gb_list.get(0).getRow_count();
}catch(Exception e){

}
	if(totalcount == 0) {%>
		<h3>검색 결과가 없습니다.</h3>
	 <%} else { %>
		<h3>검색 결과는 <%=totalcount %>개 입니다.</h3>
	<%} %>
	<div id="zxcv">
<% 
for(ClubVO vo : gb_list){

%>
	
	<div id="img"><img src="img/b1.jpg" width=100%; height=100%;></div>
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
	</div>

<%} %>
</div>
<div id="page_out">
	<div id="page_in">

<%

int countList =4;		
int countPage = 2;	
int totalPage = totalcount /countList;

if(totalcount > countList * totalPage){
	totalPage++;
}
//현재 페이지가 총 페이지 번호보다 클 경우 
if (totalPage < pageNumber){	
	pageNumber = totalPage;
}

int startPage = ((pageNumber-1)/countPage)*countPage+1;	//페이지 번호  시작
int endPage = startPage + countPage -1;	//페이지 번호 끝

if (endPage > totalPage) {
    endPage = totalPage;
}


if (startPage > 1) {%>
	<a href="club_search.jsp?club_gb_cd=<%=club_gb_cd %>&club_at_cd=<%=club_at_cd %>&pageNumber=<%=1 %>">처음</a>
<%} 

if (pageNumber > 1){%>
	<a href="club_search.jsp?club_gb_cd=<%=club_gb_cd %>&club_at_cd=<%=club_at_cd %>&pageNumber=<%=pageNumber -1 %>">이전</a>
<% }

for(int i=startPage; i<=endPage; i++){
	if (i==pageNumber){%>
		<a href="club_search.jsp?club_gb_cd=<%=club_gb_cd %>&club_at_cd=<%=club_at_cd %>&pageNumber=<%=i%>"><b><%=i %></b></a>	
	<%}else{%>
	<a href="club_search.jsp?club_gb_cd=<%=club_gb_cd %>&club_at_cd=<%=club_at_cd %>&pageNumber=<%=i%>"><%=i %></a>
		<%}}%>
		
<%
if (pageNumber < totalPage){%>
	<a href="club_search.jsp?club_gb_cd=<%=club_gb_cd %>&club_at_cd=<%=club_at_cd %>&pageNumber=<%=pageNumber +1 %>">다음</a>
<% } %>

<%
if (endPage < totalPage){%>
	<a href="club_search.jsp?club_gb_cd=<%=club_gb_cd %>&club_at_cd=<%=club_at_cd %>&pageNumber=<%=totalPage %>">끝</a>
<% } %>

</div>
</div>
</div>

<div id="right_side"></div>
<div id="footer"></div>
</div>
</body>
</html>