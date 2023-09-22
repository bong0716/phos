<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
  <title>포스 축구 아카데미</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
  
<style>

@import url(https://fonts.googleapis.com/css?family=Open+Sans:400,700);
body {
  background: #fff none repeat scroll top left;
  font-family: 'Open Sans', sans-serif;
  margin: 0;
  padding: 0;
  position: relative;
  line-height: normal;
}

a,
a:visited {
  color: #95a5a6;
  outline: none;
  text-decoration: none;
}

a:hover,
a:focus,
a:visited:hover {
  color: #bdc3c7;
  text-decoration: none;
}

.credit,
.tengah {
  margin: 1em auto;
  padding: .5em 1em;
  text-align: center;
  max-width: 500px;
  color: #95a5a6;
}

.tengah {
  font-weight: 700;
  font-size: 120%;
  max-width: 690px;
}

.note {
  position: relative;
  width: 40%;
  padding: 1.2em 1.5em;
  margin: 2em auto;
  color: #fff;
  background: #2ecc71;
  overflow: hidden
}

.note.orange {
  background: #f39c12;
}

.note.crusta {
  background: #F2784B;
}

.note.river {
  background: #3498db;
}

.note:before {
  content: "";
  position: absolute;
  top: 0;
  right: 0;
  border-width: 0 16px 16px 0;
  border-style: solid;
  border-color: #fff #fff #27ae60 #27ae60;
  background: #27ae60;
  box-shadow: 0 1px 1px rgba(0, 0, 0, 0.3), -1px 1px 1px rgba(0, 0, 0, 0.2);
  display: block;
  width: 0
}

.note.orange:before {
  border-color: #fff #fff #e67e22 #e67e22;
  background: #e67e22;
}

.note.crusta:before {
  border-color: #fff #fff #de6e45 #de6e45;
  background: #de6e45;
}

.note.river:before {
  border-color: #fff #fff #2980b9 #2980b9;
  background: #2980b9;
}

@media only screen and (max-width:768px) {
  position: relative;
  width: 70%;
}


}

</style>
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
