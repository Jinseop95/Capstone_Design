<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
    
<%@ page import = "Student.StudentDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<jsp:useBean id="userdata" class="Student.StudentVO" scope="page"/>

<jsp:setProperty name="userdata" property="username"/>
<jsp:setProperty name="userdata" property="password"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String userID=null;
	if(session.getAttribute("username")!=null){
		userID = (String)session.getAttribute("username");
	}
	StudentDAO userDAO = new StudentDAO();
	int result = userDAO.login(userdata.getUsername(),userdata.getPassword());
	if(result==1){
		session.setAttribute("username",userdata.getUsername());
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}else if(result==0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 다릅니다.')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}else if(result==-1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디가 없습니다.')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}else if(result==2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터 베이스 오류')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}
%>
</body>
</html>