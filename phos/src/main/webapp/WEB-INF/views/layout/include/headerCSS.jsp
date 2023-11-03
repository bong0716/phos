<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

.navbar-nav {
  margin-left: auto; /* 왼쪽 여백을 오른쪽으로 밀어 네비게이션 항목을 오른쪽으로 정렬 */
}

.nav-item.dropdown:hover .dropdown-menu {
  display: block; /* 마우스를 올렸을 때 드롭다운 메뉴 표시 */
}

.navbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 8px 12px;
}

.navbar .nav-link:hover {
  color: rgb(168,168,168); 
}

.navbar__menu {
  list-style: none;
  display: flex;
  margin: 0;
  padding-left: 0;
  opacity: 1;
  
}

.navbar .nav-link {
  color: white;
  transition: color 0.1s;
}

.navbar__menu li {
  margin-right: 60px;
}

.navbar__toggleBtn {
  color: rgb(255,255,255);
  position: absolute;
  right: 15px;
  font-size: 30px;
  display: none;
}
  

@media screen and (max-width: 1100px) {

.navbar__menu {
  display: none;
  flex-direction: column;
  aligh-items: center;
  width: 100%;
}

.navbar__toggleBtn {
   display: block;
 }
 
}


</style>