<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css -->
<link href="${pageContext.request.contextPath}/resources/css/schedule.css" rel="stylesheet" type="text/css">

</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
	<div style="display: flex">
    <!-- sub menu -->
    <div class="container-fluid su_content_body su_sub_menu_div" style="width: 15%;">
        <nav class="menu-sidebar" style="width: 100%;">
            <div class="insider">
                <h4 style="color: black;">캘린더</h4>

                <div class="su_btn_center">
                    <button type="button" class="btn btn-lg su_btn_border" style="width: 80%;">일정 등록</button>
                </div>
                <br>


                <!-- 서브메뉴 내 캘린더 -->
                <ul class="accordion" id="accordionSidebar" >
                    <li class="su_sub_menu_item">
                        
                        <!-- 변경 버튼 클릭 전 -->
                        <span class="fas fa-pen pen_icon dis_bl" id="pen1"></span>

                        <!-- 변경버튼 클릭 후 -->
                        <div class="dis_no" id="nopen1">
                            <span class="fas fa-xmark pen_icon" id="x1"></span>
                            <span class="fas fa-check pen_icon" id="check1">&nbsp;</span>
                        </div>
                        
                        <div class="collapsed su_sub_menu_list" style="width:70%;" data-toggle="collapse" data-target="#myCalendar" aria-expanded="true" aria-controls="collapseTwo">
                            <span>&nbsp;내 캘린더</span>
                        </div>

                        
                    

                        <div id="myCalendar" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                            <table>
                                <tr style="width: 100%;">
                                    <td width="20%;"></td>
                                    <td><input type="checkbox"></td>
                                    <td width="90%;"> &nbsp;내 일정</td>
                                    <!-- 기본은 색상 편집 눌렀을 때 x -->
                                    <td class="su_myCalBasic">
                                        <a type="button">
                                            <div class="calColor" style="border: 1px solid red; background: red;"></div>
                                        </a>
                                    </td>

                                    <td class="su_myCalX dis_no"><a type="button">x</a></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><input type="checkbox"></td>
                                    <td> &nbsp;부서 일정</td>
                                    <!-- 기본은 색상 편집 눌렀을 때 x -->
                                    <td class="su_myCalBasic">
                                        <a type="button">
                                            <div class="calColor" style="border: 1px solid red; background: red;"></div>
                                        </a>
                                    </td>

                                    <td class="su_myCalX dis_no"><a type="button">x</a></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><input type="checkbox"></td>
                                    <td> &nbsp;연차</td>
                                    <!-- 기본은 색상 편집 눌렀을 때 x -->
                                    <td class="su_myCalBasic">
                                        <a type="button">
                                            <div class="calColor" style="border: 1px solid red; background: red;"></div>
                                        </a>
                                    </td>

                                    <td class="su_myCalX dis_no"><a type="button">x</a></td>
                                </tr>
                            </table>
                            
                            <a type="button" class="addCal" data-toggle="modal" data-target="#addMyCal">+ 내 캘린더 추가</a>
                        </div>
                    </li>
                </ul>

                <!-- 내 캘린더 추가 모달창 -->
                <div class="modal fade" id="addMyCal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
                        <!--Content-->
                        <div class="modal-content modal_alert">
            
                            <!--Body-->
                            <div class="modal-body text-center modal_alert_child">
            
                                <h5 class="mt-1 mb-2">내 캘린더 추가</h5>
                                <br>
            
                                <div class="md-form ml-0 mr-0">
                                    <input type="password" id="inputpwd"
                                        class="form-control form-control-sm validate ml-0">
                                    <div id="outputResult"></div>
                                </div>
            
                                <div class="text-center mt-4">
                                    <button type="button" id="insertMyCal" class="btn su_btn_all su_btn_medium">확인</button>
                                    <button type="button" class="btn su_btn_border su_btn_medium" data-dismiss="modal">취소</button>
                                </div>
                                
                            </div>
            
                        </div>
                    </div>
                </div>

                <!-- 서브메뉴 관심 캘린더 -->
                <ul class="accordion" id="accordionSidebar" >
                    <li class="su_sub_menu_item">

                        <!-- 변경 버튼 클릭 전 -->
                        <span class="fas fa-pen pen_icon dis_bl" id="pen2"></span>

                        <!-- 변경버튼 클릭 후 -->
                        <div class="dis_no" id="nopen2">
                            <span class="fas fa-xmark pen_icon" id="x1"></span>
                            <span class="fas fa-check pen_icon" id="check1">&nbsp;</span>
                        </div>

                        <div class="collapsed su_sub_menu_list" style="width:70%;" data-toggle="collapse" data-target="#attCalendar" aria-expanded="true" aria-controls="collapseTwo">
                            <span>&nbsp;관심 캘린더</span>
                        </div>

                        <div id="attCalendar" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                            <table>
                                <tr style="width: 100%;">
                                    <td width="20%;"></td>
                                    <td><input type="checkbox"></td>
                                    <td width="90%;"> &nbsp;이승엽 대표</td>
                                    <!-- 기본은 색상 편집 눌렀을 때 x -->
                                    <td class="su_attCalBasic">
                                        <a type="button">
                                            <div class="calColor" style="border: 1px solid red; background: red;"></div>
                                        </a>
                                    </td>

                                    <td class="su_attCalX dis_no"><a type="button">x</a></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><input type="checkbox"></td>
                                    <td> &nbsp;강보람 부장</td>
                                    <!-- 기본은 색상 편집 눌렀을 때 x -->
                                    <td class="su_attCalBasic">
                                        <a type="button">
                                            <div class="calColor" style="border: 1px solid red; background: red;"></div>
                                        </a>
                                    </td>

                                    <td class="su_attCalX dis_no"><a type="button">x</a></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><input type="checkbox"></td>
                                    <td> &nbsp;박대리 대리</td>
                                    <!-- 기본은 색상 편집 눌렀을 때 x -->
                                    <td class="su_attCalBasic">
                                        <a type="button">
                                            <div class="calColor" style="border: 1px solid red; background: red;"></div>
                                        </a>
                                    </td>

                                    <td class="su_attCalX dis_no"><a type="button">x</a></td>
                                </tr>
                            </table>
                            
                            <a type="button" class="addCal" id="addAttCal">+ 관심 캘린더 추가</a>
                        </div>
                    </li>
                </ul>

                <!-- 관심 캘린더 추가 창 -->
                <div class="su_ph_div draggable dis_no" id="attCalList">
                    <div class="su_ph_header">
                        <h5 class="mt-1 mb-2" style="text-align: center" id="moveCal">관심 캘린더 추가<span class="fas fa-xmark" id="xBtn" style="cursor: pointer;"></span></h5>
                        <div style="text-align: center;">
                            <input type="text" name="suPhKeyword" placeholder="이름/부서/직위/직책">
                            <button type="button" class="su_btn_border btn-sm">검색</button>
                        </div>
                    </div>
                    
                    <hr class="hr_line">

                    <div class="su_ph_body">
                        <div class="div_left_line" style="margin-top: -1rem;">
                            <div class="su_ph_line" id="ceo">
                                <span style="font-size: 20px;">&nbsp;</span>
                                <span class="fas fa-user"></span>
                                <span>&nbsp; 이승엽 대표</span>
                            </div>

                            <!-- 강사진 주소록 -->
                            <div class="su_ph_line">
                                <div class="collapsed ph_padding" data-toggle="collapse" data-target="#teacherList" aria-expanded="true" aria-controls="collapseTwo">
                                    <span style="font-size: 20px;">-&nbsp;</span>
                                    <span style="font-size: 20px;">+&nbsp;</span>
                                    <span>&nbsp; 강사진</span>
                                </div>

                                <div id="teacherList" class="collapse div_left_line" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                                    <table>
                                        <tr style="width: 100%;" class="ph_padding">
                                            <td width="90%;">
                                                <div class="su_ph_line">
                                                    <span style="font-size: 20px;">-&nbsp;</span>
                                                    <span class="fas fa-user"></span>
                                                    <span>&nbsp; 강보람 강사님</span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="su_ph_line" class="ph_padding">
                                                    <span style="font-size: 20px;">-&nbsp;</span>
                                                    <span class="fas fa-user"></span>
                                                    <span>&nbsp; 나강사 강사님</span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="su_ph_line" class="ph_padding">
                                                    <span style="font-size: 20px;">-&nbsp;</span>
                                                    <span class="fas fa-user"></span>
                                                    <span>&nbsp; 도강사 강사님</span>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>

                            <!-- 운영부 주소록 -->
                            <div class="su_ph_line">
                                <div class="collapsed ph_padding" data-toggle="collapse" data-target="#opList" aria-expanded="true" aria-controls="collapseTwo">
                                    <span style="font-size: 20px;">-&nbsp;</span>
                                    <span style="font-size: 20px;">+&nbsp;</span>
                                    <span>&nbsp; 운영부</span>
                                </div>

                                <div id="opList" class="collapse div_left_line" aria-expanded="true" data-parent="#accordionSidebar">
                                    <div class="collapsed ph_padding" data-toggle="collapse" data-target="#promoList" aria-expanded="true" aria-controls="collapseTwo">
                                        <span style="font-size: 20px;">-&nbsp;</span>
                                        <span style="font-size: 20px;">+&nbsp;</span>
                                        <span>&nbsp; 홍보팀</span>
                                    </div>

                                    <!-- 홍봉팀 리스트 -->
                                <div id="promoList" class="collapse div_left_line" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                                    <table>
                                        <tr style="width: 100%;" class="ph_padding">
                                            <td width="90%;">
                                                <div class="su_ph_line">
                                                    <span style="font-size: 20px;">-&nbsp;</span>
                                                    <span class="fas fa-user"></span>
                                                    <span>&nbsp; 강부장 부장</span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="su_ph_line" class="ph_padding">
                                                    <span style="font-size: 20px;">-&nbsp;</span>
                                                    <span class="fas fa-user"></span>
                                                    <span>&nbsp; 나대리 대리</span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="su_ph_line" class="ph_padding">
                                                    <span style="font-size: 20px;">-&nbsp;</span>
                                                    <span class="fas fa-user"></span>
                                                    <span>&nbsp; 도사원 사원</span>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>

                                    <div class="collapsed ph_padding" data-toggle="collapse" data-target="#adminiList" aria-expanded="true" aria-controls="collapseTwo">
                                        <span style="font-size: 20px;">-&nbsp;</span>
                                        <span style="font-size: 20px;">+&nbsp;</span>
                                        <span>&nbsp; 행정팀</span>
                                    </div>

                                    <!-- 행정팀 리스트 -->
                                <div id="adminiList" class="collapse div_left_line" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                                    <table>
                                        <tr style="width: 100%;" class="ph_padding">
                                            <td width="90%;">
                                                <div class="su_ph_line">
                                                    <span style="font-size: 20px;">-&nbsp;</span>
                                                    <span class="fas fa-user"></span>
                                                    <span>&nbsp; 강부장 부장</span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="su_ph_line" class="ph_padding">
                                                    <span style="font-size: 20px;">-&nbsp;</span>
                                                    <span class="fas fa-user"></span>
                                                    <span>&nbsp; 나대리 대리</span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="su_ph_line" class="ph_padding">
                                                    <span style="font-size: 20px;">-&nbsp;</span>
                                                    <span class="fas fa-user"></span>
                                                    <span>&nbsp; 도사원 사원</span>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>

                                </div>

                                
                            <!-- 인사팀 주소록 -->
                            <div class="su_ph_line">
                                <div class="collapsed ph_padding" data-toggle="collapse" data-target="#hrList" aria-expanded="true" aria-controls="collapseTwo">
                                    <span style="font-size: 20px;">-&nbsp;</span>
                                    <span style="font-size: 20px;">+&nbsp;</span>
                                    <span>&nbsp; 인사팀</span>
                                </div>

                                <div id="hrList" class="collapse div_left_line" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                                    <table>
                                        <tr style="width: 100%;" class="ph_padding">
                                            <td width="90%;">
                                                <div class="su_ph_line">
                                                    <span style="font-size: 20px;">-&nbsp;</span>
                                                    <span class="fas fa-user"></span>
                                                    <span>&nbsp; 강부장 부장</span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="su_ph_line" class="ph_padding">
                                                    <span style="font-size: 20px;">-&nbsp;</span>
                                                    <span class="fas fa-user"></span>
                                                    <span>&nbsp; 나대리 대리</span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="su_ph_line" class="ph_padding">
                                                    <span style="font-size: 20px;">-&nbsp;</span>
                                                    <span class="fas fa-user"></span>
                                                    <span>&nbsp; 도사원 사원</span>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <script>
                    $(document).ready(function(){
                        // 내/관심 캘린더 수정, 취소버튼 클릭시 보여지는 부분
                        $("#pen1").click(function(){
                            $("#nopen1").show();
                            $("#pen1").hide();
                            $(".su_myCalBasic").hide();
                            $(".su_myCalX").show();
                        });

                        $("#nopen1").click(function(){
                            $("#pen1").show();
                            $("#nopen1").hide();
                            $(".su_myCalBasic").show();
                            $(".su_myCalX").hide();
                        });

                        $("#pen2").click(function(){
                            $("#nopen2").show();
                            $("#pen2").hide();
                            $(".su_attCalBasic").hide();
                            $(".su_attCalX").show();
                        });

                        $("#nopen2").click(function(){
                            $("#pen2").show();
                            $("#nopen2").hide();
                            $(".su_attCalBasic").show();
                            $(".su_attCalX").hide();
                        });

                        $("#addAttCal").click(function(){
                            $("#attCalList").show();
                        })

                        $("#xBtn").click(function(){
                            $("#attCalList").hide();
                        });

                        // 내/관심캘린더 기본/수정 상태에 따른 설정
                        if( $("#pen1").is(":visible")){

                        }

                        // 위치 드래그 기능
                        //Make the DIV element draggagle:
                        dragElement(document.getElementById("attCalList"));

                        function dragElement(elmnt) {
                        var pos1 = 210, pos2 = 0, pos3 = 0, pos4 = 450;
                        if (document.getElementById(elmnt.id + "header")) {
                            /* if present, the header is where you move the DIV from:*/
                            document.getElementById(elmnt.id + "header").onmousedown = dragMouseDown;
                        } else {
                            /* otherwise, move the DIV from anywhere inside the DIV:*/
                            elmnt.onmousedown = dragMouseDown;
                        }

                        function dragMouseDown(e) {
                            e = e || window.event;
                            e.preventDefault();
                            // get the mouse cursor position at startup:
                            pos3 = e.clientX;
                            pos4 = e.clientY;
                            document.onmouseup = closeDragElement;
                            // call a function whenever the cursor moves:
                            document.onmousemove = elementDrag;
                        }

                        function elementDrag(e) {
                            e = e || window.event;
                            e.preventDefault();
                            // calculate the new cursor position:
                            pos1 = pos3 - e.clientX;
                            pos2 = pos4 - e.clientY;
                            pos3 = e.clientX;
                            pos4 = e.clientY;
                            // set the element's new position:
                            elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
                            elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
                        }

                        function closeDragElement() {
                            /* stop moving when mouse button is released:*/
                            document.onmouseup = null;
                            document.onmousemove = null;
                        }
                        }
                    });
                </script>

                <hr class="hr_line" style="margin-top: 3rem; margin-bottom: 2rem;">

                <!-- 회사 캘린더 -->
                <div class="su_sub_menu_item">
                    <table>
                        <tr style="width: 100%;">
                            <td width="30%;"></td>
                            <td><input type="checkbox"></td>
                            <td> &nbsp;전사 일정</td>
                            <td width="15%"></td>
                            <!-- 기본은 색상 편집 눌렀을 때 x -->
                            <td>
                                <a type="button">
                                    <!-- 색상 컬럼도 추가하자 -->
                                    <div class="calColor" style="border: 1px solid red; background: red;"></div>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="checkbox"></td>
                            <td> &nbsp;임원 일정</td>
                            <td></td>
                            <td>
                                <a type="button">
                                    <!-- 색상 컬럼도 추가하자 -->
                                    <div class="calColor" style="border: 1px solid red; background: red;" onclick="colorChange();"></div>
                                </a>
                            </td>
                        </tr>
                    </table>
                </div>

                <!-- 캘린더 관리 페이지로 이동 -->
                <br>
                    <a href="manage.ca" class="su_sub_menu_list" style="color: black;">
                        <h6><span class="fas fa-fw fa-cog"></span> &nbsp;캘린더 관리</h6>
                    </a>
                    <!-- <a href=""><h6>항목</h6></a> -->


                <br><br>

                <!-- 색상 팔레트 -->
                <div class="colorPal dis_no" id="colorPal">
                    <input type="color" id="colorArea">
                    <button type="button" class="btn btn-sm su_btn_border">변경</button>
                </div>


                <script>
                    $(document).ready(function(){
                        $(".calColor").click(function(){
                            if( $("#colorPal").hasClass("dis_no") ){
                                $("#colorPal").addClass("dis_bl");
                                $("#colorPal").removeClass("dis_no");
                            } else {
                                $("#colorPal").addClass("dis_no");
                                $("#colorPal").removeClass("dis_bl");
                            }
                        });

                        // 색상 컬럼 값 입력해주기 (#~~~)
                        $("#colorArea").val("#");

                        function colorChange(){
                            document.getElementById("area1").style.backgroundColor = document.getElementById("color").value;
                        }

                    })
                </script> 
  
            </div>
                                
        </nav>
    </div>

    <!-- ============================================================================================================ -->
    
    <div class="su_contentArea" style="width: 85%;">
        <div class="su_content_header">
            <h2 class="su_sub_menu_name" style="color: black;">캘린더 관리</h2>

            <br><br><br>

            <h4 class="su_sub_menu_name">&nbsp;내 캘린더</h4>

            <hr class="hr_line">

            <div class="su_content_body">

                <br><br>

                <div style="text-align: center">
                    <input type="text" style="width: 300px;" name="suPhKeyword" placeholder="캘린더 이름">
                    <button type="button" class="su_btn_border btn-sm su_btn_search">검색</button>
                </div>

                

                <div class="selectOption su_btn_area" align="right">
                    <select style="width: 150px;">
                        <option value="">전체</option>
                        <option value="">공개</option>
                        <option value="">비공개</option>
                    </select>
                </div>

                <div class="main_width su_table_pad">
                    <table class="board-content table" id="suTable" align="center">
                        <thead>
                            <tr class="table_thead_border">
                                <th width="2%"><input type="checkbox" name="selectAll"></th>
                                <th>캘린더</th>
                                <th width="20%">공개 상태</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- 값은 다 DB와 연결될 것 -->
                            <tr>
                                <td><input type="checkbox" name="deleteList"></td>
                                <td>내 일정</td>
                                <td>
                                    <div class="selectOption" style="width: 60%; margin: auto;">
                                        <select style="width: 100%;">
                                            <option value="">공개</option>
                                            <option value="">비공개</option>
                                        </select>
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td><input type="checkbox" name="deleteList"></td>
                                <td>부서 일정</td>
                                <td>
                                    <div class="selectOption" style="width: 60%; margin: auto;">
                                        <select style="width: 100%;">
                                            <option value="">공개</option>
                                            <option value="">비공개</option>
                                        </select>
                                    </div>
                                </td>
                            </tr>



                        </tbody>
                    </table>

                    <script>

                        $(document).ready(function(){
                            $("input[name='selectAll']").click(function(){
                                // 전체 선택 체크박스 체크시 두개의 체크박스가 체크되고
                                if( $("input[name='selectAll']").is(":checked") ){
                                    $("input[name='deleteList']").prop("checked", true);
                                } else{	// 전체 선택 체크박스 해제시 두개의 체크박스 체크가 해제된다.
                                    $("input[name='deleteList']").prop("checked", false);
                                }
                            });
                            
                            $("input[name='deleteList']").click(function(){
                                var count = $("input[name='deleteList']").length;
                                var checked = $("input[name='deleteList']:checked").length;
                                
                                // 체크한 체크박스의 개수와 전체 체크박스 개수가 같으면 전체 선택 체크박스가 체크된다.
                                if(count != checked){
                                    $("input[name='selectAll']").prop("checked", false);
                                } else{
                                    $("input[name='selectAll']").prop("checked", true);
                                }
                                
                            });
                        });
                    
                    </script>

                    <br><br>
                    
                </div>

                <div class="tableOption">
                    <div class="su_btn_area su_btn_two_area">
                        <button type="button" class="btn su_btn_all" id="delCalBtn" data-toggle="modal" data-target="#nocheck">삭제 &nbsp;<span class="fas fa-trash"></span></button>
                        <button type="button" class="btn su_btn_border" onclick="location.href='list.ca;'">캘린더로 돌아가기</button>
                    </div>
                </div>

                <!-- 삭제 모달창 -->
                <div class="modal" id="deleteCal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
                        <!--Content-->
                        <div class="modal-content modal_alert">
                            
                            <!--Body-->
                            <div class="modal-body text-center modal_alert_child">
                                <div style="margin-top: 1.5rem;">
                
                                    <h5 class="mt-1 mb-2" style="color: black;">정말 삭제하시겠습니까?</h5>
                                    <br>                                
                                    <div class="text-center mt-4"> 
                                        <button type="button" id="realDelete" class="btn su_btn_all su_btn_medium">확인</button>
                                        <button type="button" id="next" class="btn su_btn_border su_btn_medium" data-dismiss="modal">취소</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- ==================================== 삭제 완료 후 alert창 출력하기==================================================== -->
                
                <!-- 체크 안했을 때 -->
                <div class="modal" id="nocheck" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
                        <!--Content-->
                        <div class="modal-content modal_alert">
                            
                            <!--Body-->
                            <div class="modal-body text-center modal_alert_child">
                                <div style="margin-top: 1.5rem;">
                
                                    <h5 class="mt-1 mb-2" style="color: black;">삭제할 캘린더를 선택해주세요.</h5>
                                    <br>                                
                                    <div class="text-center mt-4"> 
                                        <button type="button" class="btn su_btn_all su_btn_medium" data-dismiss="modal">확인</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 삭제 관련 script -->
	                <script>
	                    $(function(){
	                        // 켈린더 삭제
	                        let checkCnt = "";
	                        
	                        $("input[type=checkbox]").change(function(){
	                            checkCnt = "";
	                            $("input[name='deleteList']:checked").each(function(){
	                            	
	                            	console.log($(this).parent().parent().children(".no").text());
	                                //checkCnt += ($(this).parent().parent().children(".no").text()) + ","; // 체크된 것만 게시글번호 뽑기 "2,3,4,"
	                            });
	                            
	                            checkCnt = checkCnt.substring(0,checkCnt.lastIndexOf(",")); // 맨 뒤 콤마 삭제 "2,3,4"
                                
	                            
	                            // 선택된 체크박스 없이 삭제 버튼 누른 경우
	                            if(checkCnt == ''){
	                                $("#delCalBtn").attr("data-target", "#nocheck");
	                            }
	
	                            else {
	                                $("#delCalBtn").attr("data-target", "#deleteCal");
	                            }
	                        });
	
	                        // 모달에서 삭제 확인 클릭시 DB에서 삭제
	                        /*  $("#realDelete").click(function(){
	                            
	                             $.ajax({
	                                 url:"delete.pr", 
	                                 data:{"checkCnt":checkCnt},
	                                 success:function(result){
	                                     if(result == "success"){
	                                         location.reload();
	                                     } else{
	                                         alert("홍보물 삭제에 실패하였습니다.");
	                                     }
	                                 },
	                                 error:function(){
	                                     console.log("ajax 게시글 삭제 실패")
	                                 }
	                             });
	                         }); */
	
	                    })
	                </script>
                
                <!-- 페이징 영역 -->
                <!-- <div style="margin:30px 0 30px 0">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
                                <li class="page-item">
                                    <a class="page-link su_page_btn su_prenext" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <li class="page-item"><a class="page-link su_page_btn" href="#">1</a></li>
                                <li class="page-item"><a class="page-link su_page_btn" href="#">2</a></li>
                                <li class="page-item"><a class="page-link su_page_btn" href="#">3</a></li>
                                <li class="page-item">
                                    <a class="page-link su_page_btn su_prenext" href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div> -->

                </div>
            </div>
        </div>

    </div>



</div>		
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>