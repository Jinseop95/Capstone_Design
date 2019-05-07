<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <style>
    #wrap{
width:75%;
margin:auto;
}

#toptop
{   width:75%;
    background-color:white;
    float:left;
    margin-left:12.5%;
    margin-right:12.5%;
    
}

#menu{width:20%;
    height:700px;
    background-color:#114F7D;
    float:left;
}

#img{
width:25%;
height:250px;
background-color:yellow;
float:left;
margin-left:2%;
margin-right:0.5%;
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

    ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 100%;
    background-color:#114f7d
    color:white;
}
li{border:1px solid black;color: white;}
li a {
    display: block;
    color: white;
    padding: 8px 16px;
    text-decoration: none;
}
li a.active {
    background-color: #114f7d; 
    color: white;
}
li a:hover:not(.active) {
    background-color: #092c47;
    color: white;
    font-size:150%;
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

</style>
</head>
<body>
<div id="toptop">
<h2> <img src=img/logo_.gif width=8%;> 학생 생활&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;동아리 소개
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<button>문화</button>
<button>봉사</button>
<button>종교</button>
<button>학술</button>
<button>체육</button>
</h2>
</div>
<div id="wrap">
<div id="menu">
    <ul>
      
      <li><a href="#news">동아리 조회</a></li>
      <li><a href="#contact">동아리 추천</a></li>
      <li><a href="#about">게시판</a></li>
    </ul>
</div>
<div id="img">
<img src="img/b1.jpg" width=100%; height=100%;>
</div>
<div id="t1">
    <table class="type09">
    <thead>
    <tr>
        <th scope="cols" colspan="4">동아리명</th>
        
    </tr>
    </thead>
    <tbody>
    <tr>
        <th scope="row">회원수</th>
        <td>12명</td>
         <th scope="row">결성년도</th>
        <td>12명</td>
    </tr>
   <tr>
        <th scope="row">회장</th>
        <td>12명</td>
         <th scope="row">지도교수</th>
        <td>12명</td>
    </tr>
    <tr>
        <th scope="row">설립목적</th>
        <td colspan="3">내용이 들어갑니다암네언먀ㅐㅔ엄내ㅑㅏ어냐매어ㅐㅁ냐ㅓ애ㅑㅁ넝냐매.</td>
        
    </tr>
    
        <tr>
        <th scope="row">주요활동</th>
        <td colspan="3">내용이 들어갑니다암네언먀ㅐㅔ엄내ㅑㅏ어냐매어ㅐㅁ냐ㅓ애ㅑㅁ넝냐매.</td>
        
    </tr>
    
    </tbody>
</table>
</div>
    
    
    
    </div>
</body>
</html>