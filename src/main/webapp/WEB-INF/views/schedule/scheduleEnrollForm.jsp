<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	
	<div>
	    
	    <div class="su_contentArea">
	        <div class="su_content_header">
	            <h2 class="su_sub_menu_name" style="color: black;">일정 등록</h2>
	
	            <hr class="hr_line_top">
	
	            <form action="" method="post">
	                <div class="su_content_body" style="width: 90%;">
	                
	                    <table id="eventForm">
	                        <tr>
	                            <td width="5%;"><span class="fas fa-star-of-life fontRed">&nbsp;</span></td>
	                            <td style="width: 114px;"><span>&nbsp;일정명</span></td>
	                            <td style="width: 80%;">
	                            &ensp; &ensp;<input type="text" id="scheTitle" name="scheTitle" placeholder="일정명 입력" style="width:300px;" required>
	                            &ensp;&ensp;<input type="checkbox" id="scheOpen" name="scheOpen"><span> &nbsp;비공개</span>
	                            </td>
	                        </tr>
	
	                        <tr>
	                            <td width="5%;"><span class="fas fa-star-of-life fontRed">&nbsp;</span></td>
	                            <td><span>&nbsp;기간</span></td>
	                            <td>
	                                &ensp; &ensp;<input type="date" id="scheStartD" value="${ day }" required>&nbsp;<input type="time" id="scheStartT" required>
	                                <span> ~ </span>
	                                <input type="date" name="scheEndD" id="scheEndD" required>&nbsp;<input type="time" name="scheEndT" id="scheEndT" required>
	                                &ensp;&ensp;<input type="checkbox" id="scheAll" name="scheAll"><span> &nbsp;종일</span>
	                                <!-- &ensp;&ensp;<input type="checkbox"><span> &nbsp;반복</span> -->
	                                
	                                <input type="hidden" name="scheStartDate">
	                                <input type="hidden" name="scheEndDate">
	                            </td>
	                        </tr>
	
	                        <tr>
	                            <td width="5%;"><span>&nbsp;</span></td>
	                            <td><span>&nbsp;전사 일정</span></td>
	                            <td>
	                            &ensp;&ensp;&ensp;<input type="checkbox" id="scheCmpy" name="scheCmpy"><span> &nbsp;전사 일정</span>
	                            </td>
	                        </tr>
	
	                        <tr>
	                            <td width="5%;"><span>&nbsp;</span></td>
	                            <td><span>&nbsp;내 캘린더</span></td>
	                            <td>
	                                &ensp;&ensp;&nbsp;
	                                <!-- 내 캘린더 리스트 -->
	                                <select name="mycalNo">
	                                    <option value="1" selected>내 일정</option>
	                                    <option value="2">부서 일정</option>
	                                    <option value="3">연차</option>
	                                </select>
	                            </td>
	                        </tr>
	
	                        <tr>
	                            <td width="5%;"><span>&nbsp;</span></td>
	                            <td><span>&nbsp;참석자</span></td>
	                            <td id="attendeeArea">
	                                <!-- 선택한 참석자 영역 -->
	
	                                <span style="cursor: pointer;" id="addAttendee"> &ensp;&ensp;+ 참석자 추가</span>
	                            </td>
	                        </tr>
	
	                        <tr>
	                            <td width="5%;"><span>&nbsp;</span></td>
	                            <td><span>&nbsp;장소</span></td>
	                            <td>
	                            &ensp;&ensp;&ensp;<input type="text" style="width: 95%;" name="schePlace"></span>
	                            </td>
	                        </tr>
	
	                        <tr>
	                            <td width="5%;"><span>&nbsp;</span></td>
	                            <td style="vertical-align: top;">
	                                <span style="display: inline-block; margin-top: 10px;">&nbsp;내용</span>
	                            </td>
	                            <td>
	                            &ensp;&ensp;&ensp;<textarea name="scheContent"></textarea>
	                            </td>
	                        </tr>
	
	                    </table>
	
	                    <!-- 참석자 추가 창 -->
	                    <div class="su_ph_div dis_no ui-draggable" id="attCalList" style="top: 195px; left: 1182px;">
	                        <aside class="ph_aside">
	                            <div class="su_ph_header" style="position: static">
	                                <div class="su_ph_title">
	                                    <h5 class="mt-1 mb-2" id="moveCal" style="color: black;">참석자 추가<span class="fas fa-xmark" id="xBtn" style="cursor: pointer;"></span></h5>
	                                </div>
	                            </div>
	                        </aside>
	                        <div style="text-align: center;">
	                            <input type="text" name="suPhKeyword" placeholder="이름/부서/직위/직책">
	                            <button type="button" class="su_btn_border btn-sm">검색</button>
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
	                                        <table class="su_Tb">
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
	                                        <table class="su_Tb">
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
	                                        <table class="su_Tb">
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
	                                        <table class="su_Tb">
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
	                            // 참석자 추가 창 display
	                            $("#addAttendee").click(function(){
	                                $("#attCalList").removeClass("dis_no");
	                                $("#attCalList").addClass("dis_bl");
	                            })
	
	                            $("#xBtn").click(function(){
	                                $("#attCalList").removeClass("dis_bl");
	                                $("#attCalList").addClass("dis_no");
	                            })
	
	                            // 위치 드래그 기능
	                            //Make the DIV element draggagle:
	                            // dragElement(document.getElementById("attCalList"));
	
	                            // function dragElement(elmnt) {
	                            //     var pos1 = 210, pos2 = 0, pos3 = 0, pos4 = 450;
	                            //     if (document.getElementById(elmnt.id + "header")) {
	                            //         /* if present, the header is where you move the DIV from:*/
	                            //         document.getElementById(elmnt.id + "header").onmousedown = dragMouseDown;
	                            //     } else {
	                            //         /* otherwise, move the DIV from anywhere inside the DIV:*/
	                            //         elmnt.onmousedown = dragMouseDown;
	                            //     }
	
	                            //     function dragMouseDown(e) {
	                            //         e = e || window.event;
	                            //         e.preventDefault();
	                            //         // get the mouse cursor position at startup:
	                            //         pos3 = e.clientX;
	                            //         pos4 = e.clientY;
	                            //         document.onmouseup = closeDragElement;
	                            //         // call a function whenever the cursor moves:
	                            //         document.onmousemove = elementDrag;
	                            //     }
	
	                            //     function elementDrag(e) {
	                            //         e = e || window.event;
	                            //         e.preventDefault();
	                            //         // calculate the new cursor position:
	                            //         pos1 = pos3 - e.clientX;
	                            //         pos2 = pos4 - e.clientY;
	                            //         pos3 = e.clientX;
	                            //         pos4 = e.clientY;
	                            //         // set the element's new position:
	                            //         elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
	                            //         elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
	                            //     }
	
	                            //     function closeDragElement() {
	                            //         /* stop moving when mouse button is released:*/
	                            //         document.onmouseup = null;
	                            //         document.onmousemove = null;
	                            //     }
	                            // }
	
	                            // 선택한 참석자 추가
	                            $("#ceo").click(function(){
	                                $("#attendeeArea").html("<span>이영섭 대표</span>");
	                            });
	
	                            /* $( '#attCalList' ).draggable({
	                                scroll : false,
	                                containment : 'parent', //부모 요소 안에서만 이동 범위 제한
	                                handle : '.su_ph_title' // drag 대상 안 특정 요소에 제한 (여러개 사용 가능)
	                            }); */
	                        })
	
	                    </script>
	                    
	                    <br><br>
	
	                    <div class="su_btn_two_center" style="width: 80%;">
	                        <button type="button" class="btn su_btn_two su_btn_all" id="submitBtn" data-toggle="modal" data-target="#noContent">등록</button>
	                        <button type="button" class="btn su_btn_two su_btn_border">취소</button>
	                    </div>
	
	                    <!-- 필수사항 입력 안했을 때 모달창 -->
	                    <div class="modal" id="noContent" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                        <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
	                            <!--Content-->
	                            <div class="modal-content modal_alert">
	                                
	                                <!--Body-->
	                                <div class="modal-body text-center modal_alert_child">
	                                    <div style="margin-top: 1.5rem;">
	                    
	                                        <h5 class="mt-1 mb-2" style="color: black;">필수 사항을 입력해주세요.</h5>
	                                        <br>                                
	                                        <div class="text-center mt-4"> 
	                                            <button type="button" class="btn su_btn_all su_btn_medium" data-dismiss="modal">확인</button>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	
	
	
	                    <script>
	                        $(document).ready(function(){
	                        	
	                            $("#submitBtn").click(function(){
	                                // 일정명이랑 기간의 value가 비어있으면 모달창
	                                // 입력했으면 data-target attr 지우기
	                                if( ($("#scheTitle").val() != "") && ($("#scheStartD").val() != "") && ($("#scheEndD").val() != "") ){
	                                	$("#submitBtn").removeAttr("data-target");
	                                	
										// 폼 서브밋
	                                	
	                                	// 시작일 종료일에 날짜 시간 합치기
	                                	let scheStartDate = $("#scheStartD").val();
										scheStartDate += " ";
										scheStartDate += $("#scheStartT").val();
										
										let scheEndDate = $("#scheEndD").val();
										scheEndDate += " ";
										scheEndDate += $("#scheEndT").val();
		                                // console.log(scheStartDate);
		                                
		                                $("input[name=scheStartDate]").val(scheStartDate);
		                                $("input[name=scheEndDate]").val(scheEndDate);
		                                
		                                
	                                } else{
	                                	
	                                	$("#submitBtn").attr("data-target", "#noContent");
	                                	
	                                }
	                                
	                            });
	                            
	                            // 종일을 체크하면 input type time 없애기, 시작일 종료일 동일하게 하기
	                            $("#scheAll").change(function(){
	                            	//console.log($("#scheAll").is(":checked")); // true
	                            		console.log($("#scheStartD").val());

	                            	if( $("#scheAll").is(":checked") ){
	                            		// console.log($("#scheAll").val()); // on
	                            		$("#scheStartT").hide();
	                            		$("#scheEndT").hide();
	                            		$("#scheEndD").val($("#scheStartD").val());
	                            		
	                            	} else{
	                            		$("#scheStartT").show();
	                            		$("#scheEndT").show();
	                            	}
	                            	
	                            	// 시작일이 변할 때 마다 종료일도 동일하게 만들어 줌
	                            	$("#scheStartD").change(function(){
	                            		if( $("#scheAll").is(":checked") ){
	                            			$("#scheEndD").val($("#scheStartD").val());
	                            		}
	                            		
	                            	});
	                            });
	                            
	                            
	
	                        })
	                    </script>
	                        
	    
	                    </div>
	                </form>
	            </div>
	        </div>
	
	    </div>
	
	
	
	</div>    
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>