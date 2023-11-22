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
<body style="background-color: rgb(61,61,61)">
 <jsp:include page="../layout/header.jsp"/>
<h2 style="margin-top: 200px; color: rgb(227, 176, 4);"><b>1:1 문의</b></h2>
<div class="container" style="max-width: 50%; margin: 0 auto;">
  <div class="row">
    <div class="col-xs-12" >
      <table class="table table-bordered table-hover dt-responsive" id="boardT">
        <caption class="text-center" style="color: rgb(214, 166, 4);"> 전화주시면 더욱 빠른 상담 도와드리겠습니다! 📞 <span style="color: rgb(214, 166, 4);">010-0000-0000</span> </caption>
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
                <td style="text-align: center" colspan="4">등록된 1:1 문의가 없습니다.</td>
            </tr>
        </c:if>
         <c:if test="${!empty boardList}">
           <c:forEach var="boardList" items="${boardList}">
                    <tr>
	                   <td style="text-align: left"><a href="${cpath}/board/detail?no=${boardList.board_num}">${boardList.board_subject}</a></td>
	                   <td><fmt:formatDate value="${boardList.board_date}" pattern="yyyy-MM-dd HH:mm"/></td>
                       <c:choose>
			                <c:when test="${boardList.board_replyStatus}">
			                    <td style="color: green; text-align: right">답변완료</td>
			                </c:when>
			                <c:otherwise>
			                    <td style="color: #DE3030; text-align: right">답변대기</td>
			                </c:otherwise>
			            </c:choose>                        
                    </tr>                    
            </c:forEach> 
          </c:if>
        </tbody>
      </table>
    </div>
  </div>
</div>
<br>
<div class="centered-pagination">		
    <c:if test="${paging.startPage != 1 }">
        <a href="${cpath}/board/list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}" >&lt;</a>
    </c:if>
    <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
        <c:choose>
            <c:when test="${p == paging.nowPage }">
                <div class="page-number selected"><b>${p }</b></div>
            </c:when>
            <c:when test="${p != paging.nowPage }">
                <div class="page-number">
                    <a href="${cpath}/board/list?nowPage=${p }&cntPerPage=${paging.cntPerPage}" style="text-decoration: none;">${p }</a>
                </div>
            </c:when>
        </c:choose>
    </c:forEach>
    <c:if test="${paging.endPage != paging.lastPage}">
        <a href="${cpath}/board/list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
    </c:if>
</div>

<div class="container" style="max-width: 50%;">
<button class="btn btn-danger" id="showFormButton">문의하기</button>
<div class="container" id="registrationForm" style="display: none;">
    <hr style="border: 1px solid black;">
    <form id="BoardForm" action="${cpath}/board/list" method="post">
        <input type="hidden" name="board_user_email" value="${board_user_email}">
        <div class="form-group">
            <label for="title" >제목</label>
            <input type="text" class="form-control" name="board_subject" id="title">
        </div><br>
        <div class="form-group">
            <label for="content" >문의내용</label>
            <textarea class="form-control" name="board_content" rows="4" id="content"></textarea>
        </div><br>
        <button type="button" class="btn btn-warning" onclick="confirmRegistration()" style="margin : 0px 0px 40px 0px">등록</button>
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
	    var title = document.getElementById("title").value;
	    var content = document.getElementById("content").value;

	    if (title.trim() === '' || content.trim() === '') {
	        alert("제목과 문의내용을 모두 입력해주세요.");
	    } else {
	        var confirmed = confirm("문의하시겠습니까?");
	        if (confirmed) {
	            document.getElementById('BoardForm').submit();
	        }
	    }
	}
 
 
 function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="${cpath}/board/list?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
 </script>
 
 
 <style>
 
a {
  text-decoration: none;
  color: rgb(214, 166, 4);
  font-weight: bold;
}
 </style>
</body>
</html>