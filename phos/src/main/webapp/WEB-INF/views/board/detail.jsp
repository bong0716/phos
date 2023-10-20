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
  <hr style="border: 2px solid black;">
    <div class="form-group">
      <label for="title">제목</label>
      <input type="text" class="form-control" name="title" value="${data.board_subject}" readonly>
    </div><br>
    <div class="form-group">
      <label for="content">문의내용</label>
      <textarea class="form-control" name="content" rows="4" readonly>${data.board_content}</textarea>
    </div><br>
    <div class="form-group">
      <label for="response">답변</label>
      <textarea class="form-control" name="response" rows="4" readonly></textarea>
    </div><br>
    <a href="${cpath}/board/list" class="btn btn-primary">목록</a>
</div>

</body>
</html>