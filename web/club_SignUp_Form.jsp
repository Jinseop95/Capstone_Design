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

<h2>���Ƹ� ȸ������ ��û��</h2>
<form>
<table class="type03">
    <tr>
        <th rowspan="6" width="20%"><br><br><br>�� ��<br>�� ��</th>
        <td width="20%">�а�<font>*</font></td>
        <td width="20%"><input type="text"></td> 
        <td width="20%">�г�<font>*</font></td>
        <td width="20%"><input type="text"></td>
    </tr>
    <tr>
        <td>�й�<font>*</font></td>
        <td><input type="text"></td> 
        <td>����<font>*</font></td>
        <td><input type="text" style="width:62%">
        <select name="gender">
		    <option value="">����*</option>
		    <option value="male">����</option>
		    <option value="female">����</option>
		</select>
  		</td>
    </tr>
    <tr>
        <td>�������</td>
        <td colspan="3"><input type="text" style="width:99%" placeholder="  ex)  19951212"></td> 	
    </tr>
    <tr>
        <td>��ȭ��ȣ<font>*</font></td>
        <td colspan="3"><input type="text" style="width:99%" placeholder="  ex)  01012345678"></td> 	
    </tr>
    <tr>
        <td>�ּ�</td>
        <td colspan="3"><input type="text" style="width:99%"></td> 
    </tr>
    <tr>
        <td>E-mail</td>
        <td colspan="3"><input type="text" style="width:99%"></td> 
    </tr>
    
    <tr>
    	<th><br>��      ��<br>Ȱ����ȹ</th>
        <td colspan="4" height="100px"><textarea style="width:99%; height:99%; resize: none" ></textarea></td> 
    </tr>
    
    <tr>
    	<th><br>�ٶ�� ��</th>
        <td colspan="4" height="80px"><textarea style="width:99%; height:99%; resize: none" ></textarea></td> 
    </tr>
    <!-- 
    <tr>
    	<th><br>���</th>
        <td colspan="4" height="80px"><textarea style="width:99%; height:99%; resize: none" ></textarea></td> 
    </tr>
	 -->
	
</table>

<div class="bottom">
���� ������ ������ Ʋ�������� Ȯ���ϸ� ������ ��û�մϴ�.
</div>

<div class="apply">
��û��<font>*</font> ( <input type="text" style="width:30%;"> ) 
<input type="submit" class="button" value="���� �ϱ�">
</div>

</form>
</body>
</html>