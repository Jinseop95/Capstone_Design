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
    
    <li><a href="main.html">���� ������</a></li>
    <li><a href="����.html">���Ƹ� ��ȸ</a></li>
    <li><a href="����.html">�Խ���</a></li>
    <li><a href="��Ȱ.html">D</a></li>
    <li><a href="feedback.html">E</a></li>
  </ul>
  <br><br>
  <br><br>

  <br><br>
<div id="toptop">

<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���Ƹ� �Ұ�
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<select name="jump" onchange="location.href=this.value">
<option>����</option>
<option value="http://www.naver.com">�߾� ���Ƹ�</option>
<option value="http://www.daum.net">�� ���Ƹ�</option>
</select>

<button>��ȭ</button>
<button>����</button>
<button>����</button>
<button>�м�</button>
<button>ü��</button>
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
        <th scope="cols" colspan="4">�Ѹ� SV</th>
        
    </tr>
    </thead>
    <tbody>
    <tr>
        <th scope="row">ȸ����</th>
        <td>100��</td>
         <th scope="row">�Ἲ�⵵</th>
        <td>2019��</td>
    </tr>
   <tr>
        <th scope="row">ȸ��</th>
        <td>������</td>
         <th scope="row">��������</th>
        <td>�̼��� ������</td>
    </tr>
    <tr>
        <th scope="row">��������</th>
        <td colspan="3">�Ѹ����� ���Ͽ� �����϶�!</td>
        
    </tr>
    
        <tr>
        <th scope="row">�ֿ�Ȱ��</th>
        <td colspan="3">�Ĺ踦 ���� ������ ���丵</td>
        
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
        <th scope="cols" colspan="4">����</th>
        
    </tr>
    </thead>
    <tbody>
    <tr>
        <th scope="row">ȸ����</th>
        <td>15��</td>
         <th scope="row">�Ἲ�⵵</th>
        <td>1985��</td>
    </tr>
   <tr>
        <th scope="row">ȸ��</th>
        <td>������</td>
         <th scope="row">��������</th>
        <td>���� ������</td>
    </tr>
    <tr>
        <th scope="row">��������</th>
        <td colspan="3">�౸�� �ϱ����� ����</td>
        
    </tr>
    
        <tr>
        <th scope="row">�ֿ�Ȱ��</th>
        <td colspan="3">���� ȭ���� ��ħ 9�� �౸ ���� </td>
        
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
        <th scope="cols" colspan="4">��Ȯ��</th>
        
    </tr>
    </thead>
    <tbody>
    <tr>
        <th scope="row">ȸ����</th>
        <td>300��</td>
         <th scope="row">�Ἲ�⵵</th>
        <td>2002��</td>
    </tr>
   <tr>
        <th scope="row">ȸ��</th>
        <td>������</td>
         <th scope="row">��������</th>
        <td>������ ������</td>
    </tr>
    <tr>
        <th scope="row">��������</th>
        <td colspan="3">�Ҽ��� �ູ�� ������ ����</td>
        
    </tr>
    
        <tr>
        <th scope="row">�ֿ�Ȱ��</th>
        <td colspan="3">���̽� ���丵</td>
        
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
        <th scope="cols" colspan="4">�����</th>
        
    </tr>
    </thead>
    <tbody>
    <tr>
        <th scope="row">ȸ����</th>
        <td>3��</td>
         <th scope="row">�Ἲ�⵵</th>
        <td>2019��</td>
    </tr>
   <tr>
        <th scope="row">ȸ��</th>
        <td>���¾�</td>
         <th scope="row">��������</th>
        <td>������ ������</td>
    </tr>
    <tr>
        <th scope="row">��������</th>
        <td colspan="3">��,��,ü �� �����ϱ� ����</td>
        
    </tr>
    
        <tr>
        <th scope="row">�ֿ�Ȱ��</th>
        <td colspan="3">���� ���� ü��</td>
        
    </tr>
    
    </tbody>
</table>
<br><br>
<br><br>


</div>



</body>
</html>