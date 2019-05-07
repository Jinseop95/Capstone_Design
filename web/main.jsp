<%@page import="exam.jdbc.PointVO"%>
<%@page import="java.util.ArrayList"%>
<link rel="stylesheet" type="text/css" href="design/font4.css" />
<!-- 온도그래프 위에 추가 -->
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<title>한림대학교 동아리 관리</title>

<script type="text/javascript" src="jquery-1.6.4.min.js.js"></script>
<script type="text/javascript" src="jquery.cookie.js"></script>
<link rel="stylesheet" type="text/css" href="design/font.css" />
<link rel="stylesheet" type="text/css" href="design/font2.css" />
<link rel="stylesheet" type="text/css" href="design/font3.css" />

<link rel="stylesheet" type="text/css" href="design/font5.css" />

<script type="text/javascript" src="design/second.js"></script>
<script type="text/javascript" src="design/first.js"></script>
<link href="themes/3/js-image-slider.css" rel="stylesheet" type="text/css" />
<script src="themes/3/js-image-slider.js" type="text/javascript"></script>



<style>
.menu1 a{
text-decoration:none;
}
        </style>

</head>
<body>

<div id="logo"> </div>

<div id="skipNav"><a href="#content">본문이동</a></div>
<div class="wrapAll">
   <div class="headerWrap">
 
      <div class="headBox">
			  <img src="img/logo-white.png" alt="" />
			  
         <div id="headArea">
            <!-- ################################## -->
            <!-- ### LOGO 및 GNB ### -->
            <!-- ################################## -->
  		     
           
           
            <div class="wrap-gnb" id="uiNavGnb"> 

            </div>
            <!-- ################################## -->
            <!-- ### 로그인 ### -->
            <!-- ################################## -->

            <!-- ################################## -->
         </div>
      </div>
      <!-- //headBox -->
   </div>

   <div id="content" class="contentWrap">
      <!-- //////////////////////////////////////////////////////////////////////////////////// -->
      <!-- 상단 비주얼영역 -->
      <!-- //////////////////////////////////////////////////////////////////////////////////// -->
      <div class="wrap-visual">
      
         <!-- ################################## -->
         <!-- 슬라이더 : 컨텐츠 -->
         <!-- ################################## -->
         

      </div>

      <!-- //////////////////////////////////////////////////////////////////////////////////// -->
      <!-- 빠른메뉴 -->
      <!-- //////////////////////////////////////////////////////////////////////////////////// -->
       <jsp:useBean id="dao" class="exam.jdbc.PointDAO" />
    <%
    ArrayList<PointVO> list = dao.getPoint();
    %>
      <div class="main-section main-con1">
         <h2 class="blind">빠른메뉴</h2>
         <ul class="menu1">
            <li><a href="#" class="q1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<!-- 디비에서 값 가져오기 -->
            <b> 
            현재 모인 금액은   <%
            String test="";
            int hi=0;
    for(PointVO vo : list){
    %> 
    <%=String.format("%,d", vo.getMoney())%>
    <%
    hi=vo.getMoney()*100/100000;
%>        
    <%
    }
     %>원 입니다.
            </b>
            </a>&nbsp;&nbsp;&nbsp; 후원계좌 : 010-5042-2295 (우리은행,김진섭)
            </li>
            </ul>

      </div>

      <!-- //////////////////////////////////////////////////////////////////////////////////// -->
      <!-- 새소식, 이벤트 -->
      <!-- //////////////////////////////////////////////////////////////////////////////////// -->
      
         <!-- ################################## -->
         <!-- 새소식 -->
         <!-- ################################## -->
         
<div id=countdown-wrap>
  <div id="goal">목표 금액: 100,000 원   </div>
  <div id="glass">
    <div id="progress" style="width:<%=hi%>%;"></div>
  </div>
  <div class="goal-stat">
    <span class="goal-number" style="bottom: <%=hi%>%" ><%=hi%>%</span>
    <span class="goal-label">모금률</span>
  </div>
</div>

        
            


      <!-- //////////////////////////////////////////////////////////////////////////////////// -->
      <!-- 인사이트 -->
      <!-- //////////////////////////////////////////////////////////////////////////////////// -->
      <div class="main-section main-con3">
         <div class="section wrap-slider">
            <h2 class="blind">인사이트</h2>
            <!-- ################################## -->
            <!-- 슬라이더 : 컨텐츠 -->
            <!-- ################################## -->
            <div class="area-con">
               <ul>
                  <!-- 컨텐츠하나 ---------------------- // -->
                  <li class="ico1">
                     <a href="dong_search.jsp">
                     <span>
                     	
                     	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="img/hi3.png"></img>
                        <em>동아리 검색</em>
                        </span>
                        <strong class="tit"><span></span>동아리 검색 </strong>
                        <span>원하는 동아리를 검색해보세요<br /> </span>
                     </a>
                  </li>
                  <li class="ico2">
                     <a onclick='javascript:window.open("login.jsp","name99", "width=720px,height=720px");'>
                        <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="img/hi2.png"></img>
                        <em>동아리 추천</em></span>
                        <strong class="tit"><span>동아리 추천</span></strong>
                        <span>개인에게 맞는 동아리를 알아보세요</span>
                     </a>
                  </li>
                  <li class="ico3">
                     <a href="fac.jsp">
                        <span>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="img/hi4.png"></img>
                        <em>게시판</em></span>
                        <strong class="tit"> <span>게시판</span></strong>
                        <span>공지사항 및 QnA</span>
                     </a>
                     </li>
                     <li class="ico4">
                     <a href="board.jsp">
                        <span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="img/hi.png"></img>
                        <em>게시판</em>
                        </span>
                        <strong class="tit"> <span>응원 메시지, 투명성</span></strong>
                        <span>소아 당뇨 환자들에게 힘을 주세요.  <br/>후원 내역입니다.</span>
                     </a>
                 	</li>
                  <!-- ---------------------------------- // -->
               </ul>
            </div>
          
            



            <!-- ################################## -->
            <!-- 슬라이더 : 컨트롤 -->
            <!-- ################################## -->
            <div class="area-control">
               <button class="ui-btn before">이전</button>
               <button class="ui-btn play off">자동재생시작</button>
               <button class="ui-btn stop">자동재생멈춤</button>
               <button class="ui-btn next">다음</button>
            </div>
            <!-- ################################## -->
         </div>
      </div>
            
         </div>
      </div>


<div id="sliderFrame">
        <div id="slider">
            <img src="img/phy.jpg" alt="" />
            <a class="lazyImage" href="img/spring_w.jpg" title=""></a>
            
            <a class="lazyImage" href="img/turtle.jpg" title=""></a>
        </div>
        
        <!--thumbnails-->

    </div>
      <!-- /container -->
      

      <script src="js/classie.js"></script>
      <script src="js/clipboard.min.js"></script>
      <script>
      (function() {
         [].slice.call(document.querySelectorAll('.menu')).forEach(function(menu) {
            var menuItems = menu.querySelectorAll('.menu__link'),
               setCurrent = function(ev) {
                  //ev.preventDefault();
                  var item = ev.target.parentNode; // li
                  // return if already current
                  if (classie.has(item, 'menu__item--current')) {
                     return false;
                  }
                  // remove current
                  classie.remove(menu.querySelector('.menu__item--current'), 'menu__item--current');
                  // set current
                  classie.add(item, 'menu__item--current');
               };
            [].slice.call(menuItems).forEach(function(el) {
               el.addEventListener('click', setCurrent);
            });
         });
         [].slice.call(document.querySelectorAll('.link-copy')).forEach(function(link) {
            link.setAttribute('data-clipboard-text', location.protocol + '//' + location.host + location.pathname + '#' + link.parentNode.id);
            new Clipboard(link);
            link.addEventListener('click', function() {
               classie.add(link, 'link-copy--animate');
               setTimeout(function() {
                  classie.remove(link, 'link-copy--animate');
               }, 300);
            });
         });
      })(window);
</script>
</body>
</html>
