<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>포스 축구 아카데미</title>
<%@ include file="./include/homeCSS.jsp" %>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<script>
  jQuery.noConflict();
  (function($) {
    $(document).ready(function() {
      $('.slide_div').slick({
    	  centerMode: true,
		  centerPadding: '90px',
		  slidesToShow: 5,
		  slidesToScroll: 1,
		  autoplay: true,
		  autoplaySpeed: 2000,
		  responsive: [
		    {
		      breakpoint: 1200,
		      settings: {
		        arrows: false,
		        centerMode: true,
		        centerPadding: '140px',
		        slidesToShow: 2
		      }
		    },
		    {
		      breakpoint: 800,
		      settings: {
		        arrows: false,
		        centerMode: true,
		        centerPadding: '90px',
		        slidesToShow: 1
		      }
		    }
		  ]
      });
    });
  })(jQuery);
</script>

</head>
<body>

<jsp:include page="../layout/header.jsp"/>
 
<div style="width: 100%; overflow: hidden; margin-top:100px">
  <img src="${pageContext.request.contextPath}/resources/images/background-image2.jpg" style="width: 100%; height: auto;">
</div>
  
  <div class="center-text">
	  <h1><b>포스축구아카데미는</b> 
	  <b class="custom-text">사랑+지도자의 노력</b><b>으로</b></h1><br>
	  <h3 style="letter-spacing: -2px;">210명의 아이들과 함께 하고 있습니다.</h3>
  </div>
  
  

  <div class="slide_div">
    <div>
        <img src="./resources/images/1.jpg" >
    </div>
    <div>
        <img src="./resources/images/2.jpg" >
    </div>
    <div>
        <img src="./resources/images/3.jpg" >
    </div>
    <div>
        <img src="./resources/images/4.jpg" >
    </div>
    <div>
        <img src="./resources/images/5.jpg" >
    </div>
    <div>
        <img src="./resources/images/6.jpg" >
    </div>
    <div>
        <img src="./resources/images/7.jpg" >
    </div>
    <div>
        <img src="./resources/images/8.jpg" >
    </div>				
  </div>
  
</body>
</html>
