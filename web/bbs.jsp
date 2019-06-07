<%@page import="javax.security.auth.callback.ConfirmationCallback"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>

<%@ page import="bbs.BbsDAO"%>

<%@ page import="bbs.Bbs"%>

<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 뷰포트 -->

<meta name="viewport" content="width=device-width" initial-scale="1">

<!-- 스타일시트 참조  -->

<link rel="stylesheet" href="css/bootstrap.css">

<title>jsp 게시판 웹사이트</title>

<style type="text/css">
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
</style>

</head>

<body>
<%request.setCharacterEncoding("UTF-8");%>
		
		
	<%

			//로긴한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값

			String username = null;

			if (session.getAttribute("username") != null) {

				username = (String) session.getAttribute("username");

	

			}

	

			int pageNumber = 1; //기본 페이지 넘버

	

			//페이지넘버값이 있을때

			if (request.getParameter("pageNumber") != null) {

				pageNumber = Integer.parseInt(request.getParameter("pageNumber"));

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
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<!-- 네비게이션  -->

	<nav class="navbar navbar-default">

		<div class="navbar-header">



			

		</div>

		<div class="collapse navbar-collapse"
			id="#bs-example-navbar-collapse-1">

			<ul class="nav navbar-nav">

				<li><a href="main.jsp">메인</a></li>

				<li class="active"><a href="bbs.jsp">게시판</a></li>

			</ul>





			<%

					//라긴안된경우

					if (username == null) {

				%>

			<ul class="nav navbar-nav navbar-right">

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>

					<ul class="dropdown-menu">

						<li><a href="login.jsp">로그인</a></li>

						<li><a href="join.jsp">회원가입</a></li>

					</ul></li>

			</ul>

			<%

					} else {

				%>

			<ul class="nav navbar-nav navbar-right">

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>

					<ul class="dropdown-menu">

						<li><a href="logoutAction.jsp">로그아웃</a></li>

					</ul></li>

			</ul>

			<%

					}

				%>

		</div>

	</nav>

	<!-- 게시판 -->

	<div class="container">

		<div class="row">

			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd; margin:auoto;">

				<thead>

					<tr>

						<th style="background-color: #eeeeee; text-align: center;">번호</th>

						<th style="background-color: #eeeeee; text-align: center;">제목</th>

						<th style="background-color: #eeeeee; text-align: center;">분류</th>

						<th style="background-color: #eeeeee; text-align: center;">작성자</th>

						<th style="background-color: #eeeeee; text-align: center;">작성일</th>

						<th style="background-color: #eeeeee; text-align: center;">조회수</th>



					</tr>

				</thead>


				<tbody>


					<%

							BbsDAO bbsDAO = new BbsDAO();

							ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
							

							for (int i = 0; i < list.size(); i++) {
							
						%>


<!-- <script language="javascript">

	var hi=0;
    function OK2()
    {    
    	
        hi++;
        alert(hi);
        
    }
\
</script> -->


					<tr>

						<td><%=list.get(i).getBOARD_NO()%></td>

						<td><a href="view.jsp?BOARD_NO=<%=list.get(i).getBOARD_NO()%>"><%=list.get(i).getTITLE()%></a></td>

						<td><%=list.get(i).getBoard_cd() %></td>

						<td><%=list.get(i).getINPUT_ID() %></td>


						<td><%=list.get(i).getINPUT_DATE().substring(0, 11) + list.get(i).getINPUT_DATE().substring(11, 13) + "시"

							+ list.get(i).getINPUT_DATE().substring(14, 16) + "분"%></td>

						<td><%=list.get(i).getOPEN_CNT() %></td>

					</tr>





					<%

							}

						%>



				</tbody>

			</table>

			<!-- 페이지 넘기기 -->

			<%

					if (pageNumber != 1) {

				%>

			<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arrow-left">이전</a>

			<%

					}

					 if (bbsDAO.nextPage(pageNumber)) { 
					
				%>

			<a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arrow-left">다음</a>

			<%

					}

				%>





			<!-- 회원만넘어가도록 -->

			<%

					//if logined userID라는 변수에 해당 아이디가 담기고 if not null

					if (session.getAttribute("username") != null) {

				%>

			<!-- <a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a> -->
<a href="write.jsp"  class="btn btn-primary pull-right" onclick="window.open('write.jsp','index','width=300, height=200'">글쓰기</a>
			<%

					} else {

				%>

			<button class="btn btn-primary pull-right"
				onclick="if(confirm('로그인 하세요'))location.href='main.jsp';"
				type="button">글쓰기</button>

			<%

					}

				%>



		</div>

	</div>









	<!-- 애니매이션 담당 JQUERY -->

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

	<!-- 부트스트랩 JS  -->

	<script src="js/bootstrap.js"></script>



</body>

</html>