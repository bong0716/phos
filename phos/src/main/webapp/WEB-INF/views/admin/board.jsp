<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="./include/adminBoardCSS.jsp" %>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>포스 관리자 페이지</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="shortcut icon" href="https://github.com/hyejinyoon20010716/phos/assets/119990564/570155ba-4b80-4712-905f-e87a99da5aa4">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
    <link rel="stylesheet" href="${cpath}/resources/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="${cpath}/resources/css/style2.css">
    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
    <link href="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/jqvmap@1.5.1/dist/jqvmap.min.css" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/weathericons@2.1.0/css/weather-icons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.css" rel="stylesheet" />


<script>
    $(document).ready(function() {
        $('.subjectLink').click(function(event) {
            event.preventDefault();
            const num = $(this).data('boardnum'); // 클릭된 요소의 data-boardNum 값 가져오기
            // AJAX 요청 보내기
            $.ajax({
                url: '${cpath}/admin/detail', 
                method: 'GET',
                data: { num: num }, 
                success: function(data) {
                    const { board_user_email, board_subject, board_content, board_date, reply_content, board_replyStatus } = data; 
                    
                    if (board_replyStatus) {
                        $('#replyBtn').hide();
                        $('#reply').prop('readonly', true);
                    } else {
                        $('#replyBtn').show();
                        $('#reply').prop('readonly', false);
                    }
                    
                    $('#writer').text(board_user_email);
                    $('#modalSubject').text(board_subject);
                    $('#content').text(board_content);
                    $('#reply').text(reply_content);

                    const date = new Date(board_date);

                    const year = date.getFullYear();
                    const month = ('0' + (date.getMonth() + 1)).slice(-2);
                    const day = ('0' + date.getDate()).slice(-2);
                    const hours = ('0' + date.getHours()).slice(-2);
                    const minutes = ('0' + date.getMinutes()).slice(-2);

                    const formattedDate =  year + '-' + month + '-' + day + ' ' + hours + ':' + minutes;

                    $('#date').text(formattedDate);
					
                    $('#boardNum').val(num)
                    $('#boardModal').modal('show');
                },
            });
        });
    });
    
    $(document).ready(function() {
        $('#replyBtn').click(function(event) {
            event.preventDefault(); 
            const confirmMessage = '답변을 저장하시겠습니까?';
            if (confirm(confirmMessage)) {
                $('#replyForm').submit(); // 확인을 누르면 답변 저장하기
            }
        });
    });
</script>
</head>

<body>
    <!-- Left Panel -->
    <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">
            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="index.html"><i class="menu-icon fa fa-laptop"></i>Dashboard </a>
                    </li>

                    <li class="menu-title">Extras</li><!-- /.menu-title -->
                    <li>
                    	 <a href="index.html"><i class="menu-icon fa fa-laptop"></i>게시판 관리 </a>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-glass"></i>페이지</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-sign-in"></i><a href="page-login.html">Login</a></li>
                            <li><i class="menu-icon fa fa-sign-in"></i><a href="page-register.html">Register</a></li>
                            <li><i class="menu-icon fa fa-paper-plane"></i><a href="pages-forget.html">Forget Pass</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside>
    <!-- /#left-panel -->
    <!-- Right Panel -->
    <div id="right-panel" class="right-panel">
        <!-- Header-->
        <header id="header" class="header">
            <div class="top-left">
                <div class="navbar-header">
                    <a class="navbar-brand" href="./"><img src="${cpath}/resources/images/logo.png" alt="Logo" style="width: 30px">PHOS ADMIN</a>
                    <a class="navbar-brand hidden" href="./"><img src="images/logo2.png" alt="Logo"></a>
                    <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
                </div>
            </div>
            <div class="top-right">
                <div class="header-menu">
                    <div class="header-left">
                        <button class="search-trigger"><i class="fa fa-search"></i></button>
                        <div class="form-inline">
                            <form class="search-form">
                                <input class="form-control mr-sm-2" type="text" placeholder="Search ..." aria-label="Search">
                                <button class="search-close" type="submit"><i class="fa fa-close"></i></button>
                            </form>
                        </div>

                        <div class="dropdown for-notification">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="notification" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-bell"></i>
                                <span class="count bg-danger">3</span>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="notification">
                                <p class="red">You have 3 Notification</p>
                                <a class="dropdown-item media" href="#">
                                    <i class="fa fa-check"></i>
                                    <p>Server #1 overloaded.</p>
                                </a>
                                <a class="dropdown-item media" href="#">
                                    <i class="fa fa-info"></i>
                                    <p>Server #2 overloaded.</p>
                                </a>
                                <a class="dropdown-item media" href="#">
                                    <i class="fa fa-warning"></i>
                                    <p>Server #3 overloaded.</p>
                                </a>
                            </div>
                        </div>

                        <div class="dropdown for-message">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="message" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-envelope"></i>
                                <span class="count bg-primary">4</span>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="message">
                                <p class="red">You have 4 Mails</p>
                                <a class="dropdown-item media" href="#">
                                    <span class="photo media-left"><img alt="avatar" src="images/avatar/1.jpg"></span>
                                    <div class="message media-body">
                                        <span class="name float-left">Jonathan Smith</span>
                                        <span class="time float-right">Just now</span>
                                        <p>Hello, this is an example msg</p>
                                    </div>
                                </a>
                                <a class="dropdown-item media" href="#">
                                    <span class="photo media-left"><img alt="avatar" src="images/avatar/2.jpg"></span>
                                    <div class="message media-body">
                                        <span class="name float-left">Jack Sanders</span>
                                        <span class="time float-right">5 minutes ago</span>
                                        <p>Lorem ipsum dolor sit amet, consectetur</p>
                                    </div>
                                </a>
                                <a class="dropdown-item media" href="#">
                                    <span class="photo media-left"><img alt="avatar" src="images/avatar/3.jpg"></span>
                                    <div class="message media-body">
                                        <span class="name float-left">Cheryl Wheeler</span>
                                        <span class="time float-right">10 minutes ago</span>
                                        <p>Hello, this is an example msg</p>
                                    </div>
                                </a>
                                <a class="dropdown-item media" href="#">
                                    <span class="photo media-left"><img alt="avatar" src="images/avatar/4.jpg"></span>
                                    <div class="message media-body">
                                        <span class="name float-left">Rachel Santos</span>
                                        <span class="time float-right">15 minutes ago</span>
                                        <p>Lorem ipsum dolor sit amet, consectetur</p>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="user-area dropdown float-right">
                        <a href="#" class="dropdown-toggle active" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img class="user-avatar rounded-circle" src="images/admin.jpg" alt="User Avatar">
                        </a>

                        <div class="user-menu dropdown-menu">
                            <a class="nav-link" href="#"><i class="fa fa- user"></i>My Profile</a>

                            <a class="nav-link" href="#"><i class="fa fa- user"></i>Notifications <span class="count">13</span></a>

                            <a class="nav-link" href="#"><i class="fa fa -cog"></i>Settings</a>

                            <a class="nav-link" href="#"><i class="fa fa-power -off"></i>Logout</a>
                        </div>
                    </div>

                </div>
            </div>
        </header>
        <!-- /#header -->
                
                <!-- Left Panel -->
			    <aside id="left-panel" class="left-panel">
			        <nav class="navbar navbar-expand-sm navbar-default">
			            <div id="main-menu" class="main-menu collapse navbar-collapse">
			                <ul class="nav navbar-nav">
			                    <li>
			                        <a href="index.html"><i class="menu-icon fa fa-laptop"></i>Dashboard </a>
			                    </li>
			
			                    <li class="menu-title">Extras</li><!-- /.menu-title -->
			                    <li>
			                    	 <a href="board"><i class="menu-icon fa fa-laptop"></i>게시판 관리 </a>
			                    </li>
			                    <li class="menu-item-has-children dropdown">
			                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-glass"></i>페이지</a>
			                        <ul class="sub-menu children dropdown-menu">
			                            <li><i class="menu-icon fa fa-sign-in"></i><a href="page-login.html">Login</a></li>
			                            <li><i class="menu-icon fa fa-sign-in"></i><a href="page-register.html">Register</a></li>
			                            <li><i class="menu-icon fa fa-paper-plane"></i><a href="pages-forget.html">Forget Pass</a></li>
			                        </ul>
			                    </li>
			                </ul>
			            </div><!-- /.navbar-collapse -->
			        </nav>
			    </aside>
			    
				<!-- Board -->
			    <div class="col-xs-12" >
			      <table class="table table-bordered table-hover dt-responsive" id="boardT">
			        <thead>
			          <tr>
			          	<th>작성자</th>
			            <th>제목</th>
			            <th>작성일</th>
			            <th>답변상태</th>
			          </tr>
			        </thead>
			        <tbody>
			        <c:if test="${empty boardList}">
			            <tr>
			                <td style="text-align: center" colspan="4">등록된 1:1 문의가 없습니다.</td>
			            </tr>
			        </c:if>
			         <c:if test="${!empty boardList}">
					    <c:forEach var="boardItem" items="${boardList}">
					        <tr>
					            <td>${boardItem.board_user_email}</td>
					            <td><a href="#" class="subjectLink" id="subjectLink" data-boardNum="${boardItem.board_num}">${boardItem.board_subject}</a></td>
					            <td><fmt:formatDate value="${boardItem.board_date}" pattern="yyyy-MM-dd HH:mm"/></td>
					            <c:choose>
					                <c:when test="${boardItem.board_replyStatus}">
					                    <td style="color: green;">답변완료</td>
					                </c:when>
					                <c:otherwise>
					                    <td style="color: #DE3030;">답변대기</td>
					                </c:otherwise>
					            </c:choose>            
					        </tr>                    
					    </c:forEach> 
					</c:if>
			        </tbody>
			      </table>
			    </div>
			<br>
			<div class="centered-pagination">		
			    <c:if test="${paging.startPage != 1 }">
			        <a href="${cpath}/admin/board?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}" >&lt;</a>
			    </c:if>
			    <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			        <c:choose>
			            <c:when test="${p == paging.nowPage }">
			                <div class="page-number selected"><b>${p }</b></div>
			            </c:when>
			            <c:when test="${p != paging.nowPage }">
			                <div class="page-number">
			                    <a href="${cpath}/admin/board?nowPage=${p }&cntPerPage=${paging.cntPerPage}" style="text-decoration: none;">${p }</a>
			                </div>
			            </c:when>
			        </c:choose>
			    </c:forEach>
			    <c:if test="${paging.endPage != paging.lastPage}">
			        <a href="${cpath}/admin/board?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
			    </c:if>
			</div>
		<!-- /Board -->
		
		<!-- 모달 창 -->
			<div id="boardModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="boardModalLabel" aria-hidden="true">
			    <div class="modal-dialog" role="document">
			        <div class="modal-content">
			            <div class="modal-header">
			                <h5 class="modal-title" id="boardModalLabel">답변 작성</h5>
			                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                    <span aria-hidden="true">&times;</span>
			                </button>
			            </div>
			            <div class="modal-body">
			                <!-- 여기에 게시글 내용을 나타낼 요소 추가 -->
			                <p>작성자: <span id="writer"></span></p>
			                <p>제목: <span id="modalSubject"></span></p>
			                <p>내용: <span id="content"></span></p>
			                <p>작성일: <span id="date"/></p>
			                <form id="replyForm" action="${cpath}/admin/reply" method="post">
			                	답변: <textarea id="reply" name="reply_content" style="width: 200px"></textarea>
			                	<input type="hidden" id="boardNum" name="board_num"/>
			                </form> 
			            </div>
			            <div class="modal-footer">
			            	<button id="replyBtn" class="btn btn-primary" data-dismiss="modal">완료</button>
			                <button type="submit" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			            </div>
			        </div>
			    </div>
			</div>
	   <!-- /모달 창 -->
	   
<style>
.modal-dialog {
    max-width: 40%;
    max-height: 100%; 
    top: 20%;
}

.modal-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #F2E232;
}
	
.modal-body form {
    display: flex;
    align-items: center;
}

.modal-body form textarea {
    flex: 1;
    width: auto;
    height: 120px;
    resize: none;
    margin-left: 10px; /* 기존 내용과 간격 조정 */
}

P {
color: #000000;
}
</style>
		
</body>
</html>
