<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>

body { 
  font-size: 140%; 
}

a {
  text-decoration: none;
  color: rgb(255, 198, 4);
}

h2 {
  text-align: center;
  padding: 20px 0;
  color: rgb(255, 198, 4);
}

table caption {
  padding: .5em 0;
}


table.dataTable th,
table.dataTable td {
  white-space: nowrap;
}

#table th {
    text-align: center;
    color: rgb(227, 176, 4);
    background-color: rgb(61,61,61);
}

#table {
	background-color: rgb(61,61,61);
	border: 0.5px solid rgb(153, 119, 2);
}

#table td {
    text-align: center;
    color: rgb(153, 119, 2);
    background-color: rgb(61,61,61);
    width: 20%;
}

#table tr{
  background-color: rgb(61,61,61);
}

.p {
  text-align: center;
  padding-top: 140px;
  font-size: 14px;
  color: rgb(255, 198, 4);
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

.page-number {
     display: inline-block;
     padding: 5px 10px; /* 원하는 크기로 조정하세요 */
     border: 1px solid #333; /* 네모박스 테두리 스타일 및 색상 설정 */
 }

 .selected {
     background-color: #333; /* 선택된 숫자의 배경색 설정 */
     color: #fff; /* 선택된 숫자의 글꼴 색상 설정 */
 }
 
.centered-pagination {
  text-align: center;
  display: block;
}


</style>