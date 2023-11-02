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
<title>인증번호</title>
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
  <form action="${cpath}/member/pwAuth" method="post" >
  <input type="hidden" name ="num" value="${num}">
  <input type="hidden" name ="email" value="${email}">
    <h1>인증번호 입력</h1>
  	  <input type="text" placeholder="인증번호" name="authNum" style="width:300px" />
    <button>확인</button>
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