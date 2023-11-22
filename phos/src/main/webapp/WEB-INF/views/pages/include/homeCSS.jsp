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

img{
  width: 320px; 
  height: auto;
}

.center-text {
  text-align: center; 
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 50vh; 
}

.center-text h1 {
  margin: 0; 
  line-height: 1.4; 
  letter-spacing: -1px;
}

.custom-text {
  color: white; 
  background-color: rgb(255,192,23); 
  padding: 3px 1px; 
}

.slide_div {
  position: relative;
}

.slick-prev,
.slick-next {
    font-size: 0;
    position: absolute;
    bottom: 5px;
    color: #fff;
    border: 0;
    background: none;
    z-index: 1;
     top: 5px;
}
 
.slick-prev {
    left: 5%;
}
.slick-next {
    right: 5%;   
}
.slick-prev:before {
    content: '<';
}
.slick-next:before {
     content: ">";
}
 
.slick-prev:before, .slick-next:before {
    font-size: 30px;
    line-height: 2;
    opacity: .75;
    color: rgb(0,0,0);
}

</style>