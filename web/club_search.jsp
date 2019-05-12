<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <style>
    body{
    margin:0;}
    #wrap{
width:90%;
margin:auto;
}

#toptop
{   width:75%;
    background-color:white;
    float:left;
    margin-left:12.5%;
    margin-right:12.5%;
    text-align:left;
    
}

#menu{width:12.5%;
    height:1200px;

    float:left;
}

#img{
width:25%;
height:250px;
background-color:yellow;
float:left;
margin:auto;
}

#t1{ 
    width:50%;
    height:100%;    
    float:left;
    margin-left:0.3%;
}

#serch{
   width:25%;
   height:250px;
   float:left;
   margin-left:5%;
}


table.type09 {
   
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;

}
table.type09 thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 1px solid black;
    border-top: 3px solid #036;
    text-align:left;
 
}
table.type09 tbody th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
    
    
}
table.type09 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 0.5px solid black;
}

button{
  background:#114F7D;
  color:#fff;
  border:none;
  position:relative;
  height:30px;
  font-size:12px;
  padding:0 1em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color: black;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #114F7D;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}



 .fixbar {
    margin: auto;
    padding: 0px;
    list-style: none;
    position: fixed;
    width: 100%;
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
    padding: 27px 40px;
    display: block;
  }

  ul li a:hover{
    text-decoration: underline;
    font-size: 140%;
    opacity: 1.0;
    /* color: black; */
  }

</style>
</head>

<body>
<ul class="fixbar">
    <img src="img/logo.png" align="left" >
    <li><a href="#"></a></li>
    
    <li><a href="main.html">메인 페이지</a></li>
    <li><a href="유형.html">동아리 조회</a></li>
    <li><a href="무형.html">게시판</a></li>
    <li><a href="생활.html">D</a></li>
    <li><a href="feedback.html">E</a></li>
  </ul>
  <br><br>
  <br><br>

  <br><br>
<div id="toptop">

<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;동아리 소개
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<select name="jump" onchange="location.href=this.value">
<option>선택</option>
<option value="http://www.naver.com">중앙 동아리</option>
<option value="http://www.daum.net">과 동아리</option>
</select>

<button>문화</button>
<button>봉사</button>
<button>종교</button>
<button>학술</button>
<button>체육</button>
</h2>
</div>
<div id="wrap">

<div id="menu">
</div>


<div id="img">
<img src="img/b1.jpg" width=100%; height=100%;>
</div>
<div id="t1">
    <table class="type09">
    <thead>
    <tr>
        <th scope="cols" colspan="4">한림 SV</th>
        
    </tr>
    </thead>
    <tbody>
    <tr>
        <th scope="row">회원수</th>
        <td>100명</td>
         <th scope="row">결성년도</th>
        <td>2019년</td>
    </tr>
   <tr>
        <th scope="row">회장</th>
        <td>이지훈</td>
         <th scope="row">지도교수</th>
        <td>이성룡 교수님</td>
    </tr>
    <tr>
        <th scope="row">설립목적</th>
        <td colspan="3">한림인을 위하여 봉사하라!</td>
        
    </tr>
    
        <tr>
        <th scope="row">주요활동</th>
        <td colspan="3">후배를 위한 선배의 멘토링</td>
        
    </tr>
    
    </tbody>
</table>

<br><br>
<br><br>

</div>
    <div id="img">
<img src="img/b1.jpg" width=100%; height=100%;>
</div>
<div id="t1">
    <table class="type09">
    <thead>
    <tr>
        <th scope="cols" colspan="4">블레스</th>
        
    </tr>
    </thead>
    <tbody>
    <tr>
        <th scope="row">회원수</th>
        <td>15명</td>
         <th scope="row">결성년도</th>
        <td>1985년</td>
    </tr>
   <tr>
        <th scope="row">회장</th>
        <td>김진섭</td>
         <th scope="row">지도교수</th>
        <td>이정 교수님</td>
    </tr>
    <tr>
        <th scope="row">설립목적</th>
        <td colspan="3">축구를 하기위한 모임</td>
        
    </tr>
    
        <tr>
        <th scope="row">주요활동</th>
        <td colspan="3">매주 화요일 아침 9시 축구 시합 </td>
        
    </tr>
    
    </tbody>
</table>
<br><br>
<br><br>

</div>
    <div id="img">
<img src="img/b1.jpg" width=100%; height=100%;>
</div>
<div id="t1">
    <table class="type09">
    <thead>
    <tr>
        <th scope="cols" colspan="4">소확행</th>
        
    </tr>
    </thead>
    <tbody>
    <tr>
        <th scope="row">회원수</th>
        <td>300명</td>
         <th scope="row">결성년도</th>
        <td>2002년</td>
    </tr>
   <tr>
        <th scope="row">회장</th>
        <td>김정인</td>
         <th scope="row">지도교수</th>
        <td>김은주 교수님</td>
    </tr>
    <tr>
        <th scope="row">설립목적</th>
        <td colspan="3">소소한 행복을 누리기 위함</td>
        
    </tr>
    
        <tr>
        <th scope="row">주요활동</th>
        <td colspan="3">파이썬 멘토링</td>
        
    </tr>
    
    </tbody>
</table>
<br><br>
<br><br>

</div>
    <div id="img">
<img src="img/b1.jpg" width=100%; height=100%;>
</div>
<div id="t1">
    <table class="type09">
    <thead>
    <tr>
        <th scope="cols" colspan="4">삼박자</th>
        
    </tr>
    </thead>
    <tbody>
    <tr>
        <th scope="row">회원수</th>
        <td>3명</td>
         <th scope="row">결성년도</th>
        <td>2019년</td>
    </tr>
   <tr>
        <th scope="row">회장</th>
        <td>박태언</td>
         <th scope="row">지도교수</th>
        <td>김유섭 교수님</td>
    </tr>
    <tr>
        <th scope="row">설립목적</th>
        <td colspan="3">지,덕,체 를 함유하기 위함</td>
        
    </tr>
    
        <tr>
        <th scope="row">주요활동</th>
        <td colspan="3">공부 도덕 체육</td>
        
    </tr>
    
    </tbody>
</table>
<br><br>
<br><br>


</div>



</body>
</html>