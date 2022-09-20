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
	
	<div>
	    
	    <div class="su_contentArea">
	        <div class="su_content_header">
	            <h2 class="su_sub_menu_name" style="color: black;">일정 상세</h2>
	
	            <hr class="hr_line_top" style="margin-bottom: 0px;">
	            <div style="display: flex; justify-content: space-between">
	            
	            	<form action="update.ca" method="Post" id="updateForm">
		                <div class="su_content_body" style="width: 885px;">
		    				
		    				<input type="hidden" name="scheNo" value="${ s.scheNo }">
		    				
		                    <table id="eventForm">
		                        <tr>
		                            <td width="5%;"><span>&nbsp;</span></td>
		                            <td><span>&nbsp;일정명</span></td>
		                            <td>
			                            &ensp; &ensp;<input type="text" name="scheTitle" style="width:300px;" value="${ s.scheTitle }" required>
			                            <c:choose>
			                            	<c:when test="${ s.scheOpen eq N }">
			                            		&ensp;&ensp;<input type="checkbox" name="scheOpen" checked><span> &nbsp;비공개</span>
			                            	</c:when>
			                            	<c:otherwise>
			                            		&ensp;&ensp;<input type="checkbox" name="scheOpen"><span> &nbsp;비공개</span>
			                            	</c:otherwise>
			                            </c:choose>
			                            <input type="hidden" name="scheOpen" value='N'>
		                            </td>
		                        </tr>
		
		                        <tr>
		                            <td width="5%;"><span>&nbsp;</span></td>
		                            <td><span>&nbsp;기간</span></td>
		                            <td>
		                                &ensp; &ensp;<input type="date" id="scheStartD"  required>&nbsp;<input type="time" id="scheStartT" required>
		                                <span> ~ </span>
		                                <input type="date" name="scheEndD" id="scheEndD" required>&nbsp;<input type="time" name="scheEndT" id="scheEndT" required>
		                                <c:choose>
			                            	<c:when test="${ s.scheAll eq 1 }">
			                            		&ensp;&ensp;<input type="checkbox" id="scheAll" checked><span> &nbsp;종일</span>
			                            	</c:when>
			                            	<c:otherwise>
			                            		&ensp;&ensp;<input type="checkbox" id="scheAll"><span> &nbsp;종일</span>
			                            	</c:otherwise>
			                            </c:choose>
		                                
		                                <!-- &ensp;&ensp;<input type="checkbox"><span> &nbsp;반복</span> -->
		                                
		                                <span style="display: none;" id="sDT">${ s.scheStartDate }</span>
		                                <span style="display: none;" id="eDT">${ s.scheEndDate }</span>
		                                <input type="hidden" name="scheStartDate">
		                                <input type="hidden" name="scheEndDate">
		                                <input type="hidden" name="scheAll" value="0">
		                            </td>
		                        </tr>
		
		                        <tr>
		                            <td width="5%;"><span>&nbsp;</span></td>
		                            <td><span>&nbsp;전사 일정</span></td>
		                            <td>
		                            	<c:choose>
			                            	<c:when test="${ s.scheCmpy eq 'Y' }">
			                            		&ensp;&ensp;&ensp;<input type="checkbox" id="scheCmpy" checked><span> &nbsp;전사 일정</span>
			                            	</c:when>
			                            	<c:otherwise>
			                            		&ensp;&ensp;&ensp;<input type="checkbox" id="scheCmpy"><span> &nbsp;전사 일정</span>
			                            	</c:otherwise>
			                            </c:choose>
		                            
		                            	<input type="hidden" name='scheCmpy' value="N">
		                            </td>
		                        </tr>
		
		                        <tr>
		                            <td width="5%;"><span>&nbsp;</span></td>
		                            <td><span>&nbsp;내 캘린더</span></td>
		                            <td>
		                                &ensp;&ensp;&nbsp;
		                                <!-- 내 캘린더 리스트 -->
	                                	<select name="mycalNo" id="mycalNo">
		                                	<c:forEach var="m" items="${ mlist }">
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
		                            
									<span style="display: none;" id="atndNo2">${ s.scheAtndNo }</span>
									<span style="display: none;" id="atndList2">${ s.scheAtndList }</span>
									<input type="hidden" id="scheAtndNo" name="scheAtndNo" value="${ s.scheAtndNo }">
									<input type="hidden" id="scheAtndList" name="scheAtndList" value="${ s.scheAtndList }">
									<input type="hidden" name="scheWriter" value="${ loginUser.memNo }">
		                        </tr>
		
		                        <tr>
		                            <td width="5%;"><span>&nbsp;</span></td>
		                            <td><span>&nbsp;장소</span></td>
		                            <td>
		                            &ensp;&ensp;&ensp;<input type="text" style="width: 575px;" name="schePlace" value="${ s.schePlace }"></span>
		                            </td>
		                        </tr>
		
		                        <tr>
		                            <td width="5%;"><span>&nbsp;</span></td>
		                            <td style="vertical-align: top;">
		                                <span style="display: inline-block;margin-top: 10px;">&nbsp;내용</span>
		                            </td>
		                            <td>
		                            	&ensp;&ensp;&ensp;<textarea name="scheContent" style="width: 575px;">${ s.scheContent }</textarea>
		                            </td>
		                        </tr>
		
		                    </table>
		                    
		                    <!-- 참석자 추가 창 -->
	                    <div class="su_ph_div dis_no ui-draggable" id="attCalList" style="top: 195px; left: 1035px;">
	                        <aside class="ph_aside">
	                            <div class="su_ph_header" style="position: static">
	                                <div class="su_ph_title">
	                                    <h5 class="mt-1 mb-2" id="moveCal" style="color: black;">참석자 추가<span class="fas fa-xmark" id="xBtn" style="cursor: pointer;"></span></h5>
	                                </div>
	                            </div>
	                        </aside>
	                        <div style="text-align: center;">
	                            <input type="text" id="atndKeyword" name="suPhKeyword" placeholder="이름/직책">
	                            <button type="button" class="su_btn_border btn-sm" onclick="searchAtnd();">검색</button>
	                        </div>
	                        
	                        <hr class="hr_line">
			<!-- ================================================= job_name 으로 바꾸기 -->
	                        <div class="su_ph_body">
	                            <div class="div_left_line" id="atndArea" style="margin-top: -1rem;">
	                                	<c:forEach var="a" items="${ aList }">
	                                		<c:if test="${ a.deptCode eq 'DN' }">
	                                			<div class="su_ph_line ph_padding" onclick="chooseAtnd(${ a.memNo });">
				                                    <span style="font-size: 20px;">&nbsp;</span>
				                                    <span class="fas fa-user"></span>
				                                    <span>&nbsp; ${ a.memName } &nbsp; ${ a.jobName }</span>
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
			                                                        <span>&nbsp; ${ a.memName } &nbsp; ${ a.jobName }</span>
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
			                                                        <span>&nbsp; ${ a.memName } &nbsp; ${ a.jobName }</span>
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
			                                                        <span>&nbsp; ${ a.memName } &nbsp; ${ a.jobName }</span>
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
			                                                        <span>&nbsp; ${ a.memName } &nbsp; ${ a.jobName }</span>
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
		                    
		
		                    <br><br>
		
		                    <div class="su_btn_two_center">
		                    	<c:if test="${ loginUser.memNo == s.scheWriter }">
		                        	<button type="button" class="btn su_btn_two su_btn_border" id="updateBtn" data-toggle="modal" data-target="#noContent">수정</button>
		                        	<button type="button" class="btn su_btn_two su_btn_border" id="deleteBtn" data-toggle="modal" data-target="#delete">삭제</button>
		                        </c:if>
		                        <c:if test="${ loginUser.memNo != s.scheWriter }">
		                        	<button type="button" class="btn su_btn_two su_btn_border" id="updateBtn" disabled>수정</button>
		                        	<button type="button" class="btn su_btn_two su_btn_border" id="deleteBtn" data-toggle="modal" data-target="#delete" disabled>삭제</button>
		                        </c:if>
		                        
		                        <button type="button" class="btn su_btn_two su_btn_border" onclick="postFormSubmit('list.ca');">돌아가기</button>
		                    </div>
		       
		       <!-- ================================================================================================ -->
		                    <form id="postForm" action="" method="post">
	            	
				            	<input type="hidden" name="memNo" value="${loginUser.memNo }">
				            
				            </form>
				            
		                    <script>
		                    	$(document).ready(function(){
		                    		
		                    		// 내 캘린더 option에 selected 부여
									const mycal = ${ s.mycalNo };
									//console.log(mycal);	// 해당 내 캘린더 번호
									//console.log($("#mycalNo").children().parent().children().val());
									$("#mycalNo").val(mycal).prop("selected", true);
		                    		
		                    		// 공개 checkbox
		                    		// 비공개 선택하면
		                            $("#scheOpen").change(function(){
		                            	if( $("#scheOpen").is(":checked") ){
		                            		$("input[name=scheOpen]").val("Y");
		                            	} else{
		                            		$("input[name=scheOpen]").val("N");
		                            	}
		                            	
		                            });
		                    		
		                         	// 전사일정 DB값 전달
		                            $("#scheCmpy").change(function(){
		                            	if( $("#scheCmpy").is(":checked") ){
		                            		$("input[name=scheCmpy]").val("Y");
		                            	} else{
		                            		$("input[name=scheCmpy]").val("N");
		                            	}
		                            });
		                    		
		                         	// 참석자 추가 창 display
		                            $(document).on("click", "#addAttendee", function(){
		                                $("#attCalList").removeClass("dis_no");
		                                $("#attCalList").addClass("dis_bl");
		                            });
		
		                            $(document).on("click", "#xBtn", function(){
		                                $("#attCalList").removeClass("dis_bl");
		                                $("#attCalList").addClass("dis_no");
		                            });
		                            
		                            // 시작일 종료일 시간 value 설정
		                            var sDT = new Array();
		                            var eDT = new Array();
		                            var sDtStr = $("#sDT").text();
		                            var eDtStr = $("#eDT").text();
		                            sDT = sDtStr.split(" ");
		                            eDT = eDtStr.split(" ");
		                            
		                            var sD = sDT[0];
		                            var sT = sDT[1];
		                            //console.log(sD);
		                            var eD = eDT[0];
		                            var eT = eDT[1];
		                            
		                            $("#scheStartD").val(sD);
		                            $("#scheStartT").val(sT);
		                            $("#scheEndD").val(eD);
		                            $("#scheEndT").val(eT);
		                            
		                         	// 종일을 체크하면 input type time 없애기, 시작일 종료일 동일하게 하기
		                            if( $("#scheAll").is(":checked") ){
	                            		// console.log($("#scheAll").val()); // on
	                            		$("#scheStartT").hide();
	                            		$("#scheEndT").hide();
	                            		$("#scheStartT").val('00:00');
	                            		$("#scheEndT").val('23:59');
	                            		$("#scheEndD").val($("#scheStartD").val());
	                            		$("input[name=scheAll]").val("1");
	                            		
	                            	} else{
	                            		$("#scheStartT").show();
	                            		$("#scheEndT").show();
	                            		$("input[name=scheAll]").val("0");
	                            	}
		                    		
		                         	// 종일을 체크하면 input type time 없애기, 시작일 종료일 동일하게 하기
		                            $("#scheAll").change(function(){
		                            	//console.log($("#scheAll").is(":checked")); // true
		                            		console.log($("#scheStartD").val());

		                            	if( $("#scheAll").is(":checked") ){
		                            		// console.log($("#scheAll").val()); // on
		                            		$("#scheStartT").hide();
		                            		$("#scheEndT").hide();
		                            		$("#scheEndD").val($("#scheStartD").val());
		                            		$("input[name=scheAll]").val("1");
		                            		
		                            	} else{
		                            		$("#scheStartT").show();
		                            		$("#scheEndT").show();
		                            		$("input[name=scheAll]").val("0");
		                            	}
		                            	
		                            	// 시작일이 변할 때 마다 종료일도 동일하게 만들어 줌
		                            	$("#scheStartD").change(function(){
		                            		if( $("#scheAll").is(":checked") ){
		                            			$("#scheEndD").val($("#scheStartD").val());
		                            		}
		                            		
		                            	});
		                            });
		                    		
		                         	// 참석자가 있을 경우 화면에 표시
		                         	if( $("#atndNo2").text() != "" ){
		                         		// 맨 뒤 콤마 제거
		                         		var no = $("#atndNo2").text();
		                         		var li = $("#atndList2").text();
			                    		//$("#atndNo2").text(no.substring(0, no.lastIndexOf(",")));
			                    		//$("#atndList2").text(li.substring(0, li.lastIndexOf(",")));
			                    		
			                    		var no2 = no.substring(0, no.lastIndexOf(","));
			                    		var li2 = li.substring(0, li.lastIndexOf(","));
			                    		
		                         		var anArr = new Array();
		                         		var alArr = new Array();
		                         		var anStr = no2;
		                         		var alStr = li2;
		                         		anArr = anStr.split(",");
		                         		alArr = alStr.split(",");
		                         		
		                         		//console.log(anArr);
		                         		var val = $("#attendeeArea").html();
		                         		
		                         		for(let i = 0; i < anArr.length; i++){
		                         			val += ' <div class="su_atndDiv" id="atnd' + anArr[i] + '">'
													+ '<span>' + alArr[i] + '</span>';
												if( ${ loginUser.memNo == s.scheWriter }){
													val += '<button class="btn" type="button" onclick="back(' + anArr[i] + ');">X</button>';
												} 
													val += '</div> &nbsp;';
		                         		}
		                         		$("#attendeeArea").html(val);
		                         		
		                         	}
		                         	
		                    	})
		                    	
		                    	function postFormSubmit(url){
				            		$("#postForm").attr("action", url).submit();
				            	}
	                         	
	                            // 선택한 참석자 추가
	                            function chooseAtnd(mNo){
		                        	var value = $("#attendeeArea").html();
		                        	var atndNoStr = $("#atndNo2").text()
		                        	var atndListStr = $("#atndList2").text();
		                        	
	                            	$.ajax({
	                            		url: "chatnd.ca",
	                            		data: {memNo: mNo},
	                            		success: function(m){
	                            			//console.log(atndListStr);	// 멤버 객체
	                            			var atndNo = m.memNo;
	                            			var atndList = m.memName + " " + m.jobName;
	                            			atndNoStr += atndNo + ",";
	                            			atndListStr += atndList + ",";
	                            			
	                            			$("#atndNo2").text(atndNoStr);	// 참석자 번호 리스트
	                            			$("#atndList2").text(atndListStr);	// 참석자 명단 리스트
	                            			$("#scheAtndNo").val($("#atndNo2").text());
	                            			$("#scheAtndList").val($("#atndList2").text());
	                            			console.log($("#scheAtndList").val());
	                            			
	                            			var noList = atndNo + atndList;
	                            			//console.log($("#scheAtndList").val());
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
		                        	var nolist = $("#atndNo2").text();
		                        	//console.log(nolist);
		                        	
		                        	//console.log($("#" + id).children().eq(0).text());
		                        	var name = $("#" + id).children().eq(0).text();
		                        	
		                        	$("#" + id).remove();
		                        	
		                        	no = no + ",";
		                        	nolist = nolist.replace(no, "");
		                        	$("#atndNo2").text(nolist);
		                        	$("#scheAtndNo").val($("#atndNo2").text());
		                        	console.log($("#scheAtndNo").val());
		                        	backList(name);
		                        }
		                        
		                        // 참석자 이름 리스트 삭제 이벤트
		                        function backList(name){
		                        	//console.log(name);
		                        	var namelist = $("#atndList2").text();
		                        	
		                        	name = name + ",";
		                        	//console.log(name);
		                        	namelist = namelist.replace(name, "");
		                        	console.log(namelist);
		                        	$("#atndList2").text(namelist);
		                        	$("#scheAtndList").val($("#atndList2").text());
		                        	console.log($("#scheAtndList").val());
		                        }
		                        
		                     // 참석자 검색 이벤트
		                        function searchAtnd(){
		                        	var key = $("#atndKeyword").val();
		                        	var value = "";
		                        	var tCount = 0;	// 강사
		                        	var pCount = 0;	// 홍보
		                        	var dCount = 0;	// 행정
		                        	var hCount = 0;	// 인사
		                        	$.ajax({
		                        		url: "search.ca",
		                        		data: {keyword: key},
		                        		success: function(list){
		                        			console.log(list);
		                        			
		                        			for(let i = 0; i < list.length; i++){
		                        				if(list[i].deptCode == 'DN'){
		                        					value += '<div class="su_ph_line ph_padding" onclick="chooseAtnd(' + list[i].memNo + ');">'
		                        								+ '<span style="font-size: 20px;">&nbsp;</span>'
		                        								+ '<span class="fas fa-user"></span>'
		            		                                    + '<span>&nbsp; ' + list[i].memName + ' &nbsp; ' + list[i].jobName + '</span>'
		            		                                    + '</div>';
		                        				}
		                        			}
	                            			
		                        			for(let i = 0; i < list.length; i++){
		                        				if(list[i].deptCode == 'D0'){
		                        					tCount++;
		                        				}
		                        			}
		                        			
		                        			value += '<div>';
		                        			
		                        			if(tCount > 0){
		                        				value += '<div class="collapsed ph_padding" data-toggle="collapse" data-target="#teacherList" aria-expanded="true" aria-controls="collapseTwo">'
		                                            		+ '<span style="font-size: 20px;">-&nbsp;</span>'
		                                            		+ '<span style="font-size: 20px;">+&nbsp;</span>'
		                                            		+ '<span>&nbsp; 강사진</span>'
		                                        	   + '</div>'
		                                        	   + '<div id="teacherList" class="collapse div_left_line" aria-labelledby="headingTwo" data-parent="#accordionSidebar">'
		                                               		+ '<table class="su_Tb_Te">';
		                        			}
			                                    
			                                 for(let i = 0; i < list.length; i++){
			                                	 if(list[i].deptCode == 'D0'){
			                                		 value += '<tr style="width: 100%;" class="ph_padding">'
		                                                		+ '<td width="90%;">'
		                                                    		+ '<div class="su_ph_line" onclick="chooseAtnd(' + list[i].memNo + ');">'
		                                                    			+ '<input type="hidden" value="' + list[i].memNo + '">'
		                                                        		+ '<span style="font-size: 20px;">-&nbsp;</span>'
		                                                        		+ '<span class="fas fa-user"></span>'
		                                                        		+ '<span>&nbsp; ' + list[i].memName + ' &nbsp; ' + list[i].jobName + '</span>'
		                                                       + '</div></td></tr>';
			                                	 }
			                                 }   
			                       
											if(tCount > 0){
												value += '</table></div>';
											}
	                          
											value += '</div><div>';
		                                            
											for(let i = 0; i < list.length; i++){
		                        				if(list[i].deptCode == 'D3'){
		                        					pCount++;
		                        				}
		                        			}  
											for(let i = 0; i < list.length; i++){
		                        				if(list[i].deptCode == 'D2'){
		                        					dCount++;
		                        				}
		                        			} 
											
											if(pCount > 0 || dCount > 0){
												value += '<div class="collapsed ph_padding" data-toggle="collapse" data-target="#opList" aria-expanded="true" aria-controls="collapseTwo">'
		                                        			+ '<span style="font-size: 20px;">-&nbsp;</span>'
		                                        			+ '<span style="font-size: 20px;">+&nbsp;</span>'
		                                        			+ '<span>&nbsp; 운영부</span>'
		                                    		   + '</div>'
		
		                                    		   + '<div id="opList" class="collapse div_left_line" aria-expanded="true" data-parent="#accordionSidebar">';
											}
	                                       
											if(pCount > 0){
												value += '<div class="collapsed ph_padding" data-toggle="collapse" data-target="#promoList" aria-expanded="true" aria-controls="collapseTwo">'
		                                        			+ '<span style="font-size: 20px;">-&nbsp;</span>'
		                                        			+ '<span style="font-size: 20px;">+&nbsp;</span>'
		                                        			+ '<span>&nbsp; 홍보팀</span>'
		                                    		   + '</div>'

		                                			   + '<div id="promoList" class="collapse div_left_line" aria-labelledby="headingTwo" data-parent="#accordionSidebar">'
		                                    				+ '<table class="su_Tb_Pr">';
											}
											
	                                    	for(let i = 0; i < list.length; i++){
	                                    		if(list[i].deptCode == 'D3'){
		                                    		value += '<tr style="width: 100%;" class="ph_padding">'
	                                                			+ '<td width="90%;">'
	                                                				+ '<div class="su_ph_line" onclick="chooseAtnd(' + list[i].memNo + ');">'
	                                                    				+ '<span style="font-size: 20px;">-&nbsp;</span>'
	                                                    				+ '<span class="fas fa-user"></span>'
	                                                    				+ '<span>&nbsp; ' + list[i].memName + ' &nbsp; ' + list[i].jobName + '</span>'
	                                                    			+ '</div></td></tr>';
	                                    		}
	                                    	}
	                                    	
	                                    	if(pCount > 0){
	                                    		value += '</table></div>';
	                                    	}
	                                
											if(dCount > 0){
												value += '<div class="collapsed ph_padding" data-toggle="collapse" data-target="#adminiList" aria-expanded="true" aria-controls="collapseTwo">'
		                                        			+ '<span style="font-size: 20px;">-&nbsp;</span>'
		                                        			+ '<span style="font-size: 20px;">+&nbsp;</span>'
		                                        			+ '<span>&nbsp; 행정팀</span>'
		                                    		   + '</div>'

		                                			   + '<div id="adminiList" class="collapse div_left_line" aria-labelledby="headingTwo" data-parent="#accordionSidebar">'
		                                    				+ '<table class="su_Tb_Ad">';
											}
	                            
	                                    	for(let i = 0; i < list.length; i++){
	                                    		if(list[i].deptCode == 'D2'){
	                                    			value += '<tr style="width: 100%;" class="ph_padding">'
	                                        			+ '<td width="90%;">'
	                                        				+ '<div class="su_ph_line" onclick="chooseAtnd(' + list[i].memNo + ');">'
	                                            				+ '<span style="font-size: 20px;">-&nbsp;</span>'
	                                            				+ '<span class="fas fa-user"></span>'
	                                            				+ '<span>&nbsp; ' + list[i].memName + ' &nbsp; ' + list[i].jobName + '</span>'
	                                            			+ '</div></td></tr>';
	                                    		}
	                                    	}
	                                    	
	                                    	if(dCount > 0){
	                                    		value += '</table></div>';
	                                    	}
	                                    
		                                    if(pCount > 0 || dCount > 0){
		                                    	value += '</div></div>';
		                                    }
		                                    
		                                    for(let i = 0; i < list.length; i++){
		                        				if(list[i].deptCode == 'D1'){
		                        					hCount++;
		                        				}
		                        			} 
		                                        
	                                        if(hCount > 0){
	                                        	value += '<div>'
	                                            			+ '<div class="collapsed ph_padding" data-toggle="collapse" data-target="#hrList" aria-expanded="true" aria-controls="collapseTwo">'
	                                            				+ '<span style="font-size: 20px;">-&nbsp;</span>'
	                                            				+ '<span style="font-size: 20px;">+&nbsp;</span>'
	                                            				+ '<span>&nbsp; 인사팀</span>'
	                                        				+ '</div>'

	                                        				+ '<div id="hrList" class="collapse div_left_line" aria-labelledby="headingTwo" data-parent="#accordionSidebar">'
	                                            				+ '<table class="su_Tb_Hr">';
	                                        }
	                                    	
	                                        for(let i = 0; i < list.length; i++){
	                                    		if(list[i].deptCode == 'D1'){
	                                    			value += '<tr style="width: 100%;" class="ph_padding">'
	                                        			+ '<td width="90%;">'
	                                    				+ '<div class="su_ph_line" onclick="chooseAtnd(' + list[i].memNo + ');">'
	                                        				+ '<span style="font-size: 20px;">-&nbsp;</span>'
	                                        				+ '<span class="fas fa-user"></span>'
	                                        				+ '<span>&nbsp; ' + list[i].memName + ' &nbsp; ' + list[i].jobName + '</span>'
	                                        			+ '</div></td></tr>';
	                                    		}
	                                        }

		                        			$("#atndArea").html(value);   
		                        			}, error: function(){
		                        			console.log("ajax 검색 실패");
		                        		}
		                        	});
		                        }
	                    		
	                    		// 필수 사항 입력
	                            $("#updateBtn").click(function(){
	                                // 일정명이랑 기간의 value가 비어있으면 모달창
	                                // 입력했으면 data-target attr 지우기
	                                if( ($("#scheTitle").val() != "") && ($("#scheStartD").val() != "") && ($("#scheEndD").val() != "") ){
	                                	$("#updateBtn").removeAttr("data-target");
	                                	
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
		                                
		                                $("#updateForm").submit();
		                                
		                                
	                                } else{
	                                	
	                                	$("#updateBtn").attr("data-target", "#noContent");
	                                	
	                                }
	                                
	                            });
		                    		
		                    	
		                    </script>
		
		                    <!-- 삭제 모달창 -->
		                    <div class="modal" id="delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		                        <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
		                            <!--Content-->
		                            <div class="modal-content modal_alert">
		                                
		                                <!--Body-->
		                                <div class="modal-body text-center modal_alert_child">
		                                     <div style="margin-top: 1.5rem;">
		                    
		                                        <h5 class="mt-1 mb-2" style="color: black;">정말 삭제하시겠습니까?</h5>
		                                        <br>                                
		                                        <div class="text-center mt-4"> 
		                                            <button type="button" id="realDelete" class="btn su_btn_all su_btn_medium"
		                                            onclick="location.href='delete.ca?sNo=${ s.scheNo }';">확인</button>
		                                            <button type="button" id="next" class="btn su_btn_border su_btn_medium" data-dismiss="modal">취소</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
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
		                    
		                    <!-- 댓글 삭제 모달창 -->
				            <div class="modal" id="deleteReply" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				                <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
				                    <!--Content-->
				                    <div class="modal-content modal_alert">
				                        
				                        <!--Body-->
				                        <div class="modal-body text-center modal_alert_child">
				                            <div style="margin-top: 1.5rem;">
				            
				                                <h5 class="mt-1 mb-2" style="color: black;">정말 삭제하시겠습니까?</h5>
				                                <br>
				                                <div class="text-center mt-4"> 
				                                    <button type="button" id="realDeleteReply" class="btn su_btn_all su_btn_medium">확인</button>
				                                    <button type="button" id="next" class="btn su_btn_border su_btn_medium" data-dismiss="modal">취소</button>
				                                </div>
				                            </div>
				                        </div>
				                    </div>
				                </div>
				            </div>
		                
		    
		                
		                </div>
	                
	                </form>
	                
	                <!-- 댓글 영역=================================================================================== -->
	                <!-- 내가 작성한 댓글은 옆에 삭제 버튼 추가 -->
                    <div class="su_sub_menu_div_left" style="margin: 0px;">
                        <div class="reply_header">
                            <h4> &ensp;댓글 <span id="rCountSpan"></span></h4>
                        </div>

                        <hr class="hr_line">
                        
                        <!-- 댓글 작성 영역 -->
                        <div class="su_insert_reply" style="margin-bottom: 15px;">
                            <!-- 로그인 한 사원 사진 -->
                            <img style="margin-left: 14px;" src="${pageContext.request.contextPath}/resources/profile_images/defaultProfile.png" alt="">
                        
                            <div class="su_reply_input">
                                <input type="text" placeholder="댓글 입력" id="replyContent0">
                                &nbsp;
                                <button type="button" class="btn btn-sm su_btn_border" onclick="addReply(0);">작성</button>
                            </div>
                               
                        </div>
                        
                       	<!-- 댓글 리스트 조회 영역 -->
                       	<div id="scheReplyArea" style="padding-left: 5px;"></div>
	                        
                        <br>
                        
                        
	
	                </div>
	              
                  <!-- 댓글관련 script =====================================================================================-->
                  <script>
                  	$(function(){
                  		selectReplyList();
                  		
                  	})	
                  	
                  	// 댓글 조회용
                  	function selectReplyList(){
                  		
                  		$.ajax({
                  			url: "rlist.ca",
                  			data: {no: ${ s.scheNo }},
                  			success: function(rlist){
                  				//console.log(rlist);
                  				
                  				let value = "";
                  				let rCount = rlist.length;
                  				var deCount = 0;
                  				
                  				$("#rCountSpan").text("[" + rCount + "]");
                  				
                  				for(let i = 0; i < rCount; i++){
                  					
                  					if(rlist[i].replyParent == 0 && rlist[i].replyStatus == 'Y'){ // 원댓글 이면
                  						value += '<div class="su_one_reply" style="margin-bottom: 12px;" id="sReply'+ rlist[i].replyNo + '">';
                  					} else if(rlist[i].replyStatus == 'Y'){ // 대댓글이면
                  						value += '<div class="su_one_reply" style="margin-left: 30px; margin-bottom: 12px;" id="sReply'+ rlist[i].replyNo + '">';
                					} else if(rlist[i].replyStatus == 'N'){	// 대댓글이 삭제되었으면
                						value += '<div style="margin: 25px 0px 25px 12px;">';
                					}
                  					
                  					if(rlist[i].replyStatus == 'Y'){
                  						value += '<div>'
                  									+ '<img src="${pageContext.request.contextPath}/resources/profile_images/defaultProfile.png" alt="">'
                                        	   + '</div>'
                                        	   + '<div class="su_reply_content">';
                                   		if(rlist[i].replyParent == 0){	// 원댓글
                                   			value += '<h5 style="font-weight: 600; color: black;">' + rlist[i].replyWriter + ' '+ rlist[i].replyJob + '</h5>';
                                   		} else {
                                   			value += '<h5 style="font-weight: 600; color: black;">ㄴ ' + rlist[i].replyWriter + ' '+ rlist[i].replyJob + '</h5>';
                                   		}
                                   		value += '<p id="rContent' + rlist[i].replyNo + '">' + rlist[i].replyContent + '</p>';
                                   		
                                   		if( rlist[i].replyWriter == "${ loginUser.memName }" ){
                                   			value += '<button type="button" class="btn btn-sm" style="float: right; border: 0px; color: black;" onclick="deleteReply(' + rlist[i].replyNo + ');">삭제</button>'
                                   				   + '<button type="button" class="btn btn-sm" style="float: right; border: 0px; color: black;" onclick="updateReplyDiv(' + rlist[i].replyNo + ');">수정</button>'
                                   		}
                                   		
                                   		if(rlist[i].replyParent == 0){	// 원댓글
                                   			value += '<div class="su_reReply">'
		        	                                	+ '<div class="su_beforeReRe dis_bl" id="sReplyEvent' + rlist[i].replyNo + '" onclick="rReply(' + rlist[i].replyNo + ');">'
		    	                                    		+ '<a id="insertReReplyBtn"><span class="fas fa-share"></span>댓글</a>'
		    	                                		+ '</div>'
		    	
		    	                            		+ '</div>';
		    	                            
                                   		}
                                   		
                  					} else{
                  						for(j = i + 1; j < rCount; j++){
	                  						if( (rlist[i].replyParent == 0) && (rlist[j].replyParent != 0) && (rlist[j].replyStatus == 'Y') && (rlist[j].replyParent == rlist[i].replyNo) ){	// 원댓이 삭제됬는데 원댓이 부모인 대댓이 있는 경우
	                  							deCount++;
	                  						} 
                  						}
                  						if(deCount > 0){
                  							if(rlist[i].replyParent == 0){
                  								value += '<span>삭제된 댓글입니다.</span>';
                  							}
                  						}
                  					}
                  					value += '</div></div>';
                  					
                  				}
                  				
                  				$("#scheReplyArea").html(value);
                  			}, error: function(){
                  				console.log("ajax 댓글 조회 실패");
                  			}
                  		});
                  	}
                  	
                 	// 대댓글 작성 영역 추가 이벤트
                    function rReply(rNo){
                    	let reId = 'sReplyEvent' + rNo;
                		let id = "sReply" + rNo;
                		let caId = "cancleReReply" + rNo;
                		let inputId = "replyContent" + rNo;
                		
                		const rReplyDiv = '<div class="su_insert_reReply" style="margin-bottom: 13px;" id="reReplyDiv' + rNo + '">'
                        						+ '<div class="su_afterReRe">'
                        							+ '<div class="su_reReply_input" style="margin-bottom: 13px;">'
                            							//+ '<span class="fas fa-share"> </span>'
                            							+ '<img src="${pageContext.request.contextPath}/resources/profile_images/defaultProfile.png" alt="">'                                        
    	                                                // + '<img src="${ loginUser.memProfile }">'
                    
                            							+ '<input type="text" placeholder="댓글 입력" id="replyContent' + rNo + '">'
                            							+ '<button type="button" class="btn btn-sm su_btn_border" style="margin-left: 6px;" onclick="addReply(' + rNo + ');">작성</button>'
                        							+ '</div></div></div>';
                        							
                		 $("#" + id).after(rReplyDiv);
	                        // 원 댓의 이벤트 제거
	                        $("#" + reId).attr("onclick", "cancleReReply(" + rNo + ")");
	                        // 댓글 입력칸 focus
	                        $("#" + inputId).focus();
                 	}
                 	
                 	// 대댓 작성 취소
                	function cancleReReply(rNo){
                		let reId = 'sReplyEvent' + rNo;
                		let divId = 'reReplyDiv' + rNo;
                		
                		let value = "";
                		$("#" + divId).remove();
                		 $("#" + reId).attr("onclick", "rReply(" + rNo + ");");
                	}
                 	
                	 // 댓글 작성 이벤트
                    function addReply(num){
                    	// num : 부모 댓글 번호
                    	let id = "replyContent" + num;
                    		
                    	if( $("#" + id).val().trim().length != 0 ){	// 유효한 댓글 작성시 => ajax로 insert 요청
                    		
                    		$.ajax({
                    			url: "rinsert.ca",
                    			data: {
                    				replyContent: $("#" + id).val(),
                    				reBoardNo: ${ s.scheNo },
                    				replyParent: num,
                    				replyWriter: "${loginUser.memName}",
                    				replyJob: "${loginUser.jobName}" 
                    			},
                    			success: function(result){
                    				if(result == "success"){
                    					$("#"+ id).val("");
                    					selectReplyList();
                    				} else{
                    					alert("댓글 작성에 실패하였습니다.");
                    				}
                    			}, error: function(){
                    				console.log("ajax 댓글 작성 실패");
                    			}
                    		});
                    	} else{	// 댓글 내용 무
                    		 alert("댓글 내용을 입력해주세요!");
                    	}
                    }
                 	
                 	// 댓글 수정 이벤트들
                    // 영역 전환
                    function updateReplyDiv(num){
                    	// num : 댓글 번호
                    	let id = "sReply" + num;
                    	let cId = "rContent" + num;
                    	let contentValue = $("#" + cId).text();
                    	console.log(contentValue);
                    	let contentId = "updateContent" + num;
                    	let value = "";
                    	value += '<div class="su_insert_reply" style="margin-bottom: 15px;">'
                        			+ '<img style="margin-left: 14px;" src="${pageContext.request.contextPath}/resources/profile_images/defaultProfile.png" alt="">'
                    
			                        + '<div class="su_reply_input">'
			                           + '<input type="text" style="width: 92%;" placeholder="댓글 입력"  id="' + contentId + '" value="' + contentValue + '">'
			                           + '&nbsp;'
	                       				+ '<button type="button" class="btn btn-sm" style="width: 45px; border: 0px; color: black; float: right;"'
	                       				+ 'onclick="cancelReply(' + num + ');">취소</button>'
			                           + '<button type="button" class="btn btn-sm" style="width: 45px; border: 0px; color: black; float: right;"'
	                       				+ 'onclick="updateReply(' + num + ');">수정</button>'
			                        + '</div>'
			                           
                     + '</div>';
                				
                		$("#" + id).html(value);
                		$("#" + contentId).focus();
                    }
                 	
                 	// 댓글 수정
                 	function updateReply(num){
	                    	// num : 댓글 번호
	                    	let id = "sReply" + num;
	                    	let contentId = "updateContent" + num; // 댓글 내용 아이디
	                    	
	                    	let value = "";
	                    	if( $("#" + contentId).val().trim().length != 0 ){
	                    		
	                    		$.ajax({
	                    			url: "rupdate.ca",
	                    			data: {
	                    				replyNo: num,
	                    				replyContent: $("#" + contentId).val()
	                    			}, success: function(r){
	                    				if(r != "fail"){
	                    					
	                    					value += '<div>'
	                    								+ '<img src="${pageContext.request.contextPath}/resources/profile_images/defaultProfile.png" alt="">'
	                    								+ '</div>'
	                                             	   + '<div class="su_reply_content">';
					
					                        			if(r.replyParent == 0){	// 원댓글
					                        				value += '<h5 style="font-weight: 600; color: black;">' + r.replyWriter + ' ' + r.replyJob + '</h5>';
					                        			} else{
					                        				value += '<h5 style="font-weight: 600; color: black;">ㄴ ' + r.replyWriter + ' ' + r.replyJob + '</h5>';
					                        			}
					                        			value += '<p id="rContent' + r.replyNo + '">' + r.replyContent + '</p>';
					                        			
					                        			if( r.replyWriter != "${ loginUser.memName }" ){
				                                   			value += '<button type="button" class="btn btn-sm" style="float: right; border: 0px; color: black;" onclick="deleteReply(' + r.replyNo + ');">삭제</button>'
				                                   				   + '<button type="button" class="btn btn-sm" style="float: right; border: 0px; color: black;" onclick="updateReplyDiv(' + r.replyNo + ');">수정</button>'
				                                   		}
					                        			if(r.replyParent == 0){	// 원댓글
				                                   			value += '<div class="su_reReply">'
						        	                                	+ '<div class="su_beforeReRe dis_bl" id="sReplyEvent' + r.replyNo + '" onclick="rReply(' + r.replyNo + ');">'
						    	                                    		+ '<a id="insertReReplyBtn"><span class="fas fa-share"></span>댓글</a>'
						    	                                		+ '</div>'
						    	
						    	                            		+ '</div>';
						    	                            
				                                   		}
					                        			
					                        			value += '</div></div>';
											
												$("#" + id).html(value);
	                    					
	                    					selectReplyList();
	                    					
	                    				} else{
	                    					alert("댓글 수정에 실패하였습니다.");
	                    				}
	                    			}, error: function(){
	    	                    		console.log("ajax 댓글 수정에 실패하였습니다.");
	    	                    	} 
	                    		});
	                    	
	                    	} else{
            					alert("댓글 내용을 입력해주세요!");
            				}
	                    }
                 	
                 	function cancelReply(num){
                    	// num : 댓글 번호
                    	let id = "sReply" + num;
                    	
                    	let value = "";
                    		
                    		$.ajax({
                    			url: "rcancel.ca",
                    			data: {
                    				replyNo: num,
                    			}, success: function(r){
                    				if(r != "fail"){
                    					
                    					value += '<div>'
            								+ '<img src="${pageContext.request.contextPath}/resources/profile_images/defaultProfile.png" alt="">'
            								+ '</div>'
                                     	   + '<div class="su_reply_content">';
		
		                        			if(r.replyParent == 0){	// 원댓글
		                        				value += '<h5 style="font-weight: 600; color: black;">' + r.replyWriter + ' ' + r.replyJob + '</h5>';
		                        			} else{
		                        				value += '<h5 style="font-weight: 600; color: black;">ㄴ ' + r.replyWriter + ' ' + r.replyJob + '</h5>';
		                        			}
		                        			value += '<p id="rContent' + r.replyNo + '">' + r.replyContent + '</p>';
		                        			
		                        			if( r.replyWriter != "${ loginUser.memName }" ){
	                                   			value += '<button type="button" class="btn btn-sm" style="float: right; border: 0px; color: black;" onclick="deleteReply(' + r.replyNo + ');">삭제</button>'
	                                   				   + '<button type="button" class="btn btn-sm" style="float: right; border: 0px; color: black;" onclick="updateReplyDiv(' + r.replyNo + ');">수정</button>'
	                                   		}
		                        			if(r.replyParent == 0){	// 원댓글
	                                   			value += '<div class="su_reReply">'
			        	                                	+ '<div class="su_beforeReRe dis_bl" id="sReplyEvent' + r.replyNo + '" onclick="rReply(' + r.replyNo + ');">'
			    	                                    		+ '<a id="insertReReplyBtn"><span class="fas fa-share"></span>댓글</a>'
			    	                                		+ '</div>'
			    	
			    	                            		+ '</div>';
			    	                            
	                                   		}
		                        			
		                        			value += '</div></div>';
										
												$("#" + id).html(value);
			                    					
			                    				//selectReplyList();
			                    					
			                    			} else{
			                    				alert("댓글 수정 취소에 실패하였습니다.");
			                    			}
			                    		}, error: function(){
			                    				console.log("ajax 댓글 수정 취소에 실패하였습니다.");
			                    		}
			                    	});
                    	
                    }
                 	
                 	// 댓글 삭제
                    function deleteReply(num){
                    	$("#deleteReply").modal("show");
                    	
                    	$(document).on("click", "#realDeleteReply", function(){
                    		$.ajax({
                    			url: "rdelete.ca",
                    			data: {replyNo: num},
                    			success: function(result){
                    				if(result > 0){
                    					$("#deleteReply").modal("hide");
                    					
                    					selectReplyList();
                    				} else{
                    					alert("댓글 삭제에 실패하였습니다.");
                    				}
                    			}, error: function(){
                    				console.log("ajax 댓글 삭제 실패");
                    			}
                    		});
                    	});
                    	
                    }
                  
                  
                  </script>
	                        
	                        
	                        
	
	                    </div>
	
	                </div>
	            </div>
	        </div>
	
	    </div>
	
	
	
	</div>    

	<jsp:include page="../common/footer.jsp" />
</body>
</html>