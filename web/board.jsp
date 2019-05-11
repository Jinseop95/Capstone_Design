<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>한림대학교 동아리 관리</title>

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
height:30px;
}


</style>
<body>
<h3>글 쓰기</h3>

<form name="board_form" method="post" action="">
	<table border="1" width="800px;" height="80px;">
		<tr>
			<td>제목</td>
			<td class="td_2"><input type="text" name="title" size="40"></td>
		</tr>
		<tr>
			<td>분류</td>
			<td class="td_2">
				<select name="items1">
					<option value="공지사항">공지사항</option>
					<option value="자유게시판">자유게시판</option>
					<option value="QnA">QnA</option>
					<option value="사진">사진</option>
					<option value="일정">일정</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>동아리명</td>
			<td class="td_2"><input type="text" name="title" id="title" size="20">
			<input type="button" value="동아리검색" onclick="openChild()"> </td>
		</tr>	
			<tr>
			<td>파일 업로드</td>
			<td class="td_2"><input type="file"></td>
		</tr>
			<tr>
			<td>내용</td>
			<td class="td_2"><textarea name="content" cols="40" rows="8"></textarea></td>
		</tr>
	</table>
	<input type ="submit" name="작성" value="작성">
	<input type ="reset" name="취소" value="취소">
</form>
</body>
</html>