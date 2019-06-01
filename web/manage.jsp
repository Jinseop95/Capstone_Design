<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>

<%@page import="exam.jdbc.ClubVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="exam.jdbc.JDBC_clubDAO"%>

<%@page import="clubMember.clubMemberDAO"%>
<%@page import="clubMember.clubMemberVo"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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


   table.type02 {
    border-collapse: collapse;
    text-align: center;
    line-height: 1.5;
    border-right: 1px solid #ccc;
    border-top: 5px solid #369;
   margin : 5px 3px;
   }
   table.type02 th {
       padding: 3px;
       font-weight: bold;
       vertical-align: top;
       color: #153d73;
       border-right: 1px solid #ccc;
       border-bottom: 1px solid #ccc;
   }
   table.type02 td {
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
	width: 15.5%;
	margin-top: 7%;
}
.mainLeft {
	border: 1px solid #ccc;
	float: left;
	margin-left: 3%;
	padding: 10px;
	min-height: 75%;
	width: 31%;
	overflow: auto;
	margin-top: 7%;
}
.mainRight {
	border: 1px solid #ccc;
	float: left;
	margin-left: 3%;
	padding: 10px;
	min-height: 75%;
	width: 35%;
	overflow: auto;
	margin-top: 7%;
}

.type03 a{
	text-decoration: none;
}

a:link { color: black; text-decoration: none;}
a:active{ color: black; text-decoration: none;}
a:visited { color: black; text-decoration: none;}
a:hover { color: black; text-decoration: underline;}
</style>
</head>
<body>
	<%
		String username = null;
		if (session.getAttribute("username") != null) {
			username = (String) session.getAttribute("username");
		}
		
		if(username == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'club_search.jsp'");
			script.println("</script>");
		}
		
		int row_index = 0; 
		
		
		if (request.getParameter("row_index") != null) {
			row_index = Integer.parseInt(request.getParameter("row_index"));
		}

	%>

	<%
		request.setCharacterEncoding("UTF-8");

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
	
	<div id="left_side">
		<table class="type03">
			<tr>
				<td><a href="manage.jsp">동아리 회원 승인</a></td>
			</tr>
			<tr>
				<td><a href="manage_list.jsp">동아리 회원 관리</a></td>
			</tr>
		</table>
	</div>
	


	<div class="mainLeft"  style=" height:700px;">
		<jsp:useBean id="dao" class="exam.jdbc.JDBC_clubDAO" />
			
			<%
				ArrayList<ClubVO> manage_list = dao.getManageClub(username);

				int club_id = manage_list.get(0).getClub_id();
				
				if (request.getParameter("club_id") != null) {
					club_id = Integer.parseInt(request.getParameter("club_id"));
				}
			%>
		
			<form method="get" action="manage.jsp">
			<h3>관리 할 수 있는 동아리 목록 &nbsp;
			<select name="club_id" id="club_id" onchange="club_post();" style="font-size:20px; font-weight: bold;">
				<% for (ClubVO vo : manage_list) { 
				
				%>
				<option value= <%=vo.getClub_id() %>       
				<%if (club_id == vo.getClub_id())
				out.println("selected");%>> 
				<%=vo.getClub_nm() %></option>
				<% }%>
			</select> 
			
			
			</h3>
			<input type="hidden" name="row_index" id="row_index" value=<%=row_index %>>
			
			</form>
			
			<jsp:useBean id="member_dao" class="clubMember.clubMemberDAO" />
			<%
				ArrayList<clubMemberVo> member_list = member_dao.getMember(club_id,0);
			%>	
		<table class="type04" border = "1" >
			<tr>
				<th style="font-size: 20px; width:500px;">전공</th>
				<th style="font-size: 20px; width:500px;">학번</th>
				<th style="font-size: 20px; width:500px;">이름</th>
			</tr>
			<%
				if (member_list.size() == 0){%>
					<tr>
					<th colspan="3">동아리 가입 신청이 없습니다.</th>
					</tr>
				<% }else{
			 for (clubMemberVo cvo : member_list) { %>
				<tr onclick="getIndex(this);" id="club_table" style="cursor:pointer">
				<td><%=cvo.getMAJOR() %></td>
				<td><%=cvo.getSTUDENT_ID() %></td>
				<td><%=cvo.getNM() %></td>
				</tr>
			<% }%>

			</table>
	</div>

	<div class="mainRight">
	
	<form method="post" action ="join_cd_update.jsp">
	<input type="hidden" name="join_club" id="join_club" value=0>
		<table class="type02">
    <tr>
        <th rowspan="6" width="20%"><br><br><br>인 적<br>사 항</th>
        <td width="20%">학과<font>*</font></td>
        <td width="20%"><input type="text"  name="MAJOR" id="MAJOR" value=<%= member_list.get(row_index).getMAJOR()%> readonly="readonly" ></td> 
        <td width="20%">학년<font>*</font></td>
        <td width="20%"><input type="text"  name="GRADE" id="GRADE" value=<%= member_list.get(row_index).getGRADE() %> readonly="readonly"></td>
    </tr>
    <tr>
        <td>학번<font>*</font></td>
        <td><input type="text" name="STUDENT_ID" readonly="readonly" value=<%= member_list.get(row_index).getSTUDENT_ID()%>></td>
       
        <td>성명<font>*</font></td>
        <td><input type="text" style="width:62%" name="NM" id="NM" value=<%= member_list.get(row_index).getNM()%> readonly="readonly" >
       <% if (member_list.get(row_index).getGENDER_CD().equals("01")) {
       		out.println("남성");
       }else{
    	   out.println("여성");
       }
       %> 

        </td>
    </tr>
    <tr>
        <td>생년월일</td>
        <td colspan="3"><input type="text" style="width:99%" name="BIRTH_DT" id="BIRTH_DT" value=<%= member_list.get(row_index).getBIRTH_DT()%> readonly="readonly"></td>    
    </tr>
    <tr>
        <td>전화번호<font>*</font></td>
        <td colspan="3"><input type="text" style="width:99%" name="PHONE_NO" id="PHONE_NO" value=<%= member_list.get(row_index).getPHONE_NO()%> readonly="readonly"></td>    
    </tr>
    <tr>
        <td>주소</td>
        <td colspan="3"><input type="text" style="width:99%" name="ADDRESS" value=<%= member_list.get(row_index).getADDRESS()%> readonly="readonly"></td> 
    </tr>
    <tr>
        <td>E-mail</td>
        <td colspan="3"><input type="text" style="width:99%" name="EMAIL" value=<%= member_list.get(row_index).getEMAIL()%> readonly="readonly"></td> 
    </tr>
    
    <tr>
       <th><br>차      후<br>활동계획</th>
        <td colspan="4" height="100px"><textarea style="width:99%; height:99%; resize: none" name="plan" readonly="readonly"><%= member_list.get(row_index).getPlan()%> </textarea></td> 
    </tr>
    
    <tr>
       <th><br>바라는 점</th>
        <td colspan="4" height="80px"><textarea style="width:99%; height:99%; resize: none" name="hope" readonly="readonly"><%= member_list.get(row_index).getHope()%></textarea></td> 
    </tr>

	</table>
		<input type="submit" value="승인" name="submit" style="cursor:pointer">
		<input type="submit" value="거부" name="submit" style="cursor:pointer">
	<% }%>
	</form>
	</div>
	
	<script>
	
	var a = document.getElementById("club_table").parentNode;
	var idx = parseInt(document.getElementById("row_index").value) + 1;
	var trs = a.getElementsByTagName('tr');

	for ( var i = 0; i < trs.length; i++ ) {
			trs[i].style.backgroundColor = "white";
			trs[idx].style.backgroundColor = "#dcdcdc";
		}
	document.getElementById("join_club").value = document.getElementById("club_id").value;
	
	function club_post(){
		var id = document.getElementById("club_id").value;
		location.href="manage.jsp?club_id="+id+"&row_index=0";	//선택 값이 바뀌면 첫 행부터
	}

	function getIndex(x){
		var idx = x.rowIndex-1;
		document.getElementById("row_index").value = x.rowIndex-1;
		location.href="manage.jsp?club_id=<%=club_id%>&row_index=" + idx;
		
	}
	
	</script>
</body>
</html>