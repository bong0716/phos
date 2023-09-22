<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포스 게시판</title>

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



}


</style>
</head>
<body>

 <jsp:include page="../layout/header.jsp"/><br><br><br><br><br><br><br><br>
 
 
 <h2>Responsive Table with DataTables</h2>

<div class="container">
  <div class="row">
    <div class="col-xs-12">
      <table summary="This table shows how to create responsive tables using Datatables' extended functionality" class="table table-bordered table-hover dt-responsive">
        <caption class="text-center">An example of a responsive table based on <a href="https://datatables.net/extensions/responsive/" target="_blank">DataTables</a>:</caption>
        <thead>
          <tr>
            <th>Country</th>
            <th>Languages</th>
            <th>Population</th>
            <th>Median Age</th>
            <th>Area (Km²)</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>Argentina</td>
            <td>Spanish (official), English, Italian, German, French</td>
            <td>41,803,125</td>
            <td>31.3</td>
            <td>2,780,387</td>
          </tr>
          <tr>
            <td>Australia</td>
            <td>English 79%, native and other languages</td>
            <td>23,630,169</td>
            <td>37.3</td>
            <td>7,739,983</td>
          </tr>
          <tr>
            <td>Greece</td>
            <td>Greek 99% (official), English, French</td>
            <td>11,128,404</td>
            <td>43.2</td>
            <td>131,956</td>
          </tr>
          <tr>
            <td>Luxembourg</td>
            <td>Luxermbourgish (national) French, German (both administrative)</td>
            <td>536,761</td>
            <td>39.1</td>
            <td>2,586</td>
          </tr>
          <tr>
            <td>Russia</td>
            <td>Russian, others</td>
            <td>142,467,651</td>
            <td>38.4</td>
            <td>17,076,310</td>
          </tr>
          <tr>
            <td>Sweden</td>
            <td>Swedish, small Sami- and Finnish-speaking minorities</td>
            <td>9,631,261</td>
            <td>41.1</td>
            <td>449,954</td>
          </tr>
        </tbody>
        <tfoot>
          <tr>
            <td colspan="5" class="text-center">Data retrieved from <a href="http://www.infoplease.com/ipa/A0855611.html" target="_blank">infoplease</a> and <a href="http://www.worldometers.info/world-population/population-by-country/" target="_blank">worldometers</a>.</td>
          </tr>
        </tfoot>
      </table>
    </div>
  </div>
</div>

<p class="p">Demo by George Martsoukos. 
	<a href="http://www.sitepoint.com/responsive-data-tables-comprehensive-list-solutions" target="_blank">See article</a>.
</p>
 
 <ol>
  <li>First, you put 
  	<code><strong>counter-reset: li</strong></code> on your <code><strong>ol</strong></code>. This will initiate a counter.</li>
  <li>Second, remove the default list styles on your list by giving the 
  	<code><strong>list-style: none</strong></code> property to your<code> <strong>li</strong></code> element.</li>
  <li>You can then create a 
  	<code><strong>:before</strong></code> pseudo element for your <code><strong>li</strong></code>. This will be where the numbers now live.</li>
  <li>To use the counter you created earlier as your content, you will have to declare 
  	<code><strong>content:counter(li)</strong></code> inside your <code><strong>li:before</strong></code> element</li>
  <li>And, finally, increment the counter by giving your 
  	<code><strong>li:before</strong></code> this propery: <code><strong>counter-increment:li</strong></code></li>
  <li>Remember, you can style your list as you would any other pseudo-element! See the code for an example.</li>
<ol>
  
  <p>This was adapted from 
  	<a href="http://www.456bereastreet.com/archive/201105/styling_ordered_list_numbers/">456bereastreet</a>.
 
 
 
 <script>
 
 $('table').DataTable();

 
 </script>
 
</body>
</html>