<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
	table.type03 th {w
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

<h2>동아리 회원가입 신청서</h2>
<form>
<table class="type03">
    <tr>
        <th rowspan="6" width="20%"><br><br><br>인 적<br>사 항</th>
        <td width="20%">학과<font>*</font></td>
        <td width="20%"><input type="text"></td> 
        <td width="20%">학년<font>*</font></td>
        <td width="20%"><input type="text"></td>
    </tr>
    <tr>
        <td>학번<font>*</font></td>
        <td><input type="text"></td> 
        <td>성명<font>*</font></td>
        <td><input type="text" style="width:62%">
        <select name="gender">
		    <option value="">성별*</option>
		    <option value="male">남성</option>
		    <option value="female">여성</option>
		</select>
  		</td>
    </tr>
    <tr>
        <td>생년월일</td>
        <td colspan="3"><input type="text" style="width:99%" placeholder="  ex)  19951212"></td> 	
    </tr>
    <tr>
        <td>전화번호<font>*</font></td>
        <td colspan="3"><input type="text" style="width:99%" placeholder="  ex)  01012345678"></td> 	
    </tr>
    <tr>
        <td>주소</td>
        <td colspan="3"><input type="text" style="width:99%"></td> 
    </tr>
    <tr>
        <td>E-mail</td>
        <td colspan="3"><input type="text" style="width:99%"></td> 
    </tr>
    
    <tr>
    	<th><br>차      후<br>활동계획</th>
        <td colspan="4" height="100px"><textarea style="width:99%; height:99%; resize: none" ></textarea></td> 
    </tr>
    
    <tr>
    	<th><br>바라는 점</th>
        <td colspan="4" height="80px"><textarea style="width:99%; height:99%; resize: none" ></textarea></td> 
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
신청자<font>*</font> ( <input type="text" style="width:30%;"> ) 
<input type="submit" class="button" value="제출 하기">
</div>

</form>
</body>
</html>