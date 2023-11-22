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
<h2>1:1 문의</h2>

<div class="container" style="margin-top: 200px; max-width: 800px;">
    <div class="form-group">
      <label for="title">제목</label>
      <input type="text" class="form-control" name="title" value="${data.board_subject}" disabled>
    </div><br>
    <div class="form-group">
      <label for="content">문의내용</label>
      <textarea class="form-control" name="content" rows="4" disabled>${data.board_content}</textarea>
    </div><br>
    <div class="form-group">
      <label for="response">답변</label>
      <textarea class="form-control" name="response" rows="4" readonly>${data.reply_content}</textarea>
    </div><br>
    <a href="${cpath}/board/list" class="btn btn-warning">목록</a>
    <a href="${cpath}/board/delete?no=${data.board_num}" class="btn btn-secondary" onclick="confirmDelete(event)">삭제</a>
</div>

<script>
function confirmDelete(event) {
    event.preventDefault();
    var confirmed = confirm("삭제하시겠습니까?");

    if (confirmed) {
        window.location = event.target.href;
    }
}
</script>
</body>
</html>