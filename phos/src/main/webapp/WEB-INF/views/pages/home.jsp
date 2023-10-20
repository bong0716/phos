<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
  <title>포스 축구 아카데미</title>
  <%@ include file="./include/homeCSS.jsp" %>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<jsp:include page="../layout/header.jsp"/>
 
<div style="width: 100%; overflow: hidden;">
  <img src="${pageContext.request.contextPath}/resources/images/background-image2.jpg" style="width: 100%; height: auto;">
</div>

<div class='tengah'>
  <h1>Memasang Blockquote (Catatan) dengan Efek Lipatan</h1></div>

<div class='note'>Memasang Blockquote (Catatan) dengan Efek Lipatan DenyListianto.com</div>
<div class='note orange'>
 Memasang Blockquote (Catatan) dengan Efek Lipatan DenyListianto.com
</div>
<div class='note river'>Memasang Blockquote (Catatan) dengan Efek Lipatan DenyListianto.com</div>
<div class='note crusta'>Memasang Blockquote (Catatan) dengan Efek Lipatan DenyListianto.com</div>

<div class='credit'>Design by. Deny Listianto</div>

<div style="width: 100%; overflow: hidden;">
  <img src="${pageContext.request.contextPath}/resources/images/background-image2.jpg" style="width: 100%; height: auto;">
</div>

</body>
</html>
