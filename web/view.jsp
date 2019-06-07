<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>

<%@ page import="bbs.Bbs"%>

<%@ page import="bbs.BbsDAO"%>

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 뷰포트 -->

<meta name="viewport" content="width=device-width" initial-scale="1">

<!-- 스타일시트 참조  -->

<link rel="stylesheet" href="css/bootstrap.css">

<title>jsp 게시판 웹사이트</title>

</head>

<body>

	<%

		//로긴한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값

		String userID = null;

		if (session.getAttribute("username") != null) {

			userID = (String) session.getAttribute("username");

	

		}

		int bbsID = 0;

		if (request.getParameter("BOARD_NO") != null) {

			bbsID = Integer.parseInt(request.getParameter("BOARD_NO"));

		}
		
		
		String bbscd="";
		
		if (request.getParameter("BOARD_CD") != null) {

			bbscd = request.getParameter("BOARD_CD");

		}
		
		
		if (bbsID == 0) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('유효하지 않은 글 입니다.')");

			script.println("location.href = 'bbs.jsp'");

			script.println("</script>");

		}

		Bbs bbs = new BbsDAO().getBbs(bbsID,bbscd);
		
		

	%>





	<!-- 네비게이션  -->

	<nav class="navbar navbar-default">

		<div class="navbar-header">

			<button type="button" class="navbar-toggle collapsed"

				data-toggle="collapse" data-target="bs-example-navbar-collapse-1"

				aria-expaned="false">

				<span class="icon-bar"></span> <span class="icon-bar"></span> <span

					class="icon-bar"></span>

			</button>

			<a class="navbar-brand" href="main.jsp">JSP 게시판</a>

		</div>

		<div class="collapse navbar-collapse"

			id="#bs-example-navbar-collapse-1">

			<ul class="nav navbar-nav">

				<li><a href="main.jsp">메인</a></li>

				<li class="active"><a href="bbs.jsp">게시판</a></li>

			</ul>





			<%

				//라긴안된경우

				if (userID == null) {

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

					style="text-align: center; border: 1px solid #dddddd; marign:auto;">

					<thead>

						<tr>

							<th colspan="3"

								style="background-color: #eeeeee; text-align: center;">글 보기 </th>

						</tr>

					</thead>

					<tbody>

						<tr>

							<td style="width: 20%;"> 글 제목 </td>

							<td colspan="2"><%= bbs.getTITLE() %></td>

						</tr>

						<tr>

							<td>작성자</td>	

							<td colspan="2"><%= bbs.getINPUT_ID() %></td>

						</tr>

						<tr>

							<td>작성일</td>	

							<td colspan="2"><%= bbs.getINPUT_DATE().substring(0, 11) + bbs.getINPUT_DATE().substring(11, 13) + "시"

							+ bbs.getINPUT_DATE().substring(14, 16) + "분"%></td>

						</tr>
						<tr>
							<td>조회수</td>
							<td colspan="2"><%= bbs.getOPEN_CNT() %></td>
						</tr>

						<tr>

							<td>내용</td>	

							<td colspan="2" style="min-height: 200px; text-align: left;"><%= bbs.getCONTENTS() %></td>

						</tr>

						

					</tbody>

				</table>	

				<a href = "bbs.jsp" class="btn btn-primary">목록</a>

				

				

				<%

				//글작성자 본인일시 수정 삭제 가능 

					if(userID != null && userID.equals(bbs.getINPUT_ID())){

				%> 

						<a href="update.jsp?BOARD_NO=<%= bbs.getBOARD_NO() %>" class="btn btn-primary">수정</a>

						<a href="deleteAction.jsp?BOARD_NO=<%=bbs.getBOARD_NO()%>" class="btn btn-primary">삭제</a>

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

