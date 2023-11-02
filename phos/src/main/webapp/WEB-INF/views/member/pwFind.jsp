<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${cpath}/resources/css/style.css"> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>

<body>
<nav class="navbar navbar-expand-sm">
 <div class="container-fluid">
 <a href="${pageContext.request.contextPath}/index" style="display: flex; align-items: center;">
   <img src="${pageContext.request.contextPath}/resources/images/logo.png" style="width:10%; height: auto;">
   <span class="navbar-brand" style="font-size: 20px; font-weight: bold; text-decoration: none; margin-left: 10px;">
    PHOS <span style="color: rgb(235,0,0); font-size: 17px;">SINCE 2004</span><br>
    FOOTBALL ACADEMY
</span>
 </a>
 </div>
</nav>
<div class="container">
  <form action="${cpath}/member/pwFind" method="post" >
    <h1>비밀번호 찾기</h1>
    <div class="social-container">
      <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
      <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
      <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
    </div>
    <span>or use your account</span>
    <input type="email" placeholder="이메일" name="email" style="width:300px" />
    <input type="text" placeholder="이름" name="username" style="width:300px" />
    <a href="${cpath}/member/login">로그인/회원가입</a>
    <button>비밀번호 찾기</button>
  </form>
</div>

 <c:if test="${!empty message}">
    <script>
        var message = "${message}";
        alert(message);
    </script>
</c:if>

</body>
</html>