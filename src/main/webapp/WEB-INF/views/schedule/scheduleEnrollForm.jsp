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
	
	            <form action="insert.ca" method="post" id="insertForm">
	                <div class="su_content_body" style="width: 90%;">
	                
	                    <table id="eventForm">
	                        <tr>
	                            <td width="5%;"><span class="fas fa-star-of-life fontRed">&nbsp;</span></td>
	                            <td style="width: 114px;"><span>&nbsp;일정명</span></td>
	                            <td style="width: 80%;">
	                            &ensp; &ensp;<input type="text" id="scheTitle" name="scheTitle" placeholder="일정명 입력" style="width:300px;" required>
	                            &ensp;&ensp;<input type="checkbox" id="scheOpen"><span> &nbsp;비공개</span>
	                            <input type="hidden" name="scheOpen" value='N'>
	                            </td>
	                        </tr>
	
	                        <tr>
	                            <td width="5%;"><span class="fas fa-star-of-life fontRed">&nbsp;</span></td>
	                            <td><span>&nbsp;기간</span></td>
	                            <td>
	                                &ensp; &ensp;<input type="date" id="scheStartD" value="${ day }" required>&nbsp;<input type="time" id="scheStartT" required>
	                                <span> ~ </span>
	                                <input type="date" name="scheEndD" id="scheEndD" required>&nbsp;<input type="time" name="scheEndT" id="scheEndT" required>
	                                &ensp;&ensp;<input type="checkbox" id="scheAll"><span> &nbsp;종일</span>
	                                <!-- &ensp;&ensp;<input type="checkbox"><span> &nbsp;반복</span> -->
	                                
	                                <input type="hidden" name="scheStartDate">
	                                <input type="hidden" name="scheEndDate">
	                                <input type="hidden" name="scheAll" value="0">
	                            </td>
	                        </tr>
	
	                        <tr>
	                            <td width="5%;"><span>&nbsp;</span></td>
	                            <td><span>&nbsp;전사 일정</span></td>
	                            <td>
	                            &ensp;&ensp;&ensp;<input type="checkbox" id="scheCmpy"><span> &nbsp;전사 일정</span>
	                            <input type="hidden" name='scheCmpy' value="N">
	                            </td>
	                        </tr>
	
	                        <tr>
	                            <td width="5%;"><span>&nbsp;</span></td>
	                            <td><span>&nbsp;내 캘린더</span></td>
	                            <td>
	                                &ensp;&ensp;&nbsp;
	                                <!-- 내 캘린더 리스트 -->
	                                <select name="mycalNo">
	                                	<c:forEach var="m" items="${ list }">
		                                    <option value="${ m.mycalNo }">${ m.mycalName }</option>
	                                    </c:forEach>
	                                </select>
	                            </td>
	                        </tr>
	
	                        <tr>
	                            <td width="5%;"><span>&nbsp;</span></td>
	                            <td><span>&nbsp;참석자</span></td>
	                            <td id="attendeeArea" style="padding-left: 23px;">
	                                <!-- 선택한 참석자 영역 -->
									
	                                <span style="cursor: pointer;" id="addAttendee"> + 참석자 추가</span>
	                            </td>
								<span style="display: none;" id="atndNo2"></span>
								<span style="display: none;" id="atndList2"></span>
								<input type="hidden" id="scheAtndNo" name="scheAtndNo" value="">
								<input type="hidden" id="scheAtndList" name="scheAtndList" value="">
								<input type="hidden" name="scheWriter" value="${ loginUser.memNo }">
									
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
			<!-- ================================================= job_name 으로 바꾸기 -->
	                        <div class="su_ph_body">
	                            <div class="div_left_line" style="margin-top: -1rem;">
	                                	<c:forEach var="a" items="${ aList }">
	                                		<c:if test="${ a.deptCode eq 'DN' }">
	                                			<div class="su_ph_line ph_padding" onclick="chooseAtnd(${ a.memNo });">
				                                    <span style="font-size: 20px;">&nbsp;</span>
				                                    <span class="fas fa-user"></span>
				                                    <span>&nbsp; ${ a.memName } &nbsp; ${ a.jobCode }</span>
				                                </div>
			                                </c:if>
			                            </c:forEach>
	
	                                <!-- 강사진 주소록 -->
	                                <div>
	                                    <div class="collapsed ph_padding" data-toggle="collapse" data-target="#teacherList" aria-expanded="true" aria-controls="collapseTwo">
	                                        <span style="font-size: 20px;">-&nbsp;</span>
	                                        <span style="font-size: 20px;">+&nbsp;</span>
	                                        <span>&nbsp; 강사진</span>
	                                    </div>
	
	                                    <div id="teacherList" class="collapse div_left_line" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
	                                        <table class="su_Tb_Te">
	                                        
	                                        	<c:forEach var="a" items="${ aList }">
	                                        		<c:if test="${ a.deptCode eq 'D0' }">
			                                            <tr style="width: 100%;" class="ph_padding">
			                                                <td width="90%;">
			                                                    <div class="su_ph_line" onclick="chooseAtnd(${ a.memNo });">
			                                                    	<input type="hidden" value="${ a.memNo }">
			                                                        <span style="font-size: 20px;">-&nbsp;</span>
			                                                        <span class="fas fa-user"></span>
			                                                        <span>&nbsp; ${ a.memName } &nbsp; ${ a.jobCode }</span>
			                                                    </div>
			                                                </td>
			                                            </tr>
			                                        </c:if>
			                                    </c:forEach>
	                                           
	                                        </table>
	                                    </div>
	                                </div>
	
	                                <!-- 운영부 주소록 -->
	                                <div>
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
	                                        <table class="su_Tb_Pr">
	                                        
			                                    <c:forEach var="a" items="${ aList }">
	                                        		<c:if test="${ a.deptCode eq 'D2' }">
			                                            <tr style="width: 100%;" class="ph_padding">
			                                                <td width="90%;">
			                                                    <div class="su_ph_line" onclick="chooseAtnd(${ a.memNo });">
			                                                        <span style="font-size: 20px;">-&nbsp;</span>
			                                                        <span class="fas fa-user"></span>
			                                                        <span>&nbsp; ${ a.memName } &nbsp; ${ a.jobCode }</span>
			                                                    </div>
			                                                </td>
			                                            </tr>
			                                        </c:if>
			                                    </c:forEach>
	                                            
	                                        </table>
	                                    </div>
	
	                                        <div class="collapsed ph_padding" data-toggle="collapse" data-target="#adminiList" aria-expanded="true" aria-controls="collapseTwo">
	                                            <span style="font-size: 20px;">-&nbsp;</span>
	                                            <span style="font-size: 20px;">+&nbsp;</span>
	                                            <span>&nbsp; 행정팀</span>
	                                        </div>
	
	                                        <!-- 행정팀 리스트 -->
	                                    <div id="adminiList" class="collapse div_left_line" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
	                                        <table class="su_Tb_Ad">
	                                            <c:forEach var="a" items="${ aList }">
	                                        		<c:if test="${ a.deptCode eq 'D2' }">
			                                            <tr style="width: 100%;" class="ph_padding">
			                                                <td width="90%;">
			                                                    <div class="su_ph_line" onclick="chooseAtnd(${ a.memNo });">
			                                                        <span style="font-size: 20px;">-&nbsp;</span>
			                                                        <span class="fas fa-user"></span>
			                                                        <span>&nbsp; ${ a.memName } &nbsp; ${ a.jobCode }</span>
			                                                    </div>
			                                                </td>
			                                            </tr>
			                                        </c:if>
			                                    </c:forEach>
	                                            
	                                        </table>
	                                    </div>
	                                </div>
	
	                                    </div>
	
	                                    
	                                <!-- 인사팀 주소록 -->
	                                <div>
	                                    <div class="collapsed ph_padding" data-toggle="collapse" data-target="#hrList" aria-expanded="true" aria-controls="collapseTwo">
	                                        <span style="font-size: 20px;">-&nbsp;</span>
	                                        <span style="font-size: 20px;">+&nbsp;</span>
	                                        <span>&nbsp; 인사팀</span>
	                                    </div>
	
	                                    <div id="hrList" class="collapse div_left_line" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
	                                        <table class="su_Tb_Hr">
	                                            <c:forEach var="a" items="${ aList }">
	                                        		<c:if test="${ a.deptCode eq 'D1' }">
			                                            <tr style="width: 100%;" class="ph_padding">
			                                                <td width="90%;">
			                                                    <div class="su_ph_line" onclick="chooseAtnd(${ a.memNo });">
			                                                        <span style="font-size: 20px;">-&nbsp;</span>
			                                                        <span class="fas fa-user"></span>
			                                                        <span>&nbsp; ${ a.memName } &nbsp; ${ a.jobCode }</span>
			                                                    </div>
			                                                </td>
			                                            </tr>
			                                        </c:if>
			                                    </c:forEach>
	                                            
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
	                            });
	
	                            $("#xBtn").click(function(){
	                                $("#attCalList").removeClass("dis_bl");
	                                $("#attCalList").addClass("dis_no");
	                            });
	                            
	                        })
	                        	
	                        // 선택한 참석자 추가
                            function chooseAtnd(mNo){
	                        	var value = $("#attendeeArea").html();
	                        	var atndNoStr = $("#atndNo2").val();
	                        	var atndListStr = $("#atndList2").val();
	                        	
                            	$.ajax({
                            		url: "chatnd.ca",
                            		data: {memNo: mNo},
                            		success: function(m){
                            			//console.log(m);	// 멤버 객체
                            			var atndNo = m.memNo;
                            			var atndList = m.memName + " " + m.jobCode;
                            			atndNoStr += atndNo + ",";
                            			atndListStr += atndList + ",";
                            			
                            			$("#atndNo2").val(atndNoStr);	// 참석자 번호 리스트
                            			$("#atndList2").val(atndListStr);	// 참석자 명단 리스트
                            			$("#scheAtndNo").val($("#atndNo2").val());
                            			$("#scheAtndList").val($("#atndList2").val());
                            			
                            			var noList = atndNo + atndList;
                            			
										value += ' <div class="su_atndDiv" id="atnd' + atndNo + '">'
												+ '<span>' + atndList + '</span>'  
												+ '<button class="btn" type="button" onclick="back(' + atndNo + ');">X</button>'
											   + '</div> &nbsp;';
											   
										$("#attendeeArea").html(value);
                            			
                            		}, error: function(){
                            			console.log("ajax 참석차 추가 실패");
                            		}
                            	});
                                
                            }
	                        
	                        // 참석자 번호 리스트 삭제 클릭 이벤트
	                        function back(no){
	                        	// no : 선택한 멤버 변호
	                        	var id="atnd" + no;
	                        	var nolist = $("#atndNo2").val();
	                        	//console.log(nolist);
	                        	
	                        	//console.log($("#" + id).children().eq(0).text());
	                        	var name = $("#" + id).children().eq(0).text();
	                        	
	                        	$("#" + id).remove();
	                        	
	                        	no = no + ",";
	                        	nolist = nolist.replace(no, "");
	                        	$("#atndNo2").val(nolist);
	                        	$("#scheAtndNo").val($("#atndNo2").val());
	                        	//console.log($("#atndNo2").val());
	                        	backList(name);
	                        }
	                        
	                        // 참석자 이름 리스트 삭제 이벤트
	                        function backList(name){
	                        	//console.log(name);
	                        	var namelist = $("#atndList2").val();
	                        	
	                        	name = name + ",";
	                        	//console.log(name);
	                        	namelist = namelist.replace(name, "");
	                        	console.log(namelist);
	                        	$("#atndList2").val(namelist);
	                        	$("#scheAtndList").val($("#atndList2").val());
	                        }
	                        
	
	                    </script>
	                    
	                    <br><br>
	
	                    <div class="su_btn_two_center" style="width: 66%;">
	                        <button type="button" class="btn su_btn_two su_btn_all" id="submitBtn" data-toggle="modal" data-target="#noContent">등록</button>
	                        <button type="button" class="btn su_btn_two su_btn_border" onclick="location.href='list.ca';">취소</button>
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
		                                
		                                $("#insertForm").submit();
		                                
		                                
	                                } else{
	                                	
	                                	$("#submitBtn").attr("data-target", "#noContent");
	                                	
	                                }
	                                
	                            });
	                            
	                            // 비공개 선택하면
	                            $("#scheOpen").change(function(){
	                            	if( $("#scheOpen").is(":checked") ){
	                            		$("input[name=scheOpen]").val("Y");
	                            	} else{
	                            		$("input[name=scheOpen]").val("N");
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
	                            		$("#scheStartT").val('00:00');
	                            		$("#scheEndT").val('23:59');
	                            		$("input[name=scheAll]").val("1");
	                            		
	                            	} else{
	                            		$("#scheStartT").show();
	                            		$("#scheEndT").show();
	                            		$("input[name=scheAll]").val("0");
	                            	}
	                            	
	                            	// 시작일이 변할 때 마다 종료일도 동일하게 만들어 줌
	                            	$("#scheStartD").change(function(){
	                            		if( $("#scheAll").is(":checked") ){
	                            			console.log($("#scheStartD").val() + 1);
	                            			$("#scheEndD").val($("#scheStartD").val());
	                            		}
	                            		
	                            	});
	                            });
	                            
	                            // 전사일정 DB값 전달
	                            $("#scheCmpy").change(function(){
	                            	if( $("#scheCmpy").is(":checked") ){
	                            		$("input[name=scheCmpy]").val("Y");
	                            	} else{
	                            		$("input[name=scheCmpy]").val("N");
	                            	}
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