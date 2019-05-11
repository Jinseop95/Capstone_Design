<%@page import="java.net.URLEncoder"%>
<%@page import="exam.jdbc.ClubVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="exam.jdbc.JDBC_clubDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>동아리 검색</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<link rel="stylesheet" href="css/bootstrap.css">

<style>
table td {
cursor: pointer;
}
</style>
</head>
<body>
	<script type="text/javascript" src="js/bootstap.js"></script>
	<%request.setCharacterEncoding("UTF-8");
String clubDivide="";
String search ="";
int pageNumber =0;
if(request.getParameter("clubDivide") != null){
	clubDivide = request.getParameter("clubDivide");
}
if(request.getParameter("search") != null){
	search = request.getParameter("search");
}
if(request.getParameter("pageNumber") != null){
	try{
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));

	}catch(Exception e){
		System.out.println("검색 페이지 번호 오류");
	}
}
	
%>
	<!--
        1. dao객체 선언한다.
        2. dao쪽의 select하는 메소드를 호출하여 그 결과를 리턴하여 테이블에 예쁘게 출력한다.
    -->

	<jsp:useBean id="dao" class="exam.jdbc.JDBC_clubDAO" />
	<br>
	<form method="get" action="club_form.jsp">
		<select name="clubDivide">
			<option value="">전체</option>
			<option value="001001"
				<%if(clubDivide.equals("001001")) out.println("selected");%>>중앙동아리</option>
			<option value="001002"
				<%if(clubDivide.equals("001002")) out.println("selected"); %>>과동아리</option>
		</select> <input type="text" name="search" size="30">
		<button type="submit">검색</button>
	</form>

	</br>
	동아리명
	<table id="name_table" border="1">

		<tr>
			<%
    //ArrayList<ClubVO> list = dao.getList(clubDivide, search, pageNumber);
    ArrayList<ClubVO> list = new ArrayList<ClubVO>();
    list = new JDBC_clubDAO().getList(clubDivide, search, pageNumber);

    if(list != null)
    {}
    	for(int i=0; i<list.size(); i++){
    		if( i ==  5 ) break;
    		ClubVO club = list.get(i);
    
    	
    %>

			<td><%=club.getClub_nm() %></td>

		</tr>
		<%
	    }
	     %>

	</table>
	<ul class="pagination justify-content-center mt-3">
		<li class="page-item">
			<%
		if(pageNumber <= 0) {
		%> <a class="page-link disabled">이전</a> <% } else{ 
		%> <a class="page-link"
			href="club_form.jsp?clubDivide=<%=URLEncoder.encode(clubDivide,"UTF-8") %>
		&search=<%=URLEncoder.encode(search,"UTF-8") %>&pageNumber=<%=pageNumber -1 %>">이전</a>
			<%
		}
		%>
		</li>
		<li>
			<%
		if(list.size() < 6) {
		%> <a class="page-link disabled">다음</a> <% } else{ 
		%> <a class="page-link"
			href="club_form.jsp?clubDivide=<%=URLEncoder.encode(clubDivide,"UTF-8") %>
		&search=<%=URLEncoder.encode(search,"UTF-8") %>&pageNumber=<%=pageNumber +1 %>">다음</a>
			<%
		}
		%>

		</li>
	</ul>


	<script>

// 테이블의 Row 클릭시 값 가져오기
$("#name_table tr").click(function(){     

    var str = ""
        var tdArr = new Array();    // 배열 선언
        
        // 현재 클릭된 Row(<tr>)
        var tr = $(this);
        var td = tr.children();
        
        // tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
        console.log("클릭한 Row의 모든 데이터 : "+tr.text());
        
        // 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
        td.each(function(i){
            tdArr.push(td.eq(i).text());
        });
    
        // td.eq(index)를 통해 값을 가져올 수도 있다.
        var no = td.eq(0).text();

    $("#title", opener.document).val(no); 
    alert(no+" 선택하셨습니다.");
    window.close();
});


</script>
</body>
</html>