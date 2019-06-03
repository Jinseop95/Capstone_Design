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
	width: 15.5%;
	margin-top: 7%;
}

.mainLeft {
	border: 1px solid #ccc;
	float: left;
	margin-left: 3%;
	padding: 10px;
	min-height: 75%;
	width: 70%;
	overflow: auto;
	margin-top: 7%;
}

.type03 a {
	text-decoration: none;
}

.type03 a:active {
	color: black;
}

.type03 a:link {
	color: black;
}

.type03k a:visited {
	color: black;
}

.search_list li {
	display: inline;
}

a:link {
	color: black;
	text-decoration: none;
}

a:active {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: underline;
}
</style>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");

		String username = null;
		if (session.getAttribute("username") != null) {
			username = (String) session.getAttribute("username");
		}

		if (username == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'club_search.jsp'");
			script.println("</script>");
		}

		String category = "NM";
		String search = "";
		int pageNumber = 1; //현재 페이지 번호

		if (request.getParameter("category") != null) {
			category = request.getParameter("category");
		}
		if (request.getParameter("search") != null) {
			search = request.getParameter("search");
		}
		if (request.getParameter("pageNumber") != null) {
			try {
				pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			} catch (Exception e) {
				System.out.println("검색 페이지 번호 오류");
			}
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



	<div class="mainLeft" style="height: 700px;">
		<jsp:useBean id="dao" class="exam.jdbc.JDBC_clubDAO" />

		<%
			ArrayList<ClubVO> manage_list = dao.getManageClub(username);

			int club_id = manage_list.get(0).getClub_id();

			if (request.getParameter("club_id") != null) {
				club_id = Integer.parseInt(request.getParameter("club_id"));
			}
		%>

		<form method="get" action="manage_list.jsp">
			<h3>
				관리 할 수 있는 동아리 목록 &nbsp; <select name="club_id" id="club_id"
					onchange="club_post();" style="font-size: 20px; font-weight: bold;">
					<%
						for (ClubVO vo : manage_list) {
					%>
					<option value=<%=vo.getClub_id()%>
						<%if (club_id == vo.getClub_id())
					out.println("selected");%>>
						<%=vo.getClub_nm()%></option>
					<%
						}
					%>
				</select>
			</h3>
		</form>

		<jsp:useBean id="member_dao" class="clubMember.clubMemberDAO" />
		<%
			int totalcount = 0;
			ArrayList<clubMemberVo> member_list = member_dao.getMember(club_id, 1, category, search, pageNumber);
			try {
				totalcount = member_list.get(0).getRow_count();
			} catch (Exception e) {
			}
			if (totalcount == 0) {
		%>
		<p>검색 결과가 없습니다.</p>
		<%
			} else {
		%>
		<p>
			검색 결과는
			<%=totalcount%>개 입니다.
		</p>
		<%
			}
		%>

		<table id="myTable" class="type04" border="1">
			<tr>
				<th style="font-size: 20px; width: 800px;">전공</th>
				<th style="font-size: 20px; width: 150px;">학년</th>
				<th style="font-size: 20px; width: 300px;">학번</th>
				<th style="font-size: 20px; width: 500px;">이름</th>
				<th style="font-size: 20px; width: 300px;">연락처</th>
				<th style="font-size: 20px; width: 500px;">임원</th>
				<th style="font-size: 20px; width: 250px;">가입일자</th>
				<th style="font-size: 20px; width: 500px;">관리</th>
			</tr>
			<%
				for (clubMemberVo cvo : member_list) {
			%>
			<tr>
				<form name="form" method="post" action="join_cd_update.jsp" >
				<td><%=cvo.getMAJOR()%></td>
				<td><%=cvo.getGRADE()%></td>
				<td><%=cvo.getSTUDENT_ID()%></td>
				<td><%=cvo.getNM()%></td>
				<td><%=cvo.getPHONE_NO()%></td>
				<td><%=cvo.getSTAFF_CD()%></td>
				<td><%=cvo.getJoin_dt()%></td>
				<input type="hidden" name="student_id" value=<%=cvo.getSTUDENT_ID() %>>
				<input type="hidden" name="join_club" value=<%=club_id %>>
				<td><button value=<%=cvo.getSTUDENT_ID()%> name="update" onclick="popup(this.form);">수정</button>
					<input type="submit" value="제명" name="submit" style="cursor:pointer">
				</form>
			</tr>
			<%
				}
			%>

		</table>
		<p>
			<button id="export">Excel다운</button>
		</p>
		<div id="page_out" style="text-align: center; margin-top: 30px;">
			<%
				int countList = 10;
				int countPage = 5;
				int totalPage = totalcount / countList;
				if (totalcount > countList * totalPage) {
					totalPage++;
				}
				//현재 페이지가 총 페이지 번호보다 클 경우 
				if (totalPage < pageNumber) {
					pageNumber = totalPage;
				}
				int startPage = ((pageNumber - 1) / countPage) * countPage + 1; //페이지 번호  시작
				int endPage = startPage + countPage - 1; //페이지 번호 끝
				if (endPage > totalPage) {
					endPage = totalPage;
				}

				if (startPage > 1) {
			%>
			<a
				href="manage_list.jsp?club_id=<%=club_id%>&category=<%=category%>&search=<%=search%>&pageNumber=<%=1%>">처음</a>
			<%
				}
				if (pageNumber > 1) {
			%>
			<a
				href="manage_list.jsp?club_id=<%=club_id%>&category=<%=category%>&search=<%=search%>&pageNumber=<%=pageNumber - 1%>">이전</a>
			<%
				}
				for (int i = startPage; i <= endPage; i++) {
					if (i == pageNumber) {
			%>
			<a
				href="manage_list.jsp?club_id=<%=club_id%>&category=<%=category%>&search=<%=search%>&pageNumber=<%=i%>"><b><%=i%></b></a>
			<%
				} else {
			%>
			<a
				href="manage_list.jsp?club_id=<%=club_id%>&category=<%=category%>&search=<%=search%>&pageNumber=<%=i%>"><%=i%></a>
			<%
				}
				}
			%>

			<%
				if (pageNumber < totalPage) {
			%>
			<a
				href="manage_list.jsp?club_id=<%=club_id%>&category=<%=category%>&search=<%=search%>&pageNumber=<%=pageNumber + 1%>">다음</a>
			<%
				}
			%>

			<%
				if (endPage < totalPage) {
			%>
			<a
				href="manage_list.jsp?club_id=<%=club_id%>&category=<%=category%>&search=<%=search%>&pageNumber=<%=totalPage%>">끝</a>
			<%
				}
			%>
		</div>

		<form method="post" action="manage_list.jsp?&club_id=<%=club_id%>">
			<ul class="search_list" style="text-align: center">
				<li><select name="category">
						<option value="nm"
							<%if (category.equals("nm"))
				out.println("selected");%>>이름</option>
						<option value="major"
							<%if (category.equals("major"))
				out.println("selected");%>>전공</option>
						<option value="student_id"
							<%if (category.equals("student_id"))
				out.println("selected");%>>학번</option>
				</select></li>
				<li><input type="text" id="search" name="search" size="30"
					value="<%=search%>" onfocus="this.select()"></li>
				<li><button type="submit">검색</button></li>
			</ul>
		</form>

	</div>

	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

	<script>
		function club_post() {
			var id = document.getElementById("club_id").value;
			location.href = "manage_list.jsp?club_id=" + id;
		}
		function popup(frm)
		{
		  var url    ="memberInfo.jsp";
		  var title  = "testpop";
		  var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=800, height=500, top=50,left=20"; 
		  window.open("", title,status); //window.open(url,title,status); window.open 함수에 url을 앞에와 같이
		                                            //인수로  넣어도 동작에는 지장이 없으나 form.action에서 적용하므로 생략
		                                            //가능합니다.
		  frm.target = title;                    //form.target 이 부분이 빠지면 form값 전송이 되지 않습니다. 
		  frm.action = url;                    //form.action 이 부분이 빠지면 action값을 찾지 못해서 제대로 된 팝업이 뜨질 않습니다.
		  frm.method = "post";
		  frm.submit();     
		  }

	</script>


</body>
</html>