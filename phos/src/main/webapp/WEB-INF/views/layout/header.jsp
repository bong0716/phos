<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <title>포스 축구 아카데미</title>
  <%@ include file="./include/headerCSS.jsp" %>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <link rel="shortcut icon" href="https://github.com/hyejinyoon20010716/phos/assets/119990564/570155ba-4b80-4712-905f-e87a99da5aa4">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
</head>

<body>
 <nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
	 <a href="#" class="navbar__toggleBtn">
	   <i class="fas fa-light fa-futbol"></i>
	 </a>
  <div class="container-fluid">
   <div class="navbar__logo">
    <a href="${pageContext.request.contextPath}/index" style="display: flex; align-items: center; text-decoration: none; ">
     <img src="${pageContext.request.contextPath}/resources/images/logo2.png" style="width:90%; height: auto; margin-left: 10px;">
    </a>
   </div>
    <ul class="navbar__menu"> 
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="introDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          소개
        </a>
        <div class="dropdown-menu" aria-labelledby="introDropdown">
          <a class="dropdown-item" href="/phos/facility">시설</a>
          <a class="dropdown-item" href="#">코치진</a>
          <a class="dropdown-item" href="#">연맹</a>
        </div>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="programDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          프로그램
        </a>
        <div class="dropdown-menu" aria-labelledby="programDropdown">
          <a class="dropdown-item" href="#">취미반</a>
          <a class="dropdown-item" href="#">대표반</a>
          <a class="dropdown-item" href="#">남성부</a>
          <a class="dropdown-item" href="#">여성부</a>
          <a class="dropdown-item" href="#">개인레슨</a>
          <a class="dropdown-item" href="#">기부반</a>
        </div>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="#">SNS</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="Dropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          문의
        </a>
         <div class="dropdown-menu" aria-labelledby="Dropdown">
          <a class="dropdown-item" href="/phos/board/list">게시판</a>
        </div>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="#">오시는 길</a>
      </li>
      
      <c:if test="${empty username}"> 
	      <li class="nav-item" style="margin-right: 30px;">
	        <a class="nav-link" href="/phos/member/login">
	           <i class="fas fa-user fa-lg" style="vertical-align: middle;"></i>
	        </a>
	      </li>
      </c:if>
      <c:if test="${!empty username}"> 
		    <li class="nav-item dropdown" style="margin-right: 30px;">
		   	<a class="nav-link dropdown-toggle" href="#" id="programDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          ${username}님
	        </a>
	        <div class="dropdown-menu" aria-labelledby="programDropdown">
	          <a class="dropdown-item" href="/phos/member/logout">로그아웃</a>
	          <a class="dropdown-item" href="/phos/member/myPage">마이페이지</a>
	          <sec:authorize access="hasRole('ADMIN')">
	          <a class="dropdown-item" href="/phos/admin/index">관리자페이지</a>
	          </sec:authorize>
	        </div>
		   </li>
	   </c:if>
    </ul>
  </div>
</nav> 

<c:if test="${!empty message}">
    <script>
        var message = "${message}";
        alert(message);
        <c:choose>
            <c:when test="${message == '로그아웃되었습니다.'}"></c:when>
            <c:when test="${message == '회원가입이 완료되었습니다.'}"></c:when>
	       <c:otherwise>
	                history.back();
	       </c:otherwise>
        </c:choose>
    </script>
</c:if>

</body>
</html>
