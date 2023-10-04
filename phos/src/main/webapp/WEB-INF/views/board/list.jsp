<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포스 게시판 - 1:1 문의</title>

<style>

body { 
  font-size: 140%; 
}

h2 {
  text-align: center;
  padding: 20px 0;
}

table caption {
  padding: .5em 0;
}

table.dataTable th,
table.dataTable td {
  white-space: nowrap;
}

table th {
    text-align: center;
}

table td {
    text-align: center;
}

.p {
  text-align: center;
  padding-top: 140px;
  font-size: 14px;
}

ol {
  counter-reset: li; /* Initiate a counter */
  margin: 40px auto; /* 수평 중앙 정렬을 위해 margin 속성을 수정 */
  padding: 0;
  font-family: sans-serif;
  width: 400px;
  text-align: center; /* 수평 중앙 정렬을 위해 text-align 속성을 추가 */
}

ol li {
  list-style: none; /* Disable the normal item numbering */
  position: relative; /* Create a positioning context */
  margin: 0 0 16px 0; /* 왼쪽 마진을 제거하여 수평 중앙 정렬 */
  padding: 6px 18px; /* Add some spacing around the content */
  background: rgba(221, 122, 129, 0.1);
  position: relative; /* Relative position for the li elements */
}

ol li:before {
  content: counter(li); /* Use the counter as content */
  counter-increment: li; /* Increment the counter by 1 */
  /* Position and style the number */
  position: absolute;
  top: -16px; /* 박스 왼쪽 모서리 윗부분에 위치 */
  left: -30px; /* 박스 왼쪽 모서리 윗부분에 위치 */
  box-sizing: border-box;
  width: 2em;
  margin-right: 8px;
  color: rgba(237, 65, 87, 1.00);
  font-weight: bold;
  font-family: "Helvetica Neue", Arial, sans-serif;
  font-size: 30px;
  text-align: center;
}


</style>
</head>
<body>

 <jsp:include page="../layout/header.jsp"/><br><br><br><br><br><br><br><br>
 
 
 <h2>1:1 문의</h2>

<div class="container">
  <div class="row">
    <div class="col-xs-12">
      <table summary="This table shows how to create responsive tables using Datatables' extended functionality" class="table table-bordered table-hover dt-responsive">
        <caption class="text-center">자세한 문의는 전화를 추천드립니다. 📞 <span style="color: blue;">010-0000-0000</span> </caption>
        <thead>
          <tr>
            <th>제목</th>
            <th>작성일</th>
            <th>답변상태</th>
          </tr>
        </thead>
        <tbody>
        <c:if test="${empty boardList}">
            <tr>
                <td colspan="4" style="text-align: center;">등록된 1:1 문의가 없습니다.</td>
            </tr>
        </c:if>
         <c:if test="${!empty boardList}">
           <c:forEach var="boardList" items="${boardList}">
                    <tr>
	                   <td><a href="${boardList.board_subject}" style="color: black;">${boardList.board_subject}</a></td>
	                   <td style="width: 20%;"><fmt:formatDate value="${boardList.board_date}" pattern="yyyy-MM-dd HH:mm"/></td>
                       <td style="width: 20%;">${board.board_replyStatus ? '답변완료' : '답변대기'}</td>            
                    </tr>                    
            </c:forEach> 
          </c:if>
        </tbody>
      </table>
      <button class="btn btn-primary" id="showFormButton">문의하기</button>
    </div>
  </div>
</div>
<br>
<div class="container" id="registrationForm" style="display: none;">
 <hr style="border: 2px solid black;">
  <form id="BoardForm" action="${cpath}/board/list" method="post">
    <div class="form-group">
      <label for="title">제목</label>
      <input type="text" class="form-control" name="title">
    </div><br>
    <div class="form-group">
      <label for="content">문의내용</label>
      <textarea class="form-control" name="content" rows="4"></textarea>
    </div><br>
    <button type="submit" class="btn btn-primary">등록</button>
  </form>
</div>


 
 <script>

 document.addEventListener("DOMContentLoaded", function () {
	    // 글 등록 버튼 클릭 시 이벤트 처리
	    document.getElementById("showFormButton").addEventListener("click", function () {
	      var registrationForm = document.getElementById("registrationForm");
	      if (registrationForm.style.display === "none" || registrationForm.style.display === "") {
	        registrationForm.style.display = "block"; // 폼을 보이게 함
	      } else {
	        registrationForm.style.display = "none"; // 폼을 숨김
	      }
	    });
	  })
	  
	   $('table').DataTable();
 </script>
 
</body>
</html>