<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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