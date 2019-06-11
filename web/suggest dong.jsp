<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:useBean id="clubDAO" class="exam.jdbc.JDBC_clubDAO" />

<style>

ul{
   list-style:none;
   padding-left:0px;
   }

</style>
</head>
<body>
<%request.setCharacterEncoding("UTF-8");%>

<%	
	String[] recommend;

	String AT_CD  = request.getParameter("AT_CD"); 
	recommend = clubDAO.recommend_dong(AT_CD);
%>
<h1 style="text-align: center;">DataBase 확인 결과  추천하는 동아리 입니다.</h1>

	<%if(recommend!=null){ %>
		<ul>
		<%for(int i=0; i<recommend.length; i++){%>
			<li>
			<h1 style="text-align: center;">
			<a href="http://localhost:8080/WEB/Capstone/club_search.jsp?club_gb_cd=&search=<%=recommend[i]%>"><%=recommend[i]%></a>
			</h1>	
			</li>
		<%}%>
			
			</ul>
	<%}%>
</body>
</html>