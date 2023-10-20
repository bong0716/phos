<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <title>포스 축구 아카데미</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>

<body>

 <nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
  <div class="container-fluid">
  <a href="${pageContext.request.contextPath}/index" style="display: flex; align-items: center;">
    <img src="${pageContext.request.contextPath}/resources/images/logo.png" style="width:10%; height: auto; margin-left: 10px;">
    <span class="navbar-brand" style="font-size: 20px; font-weight: bold; text-decoration: none; margin-left: 10px;">
	    PHOS <span style="color: rgb(235,0,0); font-size: 17px;">SINCE 2004</span><br>
	    FOOTBALL ACADEMY
	</span>
  </a>
    <ul class="navbar-nav ms-auto"> <!-- navbar-nav에 ms-auto 추가하여 네비게이션 항목 오른쪽으로 정렬 -->
      <li class="nav-item dropdown" style="margin-right: 60px;">
        <a class="nav-link dropdown-toggle" href="#" id="introDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          소개
        </a>
        <div class="dropdown-menu" aria-labelledby="introDropdown">
          <a class="dropdown-item" href="/phos/facility">시설</a>
          <a class="dropdown-item" href="#">코치진</a>
          <a class="dropdown-item" href="#">연맹</a>
        </div>
      </li>
      <li class="nav-item dropdown" style="margin-right: 60px;">
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
      <li class="nav-item" style="margin-right: 60px;">
        <a class="nav-link" href="#">SNS</a>
      </li>
      <li class="nav-item dropdown" style="margin-right: 60px;">
        <a class="nav-link dropdown-toggle" href="#" id="Dropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          문의
        </a>
         <div class="dropdown-menu" aria-labelledby="Dropdown">
          <a class="dropdown-item" href="/phos/board/list">게시판</a>
        </div>
      </li>
      <li class="nav-item" style="margin-right: 60px;">
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
	          <a class="dropdown-item" href="#">마이페이지</a>
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
            <c:when test="${message == '로그아웃되었습니다.'}">
                // Do not perform history back for the specific message
            </c:when>
            <c:when test="${message == '회원가입이 완료되었습니다.'}">
            // Do not perform history back for the specific message
       		 </c:when>
            <c:otherwise>
                history.back();
            </c:otherwise>
        </c:choose>
    </script>
</c:if>


 <style>
  /* 추가적인 커스텀 스타일 */
  .navbar-nav {
    margin-left: auto; /* 왼쪽 여백을 오른쪽으로 밀어 네비게이션 항목을 오른쪽으로 정렬 */
  }

  .nav-item.dropdown:hover .dropdown-menu {
    display: block; /* 마우스를 올렸을 때 드롭다운 메뉴 표시 */
  }
  
   a {
        text-decoration: none; /* 링크의 밑줄 제거 */
    }
</style>
 
</body>
</html>
