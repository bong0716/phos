<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${cpath}/resources/css/style.css"> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
 <%@ include file="./include/signUpAndInFormCSS.jsp" %>
<title>로그인</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
  // 회원가입 버튼 클릭 시 폼 검증을 수행합니다.
  $('registerForm').submit(function(event) {
    // 입력 필드 중 하나라도 비어 있다면 경고 메시지를 표시하고 제출을 중단합니다.
    if ($('input[name="username"]').val() === "" ||
        $('input[name="email"]').val() === "" ||
        $('input[name="phone"]').val() === "" ||
        $('input[name="password"]').val() === "" ||
        $('input[name="birthdate"]').val() === "") {
      alert("모든 항목을 입력해주세요."); // 경고 메시지 표시
      event.preventDefault(); // 제출 중단
    }
  });
});

</script>

</head>
<body>
 <nav class="navbar navbar-expand-sm">
  <div class="container-fluid">
  <a href="${pageContext.request.contextPath}/index" style="display: flex; align-items: center;">
    <img src="${pageContext.request.contextPath}/resources/images/logo.png" style="width:10%; height: auto;">
    <span class="navbar-brand" style="font-size: 20px; font-weight: bold; text-decoration: none; margin-left: 10px;">
        PHOS<br>
        FOOTBALL ACADEMY
    </span>
  </a>
  </div>
 </nav>
  
<h2>로그인/회원가입</h2>
<div class="container" id="container">
  <div class="form-container sign-up-container">
    <form id="registerForm" action="${cpath}/member/register" method="post" >
      <h1>회원가입</h1>
      <div class="social-container">
        <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
        <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
        <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
      </div>
      <span>or use your email for registration</span>
      <input type="text" placeholder="이름" name="username" />
      <input type="email" placeholder="이메일" name="email" />
      <input type="text" placeholder="전화번호" name="phone" />
      <input type="password" placeholder="비밀번호" name="password"/>
      <input type="text" id="birthdate" placeholder="생년월일 (예: 2000-01-01)" name="birthdate" />
		<div id="error-message" style="color: red; font-size: 10px;"></div><br>
      <button>회원가입</button>
    </form>
  </div>
  
  
  <div class="form-container sign-in-container">
    <form action="${cpath}/member/login" method="post" >
      <h1>로그인</h1>
      <div class="social-container">
        <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
        <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
        <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
      </div>
      <span>or use your account</span>
      <input type="email" placeholder="이메일" name="email" />
      <input type="password" placeholder="비밀번호" name="password" />
      <a href="#">비밀번호를 잊어버리셨나요?</a>
      <button>로그인</button>
    </form>
  </div>
  <div class="overlay-container">
    <div class="overlay">
      <div class="overlay-panel overlay-left">
        <h1>반갑습니다!</h1>
        <p>회원가입 이력이 있으시다면 로그인을 해주세요.</p>
        <button class="ghost" id="signIn">로그인</button>
      </div>
      <div class="overlay-panel overlay-right">
        <h1>안녕하세요!</h1>
        <p>빛나는 포스 축구아카데미입니다.</p>
        <button class="ghost" id="signUp">회원가입</button>
      </div>
    </div>
  </div>
</div>

 <c:if test="${!empty message}">
    <script>
        var message = "${message}";
        alert(message);
    </script>
</c:if>

 
   <script>
        const signUpButton = document.getElementById('signUp');
        const signInButton = document.getElementById('signIn');
        const container = document.getElementById('container');

        signUpButton.addEventListener('click', () => {
            container.classList.add("right-panel-active");
        });

        signInButton.addEventListener('click', () => {
            container.classList.remove("right-panel-active");
        });
        
        
   		// 사용자가 입력한 값이 날짜 형식인지 확인하는 함수
        function isValidDate(dateString) {
          // 날짜 형식을 확인하는 정규 표현식
          var regex = /^\d{4}-\d{2}-\d{2}$/;
          return regex.test(dateString);
        }

        var birthdateInput = document.getElementById('birthdate');
        var errorMessage = document.getElementById('error-message');

        birthdateInput.addEventListener('blur', function() {
          var inputValue = birthdateInput.value;

          if (!isValidDate(inputValue)) {
            errorMessage.textContent = '올바른 날짜 형식을 입력하세요 (예: 2000-01-01)';
            birthdateInput.value = '';
            birthdateInput.focus();
          } else {
            errorMessage.textContent = ''; // 오류 메시지를 지웁니다.
          }
          
        });

    </script>
    
 
</body>
</html>