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
<title>새 비밀번호 발급</title>
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
  <form action="${cpath}/member/pwNew" method="post" onsubmit="return validateForm();">
    <h1>새 비밀번호</h1>
    <input type="password" placeholder="새 비밀번호" name="password" id="password" style="width:300px" />
    <input type="password" placeholder="비밀번호 확인" name="password2" id="password2" style="width:300px" />
    <div id="error-message" style="color: red; font-size: 14px; "></div><br>
    <button type="submit">비밀번호 변경</button>
</form>
</div>

<script>
function validateForm() {
    var password1 = document.getElementById("password").value;
    var password2 = document.getElementById("password2").value;
    var errorMessage = document.getElementById("error-message");

    if (password1 !== password2) {
        errorMessage.textContent = "비밀번호가 서로 다릅니다.";
        return false; 
    } else {
        errorMessage.textContent = ""; 
        return true; 
    }
}
</script>

</body>
</html>