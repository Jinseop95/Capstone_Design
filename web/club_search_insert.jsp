<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	<%
		request.setCharacterEncoding("UTF-8");

		String club_gb_cd = ""; //클럽 구분(중앙,과)
		String club_at_cd = ""; //클럽 속성(학술,운동)
		String search = "";

		if (request.getParameter("club_gb_cd") != null) {
			club_gb_cd = request.getParameter("club_gb_cd");
		}
		if (request.getParameter("club_at_cd") != null) {
			club_at_cd = request.getParameter("club_at_cd");
		}
		if (request.getParameter("search") != null) {
			search = request.getParameter("search");
		}
	%>

	<jsp:useBean id="vo" class="exam.jdbc.ClubVO" />
	<jsp:setProperty property="*" name="vo" />
	<jsp:useBean id="dao" class="exam.jdbc.JDBC_clubDAO" />


	<%
		out.print("<script>");
		out.print("location.href='club_search.jsp?club_gb_cd=" + club_gb_cd + "&search=" + search + "&club_at_cd="
				+ club_at_cd + "'");
		out.print("</script>");
	%>



</body>
</html>