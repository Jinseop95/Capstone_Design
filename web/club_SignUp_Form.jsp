<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.DriverManager,
                   java.sql.Connection,
                   java.sql.Statement,
                   java.sql.ResultSet,
                   java.sql.SQLException"%>
                   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
                   
<style>
   table.type03 {
    border-collapse: collapse;
    text-align: center;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-left: 5px solid #369;
   margin : 5px 3px;
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
      
   .bottom {
       position:absolute;
       width:60%;
       top:72%; left:20%;
      text-align:center;
    }
    
    .apply {
       position:absolute;
       width:36%;
       top:78%; left:64%;
    }
    
    font{
       color:red;
    }
    
    .button {
    width:80px;
    background-color: #046BB9;
    border: none;
    color:#fff;
    padding: 5px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    border-radius:10px;
    cursor: pointer;
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
response.setContentType("text/html;charset=utf-8;");
request.setCharacterEncoding("utf-8");     //charset, Encoding 설정
Class.forName("com.mysql.jdbc.Driver");    // load the drive
String DB_URL = "jdbc:mysql://localhost/mydb";
               // 주의 : test by changing mydb to name that you make
String DB_USER = "root";
String DB_PASSWORD= "2865";
Connection conn= null;
Statement stmt = null;
ResultSet rs   = null; 

try {
    conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    String value  = request.getParameter("dong_nm");
    out.println("<script>alert("+value+");</script>");
    %>

<form method="post" action="club_SignUp_Action.jsp" onsubmit="return check_form();">
    <h2><%=value %> 동아리 가입 신청서</h2>
    
    <%
                          
                          try {
                              conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                             stmt = conn.createStatement();
                             
                             String clubNM = value;
                             
                             String subQuery = "SELECT CLUB_ID from club WHERE CLUB_NM = '"+clubNM+"';";
                             
                             rs = stmt.executeQuery(subQuery);
               
                              
                                 if(rs.next()) {%>
                                 <input type="text" name="CLUB_ID" value=<%=rs.getInt(1)%> style="display:none">
                                    <%}
        
                              
                              rs.close();        // ResultSet exit
                              stmt.close();     // Statement exit
                              conn.close();    // Connection exit 
                              
                          }catch (Exception e) {
                              out.println("<script>alert('오류가 발생하였습니다.');</script>");
                          }
                         %>
                         
       
<%}catch (Exception e) {
   out.println("<script>alert('오류.');</script>");
}
%>

<table class="type03">
    <tr>
        <th rowspan="6" width="20%"><br><br><br>인 적<br>사 항</th>
        <td width="20%">학과<font>*</font></td>
        <td width="20%"><input type="text"  name="MAJOR" id="MAJOR"></td> 
        <td width="20%">학년<font>*</font></td>
        <td width="20%"><input type="text"  name="GRADE" id="GRADE"></td>
    </tr>
    <tr>
        <td>학번<font>*</font></td>
        <td><input type="text" name="STUDENT_ID" readonly="readonly" value=<%=username%>></td>
        <!-- <input type="text" name="STUDENT_ID"></td>  -->
        <td>성명<font>*</font></td>
        <td><input type="text" style="width:62%" name="NM" id="NM">
        <select name="GENDER_CD" id="GENDER">
          <option value="">성별*</option>
          <option value="01">남성</option>
          <option value="02">여성</option>
      </select>
        </td>
    </tr>
    <tr>
        <td>생년월일</td>
        <td colspan="3"><input type="text" style="width:99%" name="BIRTH_DT" placeholder="  ex)  19951212"></td>    
    </tr>
    <tr>
        <td>전화번호<font>*</font></td>
        <td colspan="3"><input type="text" style="width:99%" name="PHONE_NO" id="PHONE_NO" placeholder="  ex)  01012345678"></td>    
    </tr>
    <tr>
        <td>주소</td>
        <td colspan="3"><input type="text" style="width:99%" name="ADDRESS"></td> 
    </tr>
    <tr>
        <td>E-mail</td>
        <td colspan="3"><input type="text" style="width:99%" name="EMAIL"></td> 
    </tr>
    
    <tr>
       <th><br>차      후<br>활동계획</th>
        <td colspan="4" height="100px"><textarea style="width:99%; height:99%; resize: none" name="plan"></textarea></td> 
    </tr>
    
    <tr>
       <th><br>바라는 점</th>
        <td colspan="4" height="80px"><textarea style="width:99%; height:99%; resize: none" name="hope"></textarea></td> 
    </tr>
    <!-- 
    <tr>
       <th><br>비고</th>
        <td colspan="4" height="80px"><textarea style="width:99%; height:99%; resize: none" ></textarea></td> 
    </tr>
    -->
   
</table>

<div class="bottom">
위의 기재한 내용이 틀림없음을 확인하며 가입을 신청합니다.
</div>

<div class="apply">
신청자(학번)<font>*</font> ( <input type="text" style="width:30%;" id="apply"> ) 
<input type="submit" class="button" value="제출 하기">
</div>

</form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
function check_form(){
	var ck_major = document.getElementById("MAJOR").value;
	var ck_grade = document.getElementById("GRADE").value;
	var ck_nm = document.getElementById("NM").value;
	var ck_gender = document.getElementById("GENDER").value;
	var ck_phone = document.getElementById("PHONE_NO").value;
	var ck_apply = document.getElementById("apply").value;	
	
	var exp = /^[0-9]{1}$/;	//숫자만, 글자수 1
	var exp1 = /^[0-9]+$/;	//숫자만, 전화번호 검증
	
	if (ck_major.trim() == ""){
		alert("학과를 입력해주세요");
		document.getElementById("MAJOR").focus();
		return false;
	}
	if (!ck_grade.match(exp)){
		alert("학년은 숫자 1글자로 입력해주세요.");
		document.getElementById("GRADE").focus();
		return false;
	}
	if (ck_nm.trim() == ""){
		alert("이름을 입력해주세요");
		document.getElementById("NM").focus();
		return false;
	}
	if (ck_gender == ""){
		alert("성별을 선택해주세요");
		document.getElementById("GENDER").focus();
		return false;
	}
	if (ck_phone.trim() == ""){
		alert("전화번호를 입력해주세요.");
		document.getElementById("PHONE_NO").focus();
		return false;		
	}	
	if(!ck_phone.match(exp1)){
		alert("전화번호는 -를 제외하고 입력해주세요");
		document.getElementById("PHONE_NO").focus();
		return false;
	}
	if (ck_apply.trim() == ""){
		alert("서명해주세요.");
		document.getElementById("apply").focus();
		return false;		
	}
	if (ck_apply != <%=username%>){
		alert("학번을 정확하게 서명해주세요.");
		document.getElementById("apply").focus();
		return false;		
	}

}
</script>


</body>
</html>