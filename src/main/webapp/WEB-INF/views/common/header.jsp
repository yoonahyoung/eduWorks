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

<title>header</title>
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

<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 서머노트  -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<!-- suit 글꼴 -->
<link href="https://cdn.jsdelivr.net/gh/sunn-us/SUIT/fonts/static/woff2/SUIT.css" rel="stylesheet">

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
</style>
</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar" >

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
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
                        <a class="collapse-item" href="">출퇴근/근무내역관리</a>
                        <a class="collapse-item" href="">내 연차내역</a>
                        <a class="collapse-item" href="">내 인사정보</a>
                        <a class="collapse-item" href="">강사 관리</a>
                        <a class="collapse-item" href="">직원 관리</a>
                        <a class="collapse-item" href="">큰태 관리</a>
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
                        <a class="collapse-item" href="">부서 게시판</a>
                        <a class="collapse-item" href="">익명 게시판</a>
                        <a class="collapse-item" href="">자료실</a>
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
                        <a class="collapse-item" href="">메일 작성</a>
                        <a class="collapse-item" href="">보낸 메일함</a>
                        <a class="collapse-item" href="">받은 메일함</a>
                        <a class="collapse-item" href="">중요 메일함</a>
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
                        <a class="collapse-item" href="">전사 주소록</a>
                        <a class="collapse-item" href="">개인 주소록</a>
                        <a class="collapse-item" href="">학생 주소록</a>
                    </div>
                </div>
            </li>

            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsefive"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fa-solid fa-calendar-check"></i>
                    <span>캘린더</span>
                </a>
                
            </li>

            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsesix"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fa-solid fa-pen-to-square"></i>
                    <span>전자결재</span>
                </a>
                <div id="collapsesix" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">전자결재</h6>
                        <a class="collapse-item" href="">새 결재 진행</a>
                        <a class="collapse-item" href="">결재하기</a>
                        <a class="collapse-item" href="">개인 문서함</a>
                    </div>
                </div>
            </li>

            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseseven"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fa-solid fa-building-circle-check"></i>
                    <span>시설예약</span>
                </a>
                
            </li>
            
            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">
            
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
                        <a class="collapse-item" href="">강의 관리</a>
                        <a class="collapse-item" href="">학생 관리</a>
                    </div>
                </div>
            </li>
            
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
                        <a class="collapse-item" href="">상담 일정 관리</a>
                        <a class="collapse-item" href="">상담 내역 관리</a>
                    </div>
                </div>
            </li>
           
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

                    <!-- Topbar Search -->
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>

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
                                <form class="form-inline mr-auto w-100 navbar-search">
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
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell fa-fw"></i>
                                <!-- Counter - Alerts -->
                                <span class="badge badge-danger badge-counter">3+</span>
                            </a>
                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                                <h4 class="dropdown-header" style="font-size:medium">
                                    알람내역
                                </h4>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle" style="border:1px solid">
                                            <i class="fas fa-comments"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">2022-09-02</div>
                                        <!-- 미확인 된 알람일 경우 class에 font-weight-bold -->
                                        <span class="font-weight-bold">[진짜 재밌네요..]에 댓글이 달렸습니다.</span>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#" style="background-color:rgb(243, 243, 243);">
                                    <div class="mr-3">
                                        <div class="icon-circle" style="border:1px solid">
                                            <i class="fas fa-comments"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">2022-08-12</div>
                                        <!-- 확인된 알람일 경우 -->
                                        <span class="font-weight-bold">[결재 확인할 때 혹시..]에 댓글이 달렸습니다.</span>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#" style="background-color:rgb(243, 243, 243);">
                                    <div class="mr-3">
                                        <div class="icon-circle" style="border:1px solid yellow;">
                                            <span class="material-symbols-outlined" style="color:rgb(250, 71, 71); font-size: 24px;">E911_Emergency</span>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">2022-05-03</div>
                                        <span class="font-weight-bold">[어쩌라고 미친 ㅋㅋ장난하세요?] 글에 대한 신고 규제가 완료되었습니다.</span>
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                            </div>
                        </li>

                        <!-- Nav Item - Messages -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-envelope fa-fw"></i>
                                <!-- Counter - Messages -->
                                <span class="badge badge-danger badge-counter">7</span>
                            </a>
                            <!-- Dropdown - Messages  반복문 써서 메세지 select-->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="messagesDropdown">
                                <h6 class="dropdown-header">
                                    Message Center
                                </h6>

                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src=""
                                            alt="">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div class="font-weight-bold">
                                        <div class="text-truncate">Hi there! I am wondering if you can help me with a
                                            problem I've been having.</div>
                                        <div class="small text-gray-500">Emily Fowler · 58m</div>
                                    </div>
                                </a>
                                
                                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                            </div>
                        </li>

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">사무보조님</span>
                                <img class=""
                                    src="">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>
                </nav>
                <!-- End of Topbar -->
        
</body>
</html>