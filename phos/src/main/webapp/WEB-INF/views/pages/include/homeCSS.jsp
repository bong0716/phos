<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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