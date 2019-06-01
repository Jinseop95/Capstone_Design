
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

<!DOCTYPE html>
<html>
<head>
<style>
body {
	width: 100%;
}

#wrapper {
	width: 100%;
	min-height: 25%;
	margin: 0 auto;
}

#left_side, #right_side, #contents {
	margin: 5px;
	padding: 10px;
}

#left_side, #contents {
	float: left;
	min-height: 25%;
}

#right_side {
	float: right;
	min-height: 25%
}

#left_side {
	/*  background-color: goldenrod; */
	width: 18.5%;
}

#contents {
margin-top:120px;
	width: 70%;
}

#right_side {
	width: 1%;
}

#footer {
	height: 70px;
	position: relatiev;
	clear: both;
}

#page_out {
	clear: both;
	width: 100%;
	text-align: center;
}

#page_in {
	display: inline-block;
}

.title {
	font-size: x-large;
	margin-right: 50px;
}

#img {
	width: 25%;
	height: 250px;
	float: left;
	margin-right: 15px;
}

.t1 {
	width: 40%;
	height: 300px;
	float: left;
}

.sub {
	width: 30%;
	height: 300px;
	float: left;
	margin-left: 5px;
	overflow: auto;
}

table.type09 {
	width: 100%;
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
	text-align: left;
}

table.type09 tbody th {
	width: 180px;
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

button {
	background: #114F7D;
	color: #fff;
	border: none;
	position: relative;
	height: 30px;
	font-size: 12px;
	padding: 0 1em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
}

button:hover {
	background: #fff;
	color: black;
}

button:before, button:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #114F7D;
	transition: 400ms ease all;
}

button:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

button:hover:before, button:hover:after {
	width: 100%;
	transition: 800ms ease all;
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
	text-decoration: underline;
	font-size: 140%;
	opacity: 1.0;
	/* color: black; */
}

h2 {
	margin-left: 100px;
	]
}

ul {
	list-style: none;
}

ul li {
	display: inline;
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

	<%
		request.setCharacterEncoding("UTF-8");
		String club_gb_cd = ""; //클럽 구분(중앙,과)
		String club_at_cd = ""; //클럽 속성(학술,운동)
		String search = "";
		int pageNumber = 1; //현재 페이지 번호

		if (request.getParameter("club_gb_cd") != null) {
			club_gb_cd = request.getParameter("club_gb_cd");
		}
		if (request.getParameter("club_at_cd") != null) {
			club_at_cd = request.getParameter("club_at_cd");
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


	<%
		String title = "";
		if (club_at_cd.equals("002001")) {
			title = "학술 동아리 소개";
		} else if (club_at_cd.equals("002002")) {
			title = "운동 동아리 소개";
		} else if (club_at_cd.equals("002003")) {
			title = "봉사 동아리 소개";
		} else if (club_at_cd.equals("002004")) {
			title = "문화 동아리 소개";
		} else if (club_at_cd.equals("002005")) {
			title = "종교 동아리 소개";
		} else if (club_at_cd.equals("002006")) {
			title = "기타 동아리 소개";
		} else {
			title = "전체 동아리 소개";
		}
	%>


	<div id="wrapper">
		<div id="left_side"></div>
		<div id="contents">
			<form method="get" action="club_search.jsp">

				<ul class="club_list">
					<li class="title"><%=title%></li>
					<li><select name="club_gb_cd" onchange="this.form.submit();">
							<option value="">전체</option>
							<option value="001001"
								<%if (club_gb_cd.equals("001001"))
				out.println("selected");%>>중앙
								동아리</option>
							<option value="001002"
								<%if (club_gb_cd.equals("001002"))
				out.println("selected");%>>과
								동아리</option>
					</select></li>
					<li><input type="text" id="search" name="search" size="30"
						value="<%=search%>" onfocus="this.select()"></li>
					<li><button type="submit">검색</button></li>
					<li><button name="club_at_cd" onclick="this.form.submit()"
							value="">전체</button></li>
					<li><button name="club_at_cd" onclick="this.form.submit()"
							value="002001">학술</button></li>
					<li><button name="club_at_cd" onclick="this.form.submit()"
							value="002002">운동</button></li>
					<li><button name="club_at_cd" onclick="this.form.submit()"
							value="002003">봉사</button></li>
					<li><button name="club_at_cd" onclick="this.form.submit()"
							value="002004">문화</button></li>
					<li><button name="club_at_cd" onclick="this.form.submit()"
							value="002005">종교</button></li>
					<li><button name="club_at_cd" onclick="this.form.submit()"
							value="002006">기타</button></li>
				</ul>
			</form>

			<jsp:useBean id="dao" class="exam.jdbc.JDBC_clubDAO" />


			<%
				ArrayList<ClubVO> gb_list = dao.getClublist(club_gb_cd, search, club_at_cd, pageNumber);
				int totalcount = 0;

				String prof_name = "";

				try {
					totalcount = gb_list.get(0).getRow_count();
				} catch (Exception e) {
				}
				if (totalcount == 0) {
			%>
			<h3>검색 결과가 없습니다.</h3>
			<%
				} else {
			%>
			<h3>
				검색 결과는
				<%=totalcount%>개 입니다.
			</h3>
			<%
				}
			%>

			<%
				for (ClubVO vo : gb_list) {
			%>

			<div id="img">
				<img src="<%=vo.getIntro_file_nm()%>" alt="동아리 포스터 이미지" width=100%;
					height=100%;>
			</div>
			<div class="t1">
				<table class="type09">
					<thead>
						<tr>
							<form method="post" action="club_SignUp_Form.jsp" target="w"
								onsubmit="return postPopUp();">
								<th scope="col" colspan="4"><input type="text"
									name="dong_nm" value=<%=vo.getClub_nm()%> readonly="readonly" style="border:none; 
									outline: none; font-weight : bold; font-size : 20px;"> 
									<input	type="submit" value="가입 신청" id="signUpBtn" style="float: right;">
							</form>
							</th>
						</tr>
						<script>
							function postPopUp() {
						<%if (username == null) {%>
							alert("로그인이 필요합니다.");
								return false;
						<%} else {%>
							window
										.open('', 'w',
												'width=900,height=650,location=no,status=no');
								return true;
						<%}%>
							}
						</script>


					</thead>
					<tbody>
						<tr>
							<th scope="row">회원수</th>
							<td><%=vo.getCnt()%>명</td>
							<th scope="row">결성년도</th>
							<td><%=vo.getOpen_dt().substring(0, 4)%>년</td>
						</tr>
						<tr>
							<th scope="row">회장</th>
							<td>이지훈</td>
							<th scope="row">지도교수</th>
							<td><%=dao.getProfessor(vo.getClub_id())%></td>
						</tr>
						<tr>
							<th scope="row">설립목적</th>
							<td colspan="3"><%=vo.getClub_aim()%></td>

						</tr>

						<tr>
							<th scope="row">주요활동</th>
							<td colspan="2"><%=vo.getClub_active()%></td>
							<td scope="row" style="text-align: right;">
								<button value=<%=vo.getClub_nm()%>
									onclick="showMore(this.value);">더보기</button>
							</td>
						</tr>

					</tbody>
				</table>
			</div>

			<div class="sub">
				<table name="" id=<%=vo.getClub_nm()%> style="display: none;"
					class="type09">
					<thead>
					</thead>
					<tbody>
						<tr>
							<th style="width: 40%;" scope="row">동아리방 위치</th>
							<td style="width: 60%;"><%=vo.getClub_room()%></td>
						</tr>
						<tr>
							<th style="width: 40%;" scope="row">전화번호 (회장)</th>
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

									try {
										conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
										stmt = conn.createStatement();

										String clubNM = vo.getClub_nm();

										String subQuery = "SELECT CLUB_ID from club WHERE CLUB_NM = '" + clubNM + "';";

										rs = stmt.executeQuery(subQuery);
										if (rs.next()) {

											String query = "";
											query = "SELECT PHONE_NO from club_member where CLUB_ID=" + rs.getInt(1)
													+ " AND STAFF_CD='004001';";

											rs = stmt.executeQuery(query);

											if (rs.next()) {
							%>
							<td style="width: 60%;"><%=rs.getString(1)%></td>
							<%
								}

										}

										rs.close(); // ResultSet exit
										stmt.close(); // Statement exit
										conn.close(); // Connection exit 

									} catch (Exception e) {
										out.println("<script>alert('전화번호 오류');</script>");
									}
							%>
						</tr>
						<tr>
							<th style="align: center;" colspan="2" scope="row">동아리 소개</th>
						</tr>
						<tr>
							<td style="word-break: break-all; font-size: 14px;" wrap="hard"
								colspan="2"><%=vo.getIntro_cont()%></td>
						</tr>
					</tbody>
				</table>
			</div>

			<script>
				function showMore(clicked_id) {

					var name = document.getElementById(clicked_id).name;

					if (name == null) {
						document.getElementById(clicked_id).style = "display:'';";
						document.getElementById(clicked_id).name = "1";
					} else {
						document.getElementById(clicked_id).style = "display:none;";
						document.getElementById(clicked_id).name = null;
					}

				}
			</script>

			<%
				}
			%>
		</div>
		<div id="page_out">

			<%
				int countList = 4;
				int countPage = 2;
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
				href="club_search.jsp?club_gb_cd=<%=club_gb_cd%>&search=<%=search%>&club_at_cd=<%=club_at_cd%>&pageNumber=<%=1%>">처음</a>
			<%
				}
				if (pageNumber > 1) {
			%>
			<a
				href="club_search.jsp?club_gb_cd=<%=club_gb_cd%>&search=<%=search%>&club_at_cd=<%=club_at_cd%>&pageNumber=<%=pageNumber - 1%>">이전</a>
			<%
				}
				for (int i = startPage; i <= endPage; i++) {
					if (i == pageNumber) {
			%>
			<a
				href="club_search.jsp?club_gb_cd=<%=club_gb_cd%>&search=<%=search%>&club_at_cd=<%=club_at_cd%>&pageNumber=<%=i%>"><b><%=i%></b></a>
			<%
				} else {
			%>
			<a
				href="club_search.jsp?club_gb_cd=<%=club_gb_cd%>&search=<%=search%>&club_at_cd=<%=club_at_cd%>&pageNumber=<%=i%>"><%=i%></a>
			<%
				}
				}
			%>

			<%
				if (pageNumber < totalPage) {
			%>
			<a
				href="club_search.jsp?club_gb_cd=<%=club_gb_cd%>&search=<%=search%>&club_at_cd=<%=club_at_cd%>&pageNumber=<%=pageNumber + 1%>">다음</a>
			<%
				}
			%>

			<%
				if (endPage < totalPage) {
			%>
			<a
				href="club_search.jsp?club_gb_cd=<%=club_gb_cd%>&search=<%=search%>&club_at_cd=<%=club_at_cd%>&pageNumber=<%=totalPage%>">끝</a>
			<%
				}
			%>

		</div>
		<div id="right_side"></div>
		<div id="footer"></div>
	</div>


</body>
</html>