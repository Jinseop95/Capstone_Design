<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!--
    1. 넘어오은 값 한글 인코딩 처리한다.
    2. 사용할 객체 useBean한다
    3. setXxx를 호출하여 넘어오는 값들 저장한다.
    3. dao쪽의 insert하는 메소드 호출하여 성공 여부를 리턴한후
       성공하면 memberSelect.jsp 이동 실패하면 뒤로 이동 시킨다.
 -->

	<%request.setCharacterEncoding("UTF-8");

String club_gb_cd ="";	//클럽 구분(중앙,과)
String club_at_cd ="";	//클럽 속성(학술,운동)
String search ="";


if(request.getParameter("club_gb_cd") != null){
	club_gb_cd = request.getParameter("club_gb_cd");
}
if(request.getParameter("club_at_cd") != null){
	club_at_cd = request.getParameter("club_at_cd");
}
if(request.getParameter("search") != null){
	search = request.getParameter("search");
}


%>

	<jsp:useBean id="vo" class="exam.jdbc.ClubVO" />
	<jsp:setProperty property="*" name="vo" />
	<jsp:useBean id="dao" class="exam.jdbc.JDBC_clubDAO" />


	<%

        out.print("<script>");
        out.print("location.href='club_search.jsp?club_gb_cd="+club_gb_cd+"&search="+search+"&club_at_cd="+club_at_cd+"'");        
        out.print("</script>");
    
 %>



</body>
</html>