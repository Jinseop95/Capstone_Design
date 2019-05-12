<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<style>
.fixbar {
    margin: 0;
    padding: 0;
    list-style: none;
    position: fixed;
    width: 100%;
    height:15%;
    text-align: left;
    background-color: #114f7d ;
  }
  .fixbar li {
    display: inline-block;
  }
  .fixbar li a {
    color:white;
    text-decoration: none;
    font-weight: bold;
    font-size: 20px;
    padding: 20px 20px;
    display: block;
  }

  ul li a:hover{
    text-decoration: underline;
    font-size: 140%;
    opacity: 1.0;
    /* color: black; */
  }
  
    .wrap{
    	position:absolute;
    	top:20%;
		width:80%;
		height:75%;
		left:19%;
		border:3px solid #6fa8d2;
		border-radius:10px;
	}
	
	.leftSide{
		position:absolute;
    	top:20%;
		width:15%;
		height:75%;
		left:0.5%;		
	}
	
	.leftSide ul{
		width:100%;
		list-style:none;
		margin:0px;
		padding:0px;
		position:relative;
		text-align:center;
		}
	.leftSide ul a{
		text-decoration:none;
		display:block;
		width:100%;
		height:10%;
		line-height:35px;
		}
	.leftSide li{
		width:100%;
		background-color:#336699;
		color:white;
		dispaly:inline-block;
		border-bottom:3px solid white;
		border-right:2px solid white;
		}
	.leftSide ul li:hover{
		background-color:#6fa8d2;
		}
	.leftSide ul ul{
		display:none;
		position:absolute;
		left:103%;
		top:0%;
		}
	.leftSide ul li:hover>ul{
		display:block;
		}
	
</style>
</head>

<body>
<ul class="fixbar">
    <img src="logo.PNG" width="20%" height="100%" align="left" >
    <li><a href="main.html">메인 페에지</a></li>
    <li><a href="유형.html">동아리 조회</a></li>
    <li><a href="무형.html">게시판</a></li>
  </ul>
  
<div class="wrap">
</div>

<div class="leftSide">
<ul>
	<li><a herf="">회원 관리</a>
	<ul>
			<li><a herf="">회원 목록</a></li>
			<li><a herf="">가입신청 현황</a></li>
			<li><a herf="">권한 수정</a></li>
		</ul>
		</li>
	<li><a herf="">menu2</a>
		<ul>
			<li><a herf="">2menu1</a></li>
			<li><a herf="">2menu1</a></li>
			<li><a herf="">2menu1</a></li>
		</ul>
	</li>
	<li><a herf="">menu3</a></li>
</ul>
</div>


</body>
</html>