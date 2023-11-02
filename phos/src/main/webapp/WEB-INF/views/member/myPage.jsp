<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>

<jsp:include page="../layout/header.jsp"/>

<div class="container" style="margin-top: 250px;">
  <form id="updateForm" action="${cpath}/member/update" method="post" onsubmit="return validateForm();" >
    
    <div class="form-group">
      <label for="name">이름</label>
      <input type="text" class="form-control" id="username" name="username" value="${mvo.username}">
    </div><br>
    
    <div class="form-group">
      <label for="email">이메일</label>
      <input type="text" class="form-control" value="${mvo.email}" disabled>
      <input type="hidden" name="email" value="${mvo.email}">
    </div><br>
    
    <div class="form-group">
      <label for="phone">휴대폰번호</label>
      <input type="text" class="form-control" id="phone" name="phone" value="${mvo.phone}">
    </div><br>
    
    <div class="form-group">
      <label for="birthdate">생년월일</label>
      <input type="text" class="form-control" id="birthdate" name="birthdate" value="${mvo.birthdate}">
      	<div id="error-message" style="color: red; font-size: 14px;"></div>
    </div><br>
    
     <div class="form-group">
      <label for="date">가입일자</label>
      <input type="text" class="form-control" value="${mvo.registrationDate}" disabled>
      <input type="hidden" name="registrationDate" value="${mvo.registrationDate}">
    </div><br>
    
    <button class="btn btn-primary">수정</button>
    <a class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#confirmModal">탈퇴</a>
  </form>
</div>

<!-- 탈퇴 확인 모달 대화상자 -->
<div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="confirmModalLabel">탈퇴 확인</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
      </div>
      <div class="modal-body">
        <form id="loginForm" action="${cpath}/member/delete" method="post">
          <div class="mb-3">
            <label for="email" class="form-label">이메일</label>
            <input type="text" class="form-control" name="email" required>
          </div>
          <div class="mb-3">
            <label for="password" class="form-label">비밀번호</label>
            <input type="password" class="form-control" name="password" required>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="submit" form="loginForm" class="btn btn-danger">탈퇴</button>
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
function deleteMember() {
	  $('#confirmModal').modal('show');
	}
	
	
function validateForm() {
    var username = document.getElementById("username").value;
    var phone = document.getElementById("phone").value;
    var birthdate = document.getElementById("birthdate").value;

    if (username === "" || phone === "" || birthdate === "") {
      alert("모든 항목을 입력하세요.");
      return false; 
    }
    return true; 
  }
 
//사용자가 입력한 값이 날짜 형식인지 확인하는 함수
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
    errorMessage.textContent = '*올바른 날짜 형식을 입력하세요 (예: 2010-01-01)';
    birthdateInput.value = '';
    birthdateInput.focus();
  } else {
    errorMessage.textContent = ''; // 오류 메시지를 지웁니다.
  }
});
</script>

</body>
</html>

