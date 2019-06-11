<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

  <title></title>
<style>
  body, html{
  height: 95%;
	font-family: 'Lato', sans-serif;
}

.container{
  display: block;
  position: relative;
  margin: 40px auto;
  height: auto;
  width: 500px;
  padding: 20px;
}

h2 {
	color: balck;
}

.container ul{
  list-style: none;
  margin: 0;
  padding: 0;
	overflow: auto;
}

ul li{
  color: balck;
  display: block;
  position: relative;
  float: left;
  width: 100%;
  height: 100px;
	border-bottom: 1px solid #333;
}

ul li input[type=radio]{
  position: absolute;
  visibility: hidden;
}

ul li label{
  display: block;
  position: relative;
  font-weight: 300;
  font-size: 1.35em;
  padding: 25px 25px 25px 80px;
  margin: 10px auto;
  height: 30px;
  z-index: 9;
  cursor: pointer;
  -webkit-transition: all 0.25s linear;
}

ul li:hover label{
	color: black;
}

ul li .check{
  display: block;
  position: absolute;
  border: 5px solid #AAAAAA;
  border-radius: 100%;
  height: 25px;
  width: 25px;
  top: 30px;
  left: 20px;
	z-index: 5;
	transition: border .25s linear;
	-webkit-transition: border .25s linear;
}

ul li:hover .check {
  border: 5px solid #FFFFFF;
}

ul li .check::before {
  display: block;
  position: absolute;
	content: '';
  border-radius: 100%;
  height: 15px;
  width: 15px;
  top: 5px;
	left: 5px;
  margin: auto;
	transition: background 0.25s linear;
	-webkit-transition: background 0.25s linear;
}

input[type=radio]:checked ~ .check {
  border: 5px solid blue;
}

input[type=radio]:checked ~ .check::before{
  background: blue;
}

input[type=radio]:checked ~ label{
  color: blue;
}

.signature {
	margin: 10px auto;
	padding: 10px 0;
	width: 100%;
}

.signature p{
	text-align: center;
	font-family: Helvetica, Arial, Sans-Serif;
	font-size: 0.85em;
	color: #AAAAAA;
}

.signature .much-heart{
	display: inline-block;
	position: relative;
	margin: 0 4px;
	height: 10px;
	width: 10px;
	background: #AC1D3F;
	border-radius: 4px;
	-ms-transform: rotate(45deg);
    -webkit-transform: rotate(45deg);
    transform: rotate(45deg);
}

.signature .much-heart::before, 
.signature .much-heart::after {
	  display: block;
  content: '';
  position: absolute;
  margin: auto;
  height: 10px;
  width: 10px;
  border-radius: 5px;
  background: #AC1D3F;
  top: -4px;
}

.signature .much-heart::after {
	bottom: 0;
	top: auto;
	left: -4px;
}

.signature a {
	color: #AAAAAA;
	text-decoration: none;
	font-weight: bold;
}


/* Styles for alert... 
by the way it is so weird when you look at your code a couple of years after you wrote it XD */

.alert {
	box-sizing: border-box;
	background-color: #0DFF92;
	width: 100%;
	position: relative; 
	top: 0;
	left: 0;
	z-index: 300;
	padding: 20px 40px;
	color: #333;
}

.alert h2 {
	font-size: 22px;
	color: #232323;
	margin-top: 0;
}

.alert p {
	line-height: 1.6em;
	font-size:18px;
}

.alert a {
	color: #232323;
	font-weight: bold;
}
  
  
  #post_frmae{
  	position:absolute;
  	width:90%;
  	height:75%;
	top:8%;
	left:5%;
	opacity: 0.0;
	z-index:0;
  }
  
</style>
</head>
<body>

	<iframe name="post_frame" id="post_frmae" style="filter: Alpha(Opacity=100);"></iframe> 
	
	<form action="suggest dong.jsp" method="post"  target="post_frame" style="position:absolute; width:50%; top:8%; left:25%">
		
			<div class="container" id="container">
	
				<h2>Select one:</h2>
						  <ul>
					  
						  <li>
						    <input type="radio" id="1" name="AT_CD" value="002001" checked>
						    <label for="1">학술</label>
						    
						    <div class="check"></div>
						  </li>
						  
						  <li>
						    <input type="radio" id="2" name="AT_CD" value="002002">
						    <label for="2">운동</label>
						    
						    <div class="check"><div class="inside"></div></div>
						  </li>
						  
						  <li>
						    <input type="radio" id="3" name="AT_CD" value="002003">
						    <label for="3">봉사</label>
						    
						    <div class="check"><div class="inside"></div></div>
						  </li>
						  
						  <li>
						    <input type="radio" id="4" name="AT_CD" value="002004">
						    <label for="4">문화</label>
						    
						    <div class="check"><div class="inside"></div></div>
						  </li>
						  
						  <li>
						    <input type="radio" id="5" name="AT_CD" value="002005">
						    <label for="5">종교</label>
						    
						    <div class="check"><div class="inside"></div></div>
						  </li>
						  
						  <li>
						    <input type="radio" id="6" name="AT_CD" value="002006">
						    <label for="6">기타</label>
						    
						    <div class="check"><div class="inside"></div></div>
						  </li>
						</ul>
			</div>
			<input class="submit" type="submit" value="조회" onclick="show_frame();" style="border:0px; outline:0px; font-size:20px; background-color:#AAAAA; margin-auto; width:100%; opacity:0.8">
			<br><br>
			<input class="submit" type="reset" value="초기화" onclick="delete_frame();" style="border:0px; outline:0px; font-size:20px; background-colo:#AAAAA; margin-auto; width:100%; opacity:0.8">
		
		</form>
		
<script>
	function show_frame(){
		document.getElementById("post_frmae").style.opacity = 1.0;
		document.getElementById("post_frmae").style.zIndex  = 9999;
		
		document.getElementById("container").style.opacity = 0.0;
	}
	function delete_frame(){
		document.getElementById("post_frmae").style.opacity = 0.0;
		document.getElementById("post_frmae").style.zIndex  = 0;
		
		document.getElementById("container").style.opacity = 1.0;
	}
</script>
</body>
</html>