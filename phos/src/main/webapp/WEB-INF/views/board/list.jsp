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
<%@ include file="./include/boardCSS.jsp" %>
<title>포스 게시판 - 1:1 문의</title>
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
	                   <td><a href="${cpath}/board/detail?no=${boardList.board_num}" style="color: black;">${boardList.board_subject}</a></td>
	                   <td style="width: 20%;"><fmt:formatDate value="${boardList.board_date}" pattern="yyyy-MM-dd HH:mm"/></td>
                       <td style="width: 20%;">${board.board_replyStatus ? '답변완료' : '답변대기'}</td>            
                    </tr>                    
            </c:forEach> 
          </c:if>
        </tbody>
      </table>
    </div>
  </div>
</div>
<br>
<div style="display: block; text-align: center;">		
    <c:if test="${paging.startPage != 1 }">
        <a href="${cpath}/board/list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
    </c:if>
    <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
        <c:choose>
            <c:when test="${p == paging.nowPage }">
                <div class="page-number selected"><b>${p }</b></div>
            </c:when>
            <c:when test="${p != paging.nowPage }">
                <div class="page-number">
                    <a href="${cpath}/board/list?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
                </div>
            </c:when>
        </c:choose>
    </c:forEach>
    <c:if test="${paging.endPage != paging.lastPage}">
        <a href="${cpath}/board/list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
    </c:if>
</div>

<div class="container">
<button class="btn btn-primary" id="showFormButton">문의하기</button>
<div class="container" id="registrationForm" style="display: none;">
    <hr style="border: 2px solid black;">
    <form id="BoardForm" action="${cpath}/board/list" method="post">
        <input type="hidden" name="board_user_email" value="${board_user_email}">
        <div class="form-group">
            <label for="title">제목</label>
            <input type="text" class="form-control" name="board_subject">
        </div><br>
        <div class="form-group">
            <label for="content">문의내용</label>
            <textarea class="form-control" name="board_content" rows="4"></textarea>
        </div><br>
        <button type="button" class="btn btn-primary" onclick="confirmRegistration()">등록</button>
    </form>
</div>
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
 
 function confirmRegistration() {
	    var confirmed = confirm("문의하시겠습니까?");
	    if (confirmed) {
	        document.getElementById('BoardForm').submit();
	    }
	}
 
 function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="${cpath}/board/list?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
 </script>
 
</body>
</html>