<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="smarteditor2/demo/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>한림대학교 동아리 관리</title>
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
*/
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

<style>
.td_2{
width:80%;
}
</style>
<body>
<h3>글 쓰기</h3>

<form name="board_form" method="post" action="">
	<table class="type03" width="800px;" height="80px;">
		<tr>
			<td>분류/제목</td>
			<td class="td_2">
			<select name="items1">
					<option value="007001">공지사항</option>
					<option value="007002">자유게시판</option>
					<option value="007003">QnA</option>
					<option value="007004">사진</option>
					<option value="007005">일정</option>
				</select>
			<input type="text" name="title" size="70">
			</td>
		</tr>
		
		<tr>
			<td>동아리명</td>
			<td class="td_2"><input type="text" name="title" id="title" size="20">
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
			<td class="td_2"><textarea name="content" id="content" rows="22" style="width:645px;"></textarea>
			
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
</body>
</html>