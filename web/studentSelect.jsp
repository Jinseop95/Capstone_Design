<%@page import="exam.jdbc.StudentVO"%>
<%@page import="java.util.ArrayList"%>
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
        1. dao객체 선언한다.
        2. dao쪽의 select하는 메소드를 호출하여 그 결과를 리턴하여 테이블에 예쁘게 출력한다.
    -->

  <jsp:useBean id="dao" class="exam.jdbc.JDBC_studentDAO" />
    <%
    ArrayList<StudentVO> list = dao.getStudentlist();
    %>
   
    <h2>student Info</h2>
    <table>
        <tr bgcolor="pink">
        <th>아이디</th><th>비밀번호</th><th>INPUT_ID</th><th>INPUT_IP</th><th>INPUT_DATE</th>
        </tr>
    <%
    for(StudentVO vo : list){
    %> 
        <tr>
            <td><%=vo.getUsername() %></td>
            <td><%=vo.getPassword() %></td>
            <td><%=vo.getUsername() %></td>
            <td><%=vo.getInput_ip() %></td>
            <td><%=vo.getInput_date() %></td>
        </tr>
               
    <%
    }
     %>
    </table>

</body>
</html>