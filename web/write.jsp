<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 뷰포트 -->

<meta name="viewport" content="width=device-width" initial-scale="1">

<!-- 스타일시트 참조  -->

<link rel="stylesheet" href="css/bootstrap.css">

<title>jsp 게시판 웹사이트</title>
<style>
	table.type03 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-left: 5px solid #369;
	margin : 5px 3px;
	}
	table.type03 td {
	    padding: 3px;
	    vertical-align: top;
	    border-right: 1px solid #ccc;
	    border-bottom: 1px solid #ccc;
	}
	
	.buttom{
		position:absolute;
	    width:20%;
	    top:90%; right:5%;
		text-align:left;
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
	.button2 {
    width:80px;
    background-color: #046BB9;
    border: none;
    color:#fff;
    padding: 5px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 12px;
    border-radius:5px;
    cursor: pointer;
	} 
	/*
	.file_input_div{
		position:relative;
		width:100px;
		height:23px;
		overflow:hidden;
	}
	.file_input_button{
		position:absolute;
		top:0px;
		color:white;
   	    border-radius:8px;
	   	width:80px;
		background-color: #046BB9;
		border: none;
		padding: 5px 0;
		text-align: center;
		text-decoration: none;
	 	display: inline-block;
		font-size: 12px;
		border-radius:10px;
		cursor: pointer;
	}
	.file_input_hidden{
		font-size:45px;
		position:absolute;
		right:0px;
		top:0px;
		opacity:0;
		filter:alpha(opacity=0);
		-ms-filter:"alpha(opacity=0)";
		-khtml-opacity:0;
		-moz-opacity:0;
	}

	</style>
	
	<script type="text/javascript">
    
        var openWin;
    
        function openChild()
        {
            // window.name = "부모창 이름"; 
            window.name = "parentForm";
            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
            openWin = window.open("club_form.jsp",
                    "childForm", "width=450, height=350, resizable=yes,top=300,left=500, scrollbars = no");    
        }
        
        
   </script>

</head>

<body>

	<%

		//로긴한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값

		String userID = null;

		if (session.getAttribute("username") != null) {

			userID = (String) session.getAttribute("username");

		}

	%>





	<div class="container">

		<div class="row">

			<form name="board_form" method="post" action="writeAction.jsp">
	<table class="type03" width="800px;" height="80px;">
		<tr>
			<td>분류/제목</td>
			<td class="td_2">
			<select name="board_cd">
					<option>공지사항</option>
					<option>자유게시판</option>
					<option>QnA</option>
					<option>사진</option>
					<option>일정</option>
				</select>
	 
			<input type="text" name="TITLE" size="70">
			</td>
		</tr>
		
		<tr>
			<td>동아리명</td>
			<td class="td_2"><input type="text" name="BOARD_NO" id="title" size="20">
			<input class="button2" type="button" value="동아리검색" onclick="openChild()"> </td>
		</tr>	
			<tr>
			<td>파일 업로드</td>
			<td class="td_2"><input type="file"></td>
			<!-- 
			<td class="td_2">
				
				<input type="text" id="fileName" class="file_input_textbox" readonly="readonly">
				<div class="file_input_div"> 
				<input type="button" value="Search Files" class="file_input_button"/>
				<input type="file" class="file_input_hidden" onchange="javascript:
					document.getElementById('fileName').value=this.value"/>
				</div>
			</td>
			-->
		</tr>
			<tr>
			<td>내용</td>			
			<td class="td_2"><textarea name="CONTENTS" id="bbsTitle" rows="22" style="width:645px;"></textarea>
			
				<script type="text/javascript">
					 var oEditors = [];
					 nhn.husky.EZCreator.createInIFrame({
				     oAppRef: oEditors,
	    			 elPlaceHolder: "content", //textarea에서 지정한 id와 일치해야 합니다.
	 				 sSkinURI: "${contextPath}smarteditor2/demo/SmartEditor2Skin.html",
					 fCreator: "createSEditor2"
					});
				</script>
				
			</td>
		</tr>
	</table>
	<div class="buttom">
	<input class="button" type ="submit" name="작성" value="작성">
	<input class="button" type ="reset" name="취소" value="취소">
	</div>
</form>

		</div>

	</div>









	<!-- 애니매이션 담당 JQUERY -->

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

	<!-- 부트스트랩 JS  -->

	<script src="js/bootstrap.js"></script>



</body>

</html>



