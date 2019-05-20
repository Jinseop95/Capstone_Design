<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
html, body {
	width: 100%;
	height: 100%;
}

.fixbar {
	margin: auto;
	padding: 0px;
	list-style: none;
	position: fixed;
	width: 100%;
	text-align: left;
	background-color: #114f7d;
}

.fixbar li {
	display: inline-block;
}

.fixbar li a {
	color: white;
	text-decoration: none;
	font-weight: bold;
	font-size: 20px;
	padding: 27px 40px;
	display: block;
}

.fixbar .login {
	position: absolute;
	height: 100%;
	top: 50%;
	right: 10%;
	z-index: 9999;
	border-radius: 10px;
	float: left;
	text-align: center;
	font-size: 15px;
	color: white;
}

.fixbar .login a {
	color: white;
	opacity: 1.0;
	/* text-decoration: non: ;e; */
	font-weight: bold;
	font-size: 15px;
}

table.type03 {
	border-collapse: collapse;
	text-align: center;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	border-left: 20px solid #369;
	margin: auto;
	text-align: center;
	width: 100%;
	font-size: 30px;
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

table.type04 {
	border-collapse: collapse;
	text-align: center;
	line-height: 1.5;
	border-left: 1px solid #ccc;
	border-top: 20px solid #369;
	margin: auto;
	text-align: center;
	width: 100%;
	font-size: 25px;
}

table.type04 th {
	padding: 3px;
	font-weight: bold;
	vertical-align: top;
	color: #153d73;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

table.type04 td {
	padding: 3px;
	vertical-align: top;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

#left_side {
	float: left;
	margin: 5px;
	margin-left: 3%;
	padding: 10px;
	min-height: 60%;
	width: 18.5%;
}

.mainLeft {
	border: 1px solid #ccc;
	float: left;
	margin-left: 3%;
	padding: 10px;
	min-height: 75%;
	width: 31%;
	overflow: auto;
}

.mainRight {
	border: 1px solid #ccc;
	float: left;
	margin-left: 3%;
	padding: 10px;
	min-height: 75%;
	width: 31%;
	overflow: auto;
}
</style>
</head>
<body>
	<%
		String username = null;
		if (session.getAttribute("username") != null) {
			username = (String) session.getAttribute("username");
		}
	%>.

	<ul class="fixbar">
		<img src="img/logo.png" align="left" />
		<li><a href="#"></a></li>
		<li><a href="main.html">���� ������</a></li>
		<li><a href="����.html">���Ƹ� ��ȸ</a></li>
		<li><a href="����.html">�Խ���</a></li>
		<li><a href="��Ȱ.html">D</a></li>
		<li><a href="feedback.html">E</a></li>
		<%
			if (username == null) {
		%>
		<div class="login">
			<form method="post" action="LoginAction.jsp">
				<input type="text" name="username"
					style="width: 130px; height: 30px;"> <input type="passWord"
					name="password" style="width: 130px; height: 30px;"> <input
					type="submit" value="�α��� "> <a href='#'
					onclick='javascript:window.open("signUp.jsp","name99", "width=720px,height=720px");'>ȸ������</a>
			</form>
		</div>
		<%
			} else {
		%>
		<div class="login">
			<%
				out.print((String) session.getAttribute("username") + " �� �������.");
			%>
			<a href='logoutAction.jsp'>�α׾ƿ�</a> <a href='myInfo.jsp'>| ���� ����</a>
			</li>
			</form>
		</div>
		<%
			}
		%>
	</ul>
	<br>
	<br>
	<br>
	<br>

	<br>
	<br>

	<div id="left_side">
		<table class="type03">
			<tr>
				<td>����������</td>
			</tr>
			<tr>
				<td>ȸ������</td>
			</tr>
		</table>
	</div>

	<div class="mainLeft">
		<table class="type04">
			<tr>
				<td style="font-size: 30px;">���� ��û ��Ȳ</td>
			</tr>
			<tr>
				<td>���� ~ ���Ƹ��� ���Խ����� �Դϴ�.
					<button style="float: right;">���</button>
				</td>
			</tr>
		</table>
	</div>

	<div class="mainRight">
		<table class="type04">
			<tr>
				<td style="font-size: 30px;">���� ���Ƹ�</td>
			</tr>
			<tr>
				<td>�Ѹ� S.V.</td>
			</tr>
		</table>
	</div>
</body>
</html>