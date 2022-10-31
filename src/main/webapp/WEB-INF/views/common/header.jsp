<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>EduWorks</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Custom fonts for this template-->
<link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	  rel="stylesheet">
	  
<!-- 구글 아이콘 CDN -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />


<!-- Custom styles for this template-->
<link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.css" rel="stylesheet" type="text/css">

<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/brands.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css">

<!-- fullcalender -->
<link href='${pageContext.request.contextPath}/resources/fullcalendar-5.6.0/packages/core/su_main.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/resources/fullcalendar-5.6.0/packages/daygrid/su_main.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/resources/fullcalendar-5.6.0/packages/timegrid/main.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/resources/fullcalendar-5.6.0/packages/list/main.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/resources/fullcalendar-5.6.0/packages/core/main.js'></script>
<script src='${pageContext.request.contextPath}/resources/fullcalendar-5.6.0/packages/interaction/main.js'></script>
<script src='${pageContext.request.contextPath}/resources/fullcalendar-5.6.0/packages/daygrid/main.js'></script>
<script src='${pageContext.request.contextPath}/resources/fullcalendar-5.6.0/packages/timegrid/main.js'></script>
<script src='${pageContext.request.contextPath}/resources/fullcalendar-5.6.0/packages/list/main.js'></script>
    
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 서머노트  -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<!-- suit 글꼴 -->
<link href="https://cdn.jsdelivr.net/gh/sunn-us/SUIT/fonts/static/woff2/SUIT.css" rel="stylesheet">
<!-- alert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<!-- sockJs -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<style>
    .container-fluid .menu-sidebar{
        width:15%;
        min-height: 100vh;
        border-right:2px solid lightgray;
        text-decoration: none;
    }

    .container-fluid .menu-sidebar h4{
        padding: 1rem;
        font-weight: 600;
    }

    .container-fluid .menu-sidebar h6{
        margin-left: 27px;
        padding: 0.3rem;
        color:black;
    }

    a:hover{
        text-decoration: none;
    }

    .menu-sidebar h6:hover{
        color:slategray;
    }

    .menu-sidebar{
        padding-top:20px;
    }

    .container-fluid{
		display:flex;
        padding-left:0px;
    }

    .insider{
        padding-left:20px;
		margin-bottom: 30px;
    }
    #wrapper #content-wrapper {
	  background-color: white !important;
	  width: 100%;
	  overflow-x: hidden;
	}
	#alert-area a:hover{
		cursor:pointer;
	}
	.rep-alarm:hover{
		cursor:default !important;
	}
</style>
</head>
	<c:if test="${ not empty alertMsg }">
		<script>
             Swal.fire({
                 icon: '${alertIcon}',
                 title: '${alertTitle}',
                 text: "${alertMsg}",
                 allowOutsideClick: false,
                 showConfirmButton: true,
                 showCancelButton: false,
                 closeOnConfirm: true,
                 closeOnCancel: true,
                 confirmButtonText: 'OK',
                 confirmButtonColor: 'slategray',
                 cancelButtonText: 'Cancel',
                 imageUrl: null,
                 imageSize: null,
                 timer: null,
                 customClass: '',
                 html: false,
                 animation: true,
                 allowEscapeKey: true,
                 inputType: 'text',
                 inputPlaceholder: '',
                 inputValue: '',
                 showLoaderOnConfirm: false
       		  });
		</script>
		<c:remove var="alertMsg" scope="session" />
		<c:remove var="alertTitle" scope="session" /> <!-- 일회성 메시지의 역할을 하기 위해 지워주기 -->
	</c:if>
	
	<body id="page-top">
	
	
	
	    <!-- Page Wrapper -->
	    <div id="wrapper">
	
	        <!-- Sidebar -->
	        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar" >
	
	            <!-- Sidebar - Brand -->
	            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="mainpage.me">
	                <div class="sidebar-brand-icon">
	                    <i class="fas fa-pencil-alt"></i>
	                </div>
	                <div class="sidebar-brand-text mx-3" style="margin-left: 5px !important">EduWorks</div>
	            </a>
	            
	            <!-- Divider -->
	            <hr class="sidebar-divider">
	
	            <!-- Heading -->
	            <div class="sidebar-heading" style="font-size:large">
	                MENU
	            </div>
	            <br>
	            <!-- Nav Item - Pages Collapse Menu -->
	            <li class="nav-item">
	                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
	                    aria-expanded="true" aria-controls="collapseTwo">
	                    <i class="fas fa-id-card"></i>
	                    <span>근태관리</span>
	                </a>
	                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
	                    <div class="bg-white py-2 collapse-inner rounded">
	                        <h6 class="collapse-header">근태 관리</h6>
	                        <a class="collapse-item" href="AttManage.me">출퇴근/근무내역관리</a>
	                        <a class="collapse-item" href="holiday.me">내 연차내역</a>
	                        <a class="collapse-item" href="info.me">내 인사정보</a>
	                        <c:if test="${ loginUser.deptCode eq 'D1' || loginUser.deptCode eq 'DN'}">
	                        <a class="collapse-item" href="list.te">강사 관리</a>
	                        <a class="collapse-item" href="list.em">직원 관리</a>
	                        <a class="collapse-item" href="select.at">근태 관리</a>
	                        </c:if>
	                    </div>
	                </div>
	            </li>
	
	            <!-- Nav Item - Utilities Collapse Menu -->
	            <li class="nav-item">
	                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
	                    aria-expanded="true" aria-controls="collapseUtilities">
	                    <i class="fa-solid fa-rectangle-list"></i>
	                    <span>게시판</span>
	                </a>
	                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
	                    data-parent="#accordionSidebar">
	                    <div class="bg-white py-2 collapse-inner rounded">
	                        <h6 class="collapse-header">게시판</h6>
	                        <a class="collapse-item" href="list.no">전사 공지</a>
	                        <a class="collapse-item" href="list.de">부서 게시판</a>
	                        <a class="collapse-item" href="list.bl">익명 게시판</a>
	                    </div>
	                </div>
	            </li>
	
	            <li class="nav-item">
	                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsethree"
	                    aria-expanded="true" aria-controls="collapseUtilities">
	                    <i class="fa-solid fa-envelope"></i>
	                    <span>메일</span>
	                </a>
	                <div id="collapsethree" class="collapse" aria-labelledby="headingUtilities"
	                    data-parent="#accordionSidebar">
	                    <div class="bg-white py-2 collapse-inner rounded">
	                        <h6 class="collapse-header">메일</h6>
	                        <a class="collapse-item" href="writeMailForm.ma">메일 작성</a>
	                        <a class="collapse-item" href="sendMailList.ma">보낸 메일함</a>
	                        <a class="collapse-item" href="receiveMailList.ma">받은 메일함</a>
	                        <a class="collapse-item" href="importantMailList.ma">중요 메일함</a>
	                    </div>
	                </div>
	            </li>

	            <li class="nav-item">
	                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsefour"
	                    aria-expanded="true" aria-controls="collapseUtilities">
	                    <i class="fa-solid fa-map-location-dot"></i>
	                    <span>주소록</span>
	                </a>
	                <div id="collapsefour" class="collapse" aria-labelledby="headingUtilities"
	                    data-parent="#accordionSidebar">
	                    <div class="bg-white py-2 collapse-inner rounded">
	                        <h6 class="collapse-header">주소록</h6>
	                        <a class="collapse-item" href="publicAddress.ad">전사 주소록</a>
	                        <a class="collapse-item" onclick="postFormSubmit('individualAddress.ad')">개인 주소록</a>
	                        <c:if test="${ loginUser.deptCode eq 'D2' || loginUser.deptCode eq 'DN'}">
	                        	<a class="collapse-item" href="listSt.ad">학생 주소록</a>
	                        </c:if>
	                        <c:if test="${ loginUser.deptCode eq 'D0'}">
	                        	<a class="collapse-item" href="listSt.te">학생 주소록</a>
	                        </c:if>
	                    </div>
	                </div>
	            </li>
	            
	            <form id="postForm" action="" method="post">
	            	
	            	<input type="hidden" name="memNo" value="${loginUser.memNo }">
	            
	            </form>
	            
	            <script>
	            	function postFormSubmit(url){
	            		$("#postForm").attr("action", url).submit();
	            	}
	            </script>
	
	            <li class="nav-item">
	                <a class="nav-link collapsed" onclick="postFormSubmit('list.ca');">
	                    <i class="fa-solid fa-calendar-check"></i>
	                    <span>캘린더</span>
	                </a>
	                
	            </li>
	
	            
	
	            <li class="nav-item">
	                <a class="nav-link collapsed" onclick="postFormSubmitH('reservationView.re')">
	                    <i class="fa-solid fa-building-circle-check"></i>
	                    <span>시설예약</span>
	                </a>
	                
	            </li>
	            
	             <form id="postFormH" action="" method="post">
	            	
	            	<input type="hidden" name="memNo" value="${loginUser.memNo }">
	            
	            </form>
	            
	            <script>
	            	function postFormSubmitH(url){
	            		$("#postFormH").attr("action", url).submit();
	            	}
	            </script>
	            
	            <c:if test="${ loginUser.deptCode eq 'D0' || loginUser.deptCode eq 'DN'}" >
		            <li class="nav-item">
		                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseten"
		                    aria-expanded="true" aria-controls="collapseUtilities">
		                    <i class="fas fa-regular fa-chalkboard-user"></i>
		                    <span>강의 관리</span>
		                </a>
		                <div id="collapseten" class="collapse" aria-labelledby="headingUtilities"
		                    data-parent="#accordionSidebar">
		                    <div class="bg-white py-2 collapse-inner rounded">
		                        <h6 class="collapse-header">강의 관리</h6>
		                        <a class="collapse-item" href="appAllList.cl">강의 개설신청</a>
		                        <a class="collapse-item" href="bookList.bk">교재관리</a>
		                    </div>
		                </div>
		            </li>
	            </c:if>
	            
	            <!-- Divider -->
	            <hr class="sidebar-divider d-none d-md-block">
	            
	            <c:if test="${ loginUser.deptCode eq 'D2' || loginUser.deptCode eq 'DN'}" >
		            <li class="nav-item">
		                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseeig"
		                    aria-expanded="true" aria-controls="collapseUtilities">
							<i class="fas fa-light fa-network-wired"></i>
		                    <span>행정 관리</span>
		                </a>
		                <div id="collapseeig" class="collapse" aria-labelledby="headingUtilities"
		                    data-parent="#accordionSidebar">
		                    <div class="bg-white py-2 collapse-inner rounded">
		                        <h6 class="collapse-header">행정 관리</h6>
		                        <a class="collapse-item" href="doneList.cl">강의 관리</a>
		                        <a class="collapse-item" href="list.rc">수강 신청 관리</a>
		                        <a class="collapse-item" href="reportList.ad">신고 관리</a>
		                    </div>
		                </div>
		            </li>
	            </c:if>
	            
	            <c:if test="${ loginUser.deptCode eq 'D3' || loginUser.deptCode eq 'DN'}" >
		            <li class="nav-item">
		                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsenine"
		                    aria-expanded="true" aria-controls="collapseUtilities">
		                    <i class="fas fa-light fa-rectangle-ad"></i>
		                    <span>홍보 관리</span>
		                </a>
		                <div id="collapsenine" class="collapse" aria-labelledby="headingUtilities"
		                    data-parent="#accordionSidebar">
		                    <div class="bg-white py-2 collapse-inner rounded">
		                        <h6 class="collapse-header">홍보 관리</h6>
		                        <a class="collapse-item" href="list.pr">홍보물 관리</a>
		                        <a class="collapse-item" href="list.cn">상담 일정 관리</a>
		                        <a class="collapse-item" href="list.tcn">상담 내역 관리</a>
		                    </div>
		                </div>
		            </li>
	           </c:if>
	            <!-- Sidebar Toggler (Sidebar) -->
	            <div class="text-center d-none d-md-inline">
	                <button class="rounded-circle border-0" id="sidebarToggle"></button>
	            </div>
	
	        </ul>
	        <!-- End of Sidebar -->
	
	        <!-- Content Wrapper -->
	        <div id="content-wrapper" class="d-flex flex-column">
	
	            <!-- Main Content -->
	            <div id="content">
	
	                <!-- Topbar -->
	                <nav class="navbar navbar-expand navbar-light bg-white topbar static-top" style="border-bottom: 2px solid rgba(0, 0, 0, .1);">
					
	                    <!-- Sidebar Toggle (Topbar) -->
	                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
	                        <i class="fa fa-bars"></i>
	                    </button>
	
	                    <!-- 전체검색 기능 -->
	                    <form action="allSearch.ma" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
	                        <div class="input-group">
	                            <input type="text" name="key" class="form-control bg-light border-0 small" placeholder="Search for..."
	                                aria-label="Search" aria-describedby="basic-addon2" value="${ key }" id="searchI">
	                            <div class="input-group-append">
	                                <button class="btn btn-primary" type="submit" id="search"> 
	                                    <i class="fas fa-search fa-sm"></i>
	                                </button>
	                            </div>
	                        </div>
	                    </form>
	                    <!-- socketAlert -->
						<div id="socket-alert" class="alert alert-primary fade show" role="alert" style="display:none; width:30%; float:left;" ></div>
	                    <!-- Topbar Navbar -->
	                    <ul class="navbar-nav ml-auto">
	
	                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
	                        <li class="nav-item dropdown no-arrow d-sm-none">
	                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
	                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                <i class="fas fa-search fa-fw"></i>
	                            </a>
	                            <!-- Dropdown - Messages -->
	                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
	                                aria-labelledby="searchDropdown">
	                                <form action="" class="form-inline mr-auto w-100 navbar-search">
	                                    <div class="input-group">
	                                        <input type="text" class="form-control bg-light border-0 small"
	                                            placeholder="Search for..." aria-label="Search"
	                                            aria-describedby="basic-addon2">
	                                        <div class="input-group-append">
	                                            <button class="btn btn-primary" type="button">
	                                                <i class="fas fa-search fa-sm"></i>
	                                            </button>
	                                        </div>
	                                    </div>
	                                </form>
	                            </div>
	                        </li>
	
	                        <!-- Nav Item - Alerts 알람 메뉴바 -->
	                        <li class="nav-item dropdown no-arrow mx-1" id="btnSend">
	                            <a class="nav-link dropdown-toggle xBtn" id="alertsDropdown" role="button"
	                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-bs-auto-close="outside">
	                                <i class="fas fa-bell fa-fw"></i>
	                                <!-- Counter - Alerts -->
	                                <span class="badge badge-danger badge-counter" id="alarm-count"></span>
	                            </a>
	                            <!-- Dropdown - Alerts -->
	                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in xDiv"
	                                aria-labelledby="alertsDropdown">
	                                <h4 class="dropdown-header" style="font-size:medium">
	                                    알람내역
	                                </h4>
	                                <div id="alert-area"  style="max-height:400px; overflow:auto;">
	                                <!-- 알람 뿌려지는 영역 -->
		                            
		                            	
	                                </div>
	                                
	                            </div>
	                        </li>
	
	
	                        <div class="topbar-divider d-none d-sm-block"></div>
	
	                        <!-- Nav Item - User Information -->
	                        <li class="nav-item dropdown no-arrow">
	                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
	                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                <img class="" src="${ loginUser.memProfile }" style="width:30px; height:30px;">&nbsp;&nbsp;
	                                <span class="mr-2 d-none d-lg-inline text-gray-600 small" style="font-size:17px;">${ loginUser.memName }</span>
	                            </a> 
	                            
	                            <!-- Dropdown - User Information -->
	                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
	                                aria-labelledby="userDropdown">
	                                <a class="dropdown-item" href="info.me">
	                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
	                                    Profile
	                                </a>
	                                <div class="dropdown-divider"></div>
	                                <a class="dropdown-item"  data-toggle="modal" data-target="#logoutModal">
	                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
	                                    Logout
	                                </a>
	                               
	                            </div>
	                        </li>
	
	                    </ul>
	                </nav>
	                <!-- End of Topbar -->
					
					 <!-- Logout Modal-->
				    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
				        aria-hidden="true">
				        <div class="modal-dialog" role="document">
				            <div class="modal-content">
				                <div class="modal-header">
				                    <h5 class="modal-title" id="exampleModalLabel">정말 로그아웃하시겠습니까?</h5>
				                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
				                        <span aria-hidden="true">×</span>
				                    </button>
				                </div>
				                <div class="modal-body">"예"를 누르시면 로그아웃이 됩니다.</div>
				                <div class="modal-footer">
				                    <button class="btn btn-secondary" type="button" data-dismiss="modal">아니오</button>
				                    <a class="btn btn-primary" href="logout.me" style="width:70px">예</a>
				                </div>
				            </div>
				        </div>
				    </div>
				    
        <script>
       	
			// websocket
			var socket = null;
		    $(document).ready(function (){
		    	selectAlarmList();
			    connectWs();
		    });
		    
		    
		   	function connectWs(){
			   
			    //var ws = new WebSocket("ws://localhost:8585/eduWorks/replyEcho");
			    ws = new SockJS("/eduWorks/replyEcho");
			    socket = ws;
			    ws.onopen = function() {
			        console.log('open');
			    }; 
			     
			    ws.onmessage = function(event){
				   console.log("onmessage"+event.data);
				    $("#socket-alert").html(event.data);
				    $("#socket-alert").css("display", "block");
				    
				    selectAlarmList(); // 알람 리스트 조회
				    setTimeout(function(){ $("#socket-alert").css("display", "none"); }, 3000);
			    };
					
			    ws.onclose = function(event) {
				    console.log("Info : connection closed.");
				    //setTimeout( function() { connectWs(); }, 1000); // retry connection 즉, 연결 재시도 하라는 뜻
			    }; 
				
			    ws.onerror = function(err) {console.log("Error : err")};
		    }
		   
		   
		    function selectAlarmList(){
				$.ajax({
					url:"select.al",
					data:{mno:${loginUser.memNo}},
					success(list){
						let value = "";
						let repValue = ""; // 신고알람용
						let count = 0;
						
						if(list.length != 0){ // 리스트가 있을 시
							// href용 변수
							let hrefB = 0;
						
							for(let i=0; i<list.length; i++){
								// 게시판 카테고리별 href지정
								switch(list[i].boardCategory){ 
								case 1: hrefB = 'detail.no?no=' + list[i].alBoardNo; break;
								case 2: hrefB = 'detail.de?no=' + list[i].alBoardNo; break;
								case 3: hrefB = 'detail.bl?no=' + list[i].alBoardNo; break;
								}
								
								if(list[i].alCategory == 1){ // 댓글 알람일 경우
									// 1. 블라인드 처리되거나 삭제된 게시글일 경우
									if(list[i].boardStatus != 'Y'){
										if(list[i].alReadDate != null){ // 1-1) 미확인 알람
											value += '<a class="dropdown-item d-flex align-items-center" onclick="readAlarm(1);" style="padding-right:0">';
											count+=1;
										}else{ // 1-2) 확인 알람
											value += '<a class="dropdown-item d-flex align-items-center" onclick="alert(존재하지 않는 게시글입니다!);" style="padding-right:0; background-color:rgb(243, 243, 243);">';
										}
									}else // 2. 확인된 알람
									if(list[i].alReadDate != null){
										value += '<a class="dropdown-item d-flex align-items-center" href="' + hrefB + '" style="padding-right:0; background-color:rgb(243, 243, 243);">';
									}else{ // 3. 미확인된 알람
										value += '<a class="dropdown-item d-flex align-items-center" onclick="readAlarm(&quot;' + hrefB + '&quot;, &quot;' + list[i].alNo + '&quot;);" style="padding-right:0;">';
										count+=1;
										}
				                    // 공통 요소
									value += '<div class="mr-3">'
		                                   		+ '<div class="icon-circle" style="border:1px solid">'
		                                       		+ '<i class="fa fa-comments fa-regular"></i>'
		                                  			+ '</div>'
		                              			+ '</div>'
		                              			+ '<div>'
		                                  			+ '<div class="small text-gray-500">' + list[i].alDate + '</div>'
		                                  			+ '<span class="font-weight-bold">' + list[i].alContent + ' (' + list[i].alCount + ')</span>'
		                              			+ '</div>'
		                               		+ '<span onclick="return false;"><button type="button" class="btn" onclick="deleteAlarm(&quot;' + list[i].alNo + '&quot;);"><span class="fas fa-x" style="font-size: 12px;"></span></button></span>'
		                          			+ '</a>';
								}else{ // 신고 알람일 경우
									value += '<a class="dropdown-item d-flex align-items-center rep-alarm" style="padding-right:0;">'
											 + '<div class="mr-3">'
	                                  			+ '<div class="icon-circle" style="border:1px solid yellow;">'
	                                      			+ '<span class="material-symbols-outlined" style="color:rgb(250, 71, 71); font-size: 24px;">E911_Emergency</span>'
	                                 			+ '</div>'
	                             			+ '</div>'
	                             			+ '<div>'
	                                 			+ '<div class="small text-gray-500">' + list[i].alDate + '</div>'
	                                 			+ '<span class="font-weight-bold">' + list[i].alContent + '</span>'
	                             			+ '</div>'
	                              			+ '<span onclick="return false;"><button type="button" class="btn" onclick="deleteAlarm(&quot;' + list[i].alNo + '&quot;);"><span class="fas fa-x" style="font-size: 12px;"></span></button></span>'
	                         			 + '</a>';
								}
								
							}
							
							$("#alert-area").html(value);
							$("#alarm-count").html(count);
							if(count == 0){
								$("#alarm-count").css("display", "none");
							}
							
						}else{ // 리스트가 없을 시
							value += '<div style="height:100px;"><h5 style="line-height: 100px;text-align: center;color: black;font-weight: 500;">알람 내역이 없습니다</h5></div>';
							$("#alert-area").html(value);
						}
					},error(){
						console.log("ajax통신 실패");
					}
				})
			}
		    
		    // 알람 읽음 처리
		    function readAlarm(hrefB, alNo){
		    	
		    	$.ajax({
		    		url:"read.al",
		    		data:{alNo:alNo},
		    		success(result){
		    			// 해당 글 상세 화면으로 이동
		    			location.href = hrefB;
		    		},error(){
		    			console.log("ajax통신 실패");
		    		}
		    	})
		    } 
		    
		    // 알람 지워지기
		    function deleteAlarm(alNo){
		    	$.ajax({
		    		url:"delete.al",
		    		data:{alNo:alNo},
		    		success(result){
		    			selectAlarmList();
		    		},error(){
		    			console.log("ajax통신 실패");
		    		}
		    	})
		    }
		</script>
		
		
		
</body>
</html>