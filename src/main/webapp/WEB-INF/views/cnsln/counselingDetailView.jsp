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
	            <h2 class="su_sub_menu_name" style="color: black;">상담 일정 상세</h2>
	
	            <hr class="hr_line_top" style="margin-bottom: 0px;">
	            <form action="update.cn" method="post" id="updateForm">
		            <div style="display: flex;">
		                <div class="su_content_body" style="width: 80%;">
		    				<input type="hidden" name="cnslnNo" value="${ c.cnslnNo }">
		    				<input type="hidden" name="cnslnContent" value="${ c.cnslnContent }">
		    				<input type="hidden" name="cnslnReal" value="${ c.cnslnReal }">
		    				
 		                    <table id="eventForm">
		                        <tr>
		                            <td width="5%;"><span class="fas fa-star-of-life fontRed">&nbsp;</span></td>
		                            <td><span>&nbsp;내담자명</span></td>
		                            <td style="width: 80%;">
		                            &ensp; &ensp;<input type="text" name="cnslnTitle" id="cnslnTitle" placeholder="내담자명 입력"  onclick="searchStudentDiv();" style="width:300px;" value="${ c.cnslnTitle }" required>
		                            </td>
		                        </tr>
		
		                        <tr>
		                            <td width="5%;"><span class="fas fa-star-of-life fontRed">&nbsp;</span></td>
		                             <td><span>&nbsp;상담 시간</span></td>
		                             <td>
		                                 &ensp; &ensp;<input type="date" id="cnslnStartD" required>&nbsp;
		                                 <input type="time"  id="cnslnStartT"  required>
		                                 <span> ~ </span>
		                                 &nbsp;<input type="time" name="cnslnEndT" id="cnslnEndT" required>
		                                 
		                                 <span style="display: none;" id="sDT">${ c.cnslnStartDate }</span>
		                                <span style="display: none;" id="eDT">${ c.cnslnEndDate }</span>
		                                 <input type="hidden" name="cnslnStartDate">
		                                <input type="hidden" name="cnslnEndDate">
		                             </td>
		                        </tr>
		
		                        <tr>
		                            <td width="5%;"><span>&nbsp;</span></td>
		                            <td><span>&nbsp;담당자</span></td>
		                            <td id="chargeArea">
		                                <!-- 선택한 담당자 영역 -->
		
		                                <span style="cursor: pointer;" id="addAttendee"> &ensp;&ensp;+ 담당자 추가</span>
		                            </td>
		                        </tr>
								
								<span style="display: none;" id="chargeNo2">${ c.cnslnChargeNo }</span>
								<span style="display: none;" id="chargeList2">${ c.cnslnChargeList }</span>
								<input type="hidden" id="cnslnChargeNo" name="cnslnChargeNo" value="${ c.cnslnChargeNo }">
								<input type="hidden" id="cnslnChargeList" name="cnslnChargeList" value="${ c.cnslnChargeList }">
								<input type="hidden" name="cnslnWriter" value="${ loginUser.memNo }">
								<input type="hidden" name="studentPhone" value="${ s.studentPhone }" >
								<input type="hidden" name="studentNo" value="${ c.studentNo }">
								<input type="hidden" name="studentName" value="${ s.studentName }">
								<input type="hidden" name="cnslnEc" value="${ c.cnslnEc }">
								
		                        <tr>
		                            <td width="5%;"><span class="fas fa-star-of-life fontRed">&nbsp;</span></td>
		                             <td><span>&nbsp;전화번호</span></td>
		                             <td width="670px;">
		                             &ensp;&ensp;&ensp;<input type="text" name="cnslnPhone" id="cnslnPhone" value="${ c.cnslnPhone }" style="width: 640px;" placeholder="학생의 전화번호를 입력해주세요"></span>
		                             </td>
		                        </tr>
		                        
		                        <tr>
	                             <td width="5%;"><span class="fas fa-star-of-life fontRed">&nbsp;</span></td>
	                             <td><span>&nbsp;이메일</span></td>
	                             <td width="670px;">
	                             &ensp;&ensp;&ensp;<input type="text" name="studentEmail" id="studentEmail" value="${ s.studentEmail }" style="width: 640px;" placeholder="학생의 이메일을 입력해주세요" required>
	                             </td>
	                         </tr>
	                         
	                         <tr>
	                             <td width="5%;"><span class="fas fa-star-of-life fontRed">&nbsp;</span></td>
	                             <td><span>&nbsp;생년월일</span></td>
	                             <td width="670px;">
	                             &ensp;&ensp;&ensp;<input type="text" name="studentBirth" id="studentBirth" value="${ s.studentBirth }" style="width: 640px;" placeholder="학생의 생년월일 6자를 입력해주세요" required>
	                             </td>
	                         </tr>
	                         
	                         <tr>
	                             <td width="5%;"><span class="fas fa-star-of-life fontRed">&nbsp;</span></td>
	                             <td><span>&nbsp;성별</span></td>
	                             <td width="670px;">
	                             	<c:if test="${ s.studentGender eq 'M' }">
	                             		&ensp;&ensp;&ensp;<input type="radio" name="studentGender" id="genderM" value="M" checked> &ensp;&ensp;남자 &ensp;&ensp;&ensp;<input type="radio" name="studentGender" id="genderF" value="F"> &ensp;&ensp;여자
	                             	</c:if>
	                             	<c:if test="${ s.studentGender eq 'F' }">
	                             		&ensp;&ensp;&ensp;<input type="radio" name="studentGender" id="genderM" value="M"> &ensp;&ensp;남자 &ensp;&ensp;&ensp;<input type="radio" name="studentGender" id="genderF" value="F" checked> &ensp;&ensp;여자
	                             	</c:if>
	                             </td>
	                         </tr>
	                         
	                         
		
		                        <tr>
		                            <td style="padding-top: 13px; vertical-align: top;"><span class="fas fa-star-of-life fontRed">&nbsp;</span></td>
		                             <td style="vertical-align: top;">
		                                 <span style="display: inline-block; margin-top: 10px;">&nbsp;상담 주제</span>
		                             </td>
		                             <td>
		                             &ensp;&ensp;&ensp;<textarea style="width: 640px;" name="cnslnTopic" id="cnslnTopic" placeholder="상담 주제를 입력해주세요">${ c.cnslnTopic }</textarea>
		                             </td>
		                        </tr>
		
		                    </table>
		                    
		                    <!-- 담당자 추가 창 -->
	                     <div class="su_ph_div dis_no ui-draggable" id="attCalList" style="top: 195px; left: 1070px;">
	                         <aside class="ph_aside">
	                             <div class="su_ph_header" style="position: static">
	                                 <div class="su_ph_title">
	                                     <h5 class="mt-1 mb-2" id="moveCal" style="color: black;">담당자 추가<span class="fas fa-xmark" id="xBtn" style="cursor: pointer;"></span></h5>
	                                 </div>
	                             </div>
	                         </aside>
	                         <div style="text-align: center;">
	                             <input type="text" id="chargeKeyword" name="suPhKeyword" placeholder="이름/직책">
	                             <button type="button" class="su_btn_border btn-sm" onclick="searchCharge();">검색</button>
	                         </div>
	                         
	                         <hr class="hr_line">
	
	                         <div class="su_ph_body">
	                             <div class="div_left_line" id="listArea" style="margin-top: -1rem;">
	                             
	                             	<c:forEach var="m" items="${ mList }">
	                               		<c:if test="${ m.deptCode eq 'DN' }">
	                               			<div class="su_ph_line ph_padding" onclick="chooseCharge(${ m.memNo });">
			                                    <span style="font-size: 20px;">&nbsp;</span>
			                                    <span class="fas fa-user"></span>
			                                    <span>&nbsp; ${ m.memName } &nbsp; ${ m.jobName }</span>
			                                </div>
		                                </c:if>
		                            </c:forEach>
	                                 
	                                 <!-- 운영부 주소록 -->
	                                 <div class="su_ph_line">
	                                     <div class="collapsed ph_padding" data-toggle="collapse" data-target="#promoList" aria-expanded="true" aria-controls="collapseTwo">
	                                         <span style="font-size: 20px;">-&nbsp;</span>
	                                         <span style="font-size: 20px;">+&nbsp;</span>
	                                         <span>&nbsp; 홍보팀</span>
	                                     </div>
	
	                                     <!-- 홍보팀 리스트 -->
	                                     <div id="promoList" class="collapse div_left_line" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
	                                         <table class="su_Tb">
	                                         
	                                         	<c:forEach var="m" items="${ mList }">
	                                        		<c:if test="${ m.deptCode eq 'D3' }">
			                                            <tr style="width: 100%;" class="ph_padding">
			                                                <td width="90%;">
			                                                    <div class="su_ph_line" onclick="chooseCharge(${ m.memNo });">
			                                                        <span style="font-size: 20px;">-&nbsp;</span>
			                                                        <span class="fas fa-user"></span>
			                                                        <span>&nbsp; ${ m.memName } &nbsp; ${ m.jobName }</span>
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
	                     
	                     <!-- 학생 검색 창 -->
	                     <div class="su_ph_div dis_no" id='showStudent' style="left: 1168px; height: 360px;">
	                     	<aside class="ph_aside">
	                             <div class="su_ph_header" style="position: static">
	                                 <div class="su_ph_title">
	                                     <h5 class="mt-1 mb-2" id="moveCal" style="color: black;">학생 명단<span class="fas fa-xmark" id="xBtn2" style="cursor: pointer;"></span></h5>
	                                 </div>
	                             </div>
	                         </aside>
	                         <div style="text-align: center;">
	                             <input type="text" id="studentKeyword" name="suPhKeyword" placeholder="이름 검색">
	                             <button type="button" class="su_btn_border btn-sm" onclick="searchStudent();">검색</button>
	                         </div>
	                         
	                         <hr class="hr_line">
	                         
	                         
	                     	<div>
	                     		<table class="su_Tb" id="studentArea">
	                                         
                              	<c:forEach var="s" items="${ sList }">
                                	<tr style="width: 100%;" class="ph_padding">
                                    	<td width="90%;">
		                                     <div class="su_ph_line" onclick="chooseStudent(${ s.studentNo });">
	                                             <span style="font-size: 20px;">-&nbsp;</span>
	                                             <span class="fas fa-user"></span>
	                                             <span id="sName${s.studentNo }">&nbsp; ${ s.studentName }</span>
	                                         </div>
                                   		</td>
                                	</tr>
	                           </c:forEach>
                                  
                              </table>
	                     	</div>
	                     </div>    
		
		                    <br><br>
		
		                    <div class="su_btn_two_center" style="width: 80%;">
		                    	<c:if test="${ loginUser.memNo == c.cnslnWriter }">
		                        	<button type="button" class="btn su_btn_two su_btn_border" id="updateBtn" data-toggle="modal" data-target="#noContent">수정</button>
		                        	<button type="button" class="btn su_btn_two su_btn_border" id="deleteBtn" data-toggle="modal" data-target="#delete">삭제</button>
		                        </c:if>
		                        <c:if test="${ loginUser.memNo != c.cnslnWriter }">
		                        	<button type="button" class="btn su_btn_two su_btn_border" id="updateBtn" disabled>수정</button>
		                        	<button type="button" class="btn su_btn_two su_btn_border" id="deleteBtn" data-toggle="modal" data-target="#delete" disabled>삭제</button>
		                        </c:if>
		                        
		                        <button type="button" class="btn su_btn_two su_btn_border" onclick="location.href='list.cn';">돌아가기</button>
		                        <button type="button" class="btn su_btn_two su_btn_border" onclick="location.href='detail.tcn?cNo=${ c.cnslnNo }';">상담진행</button>
		                    </div>
		                    
		                     <script>
		                    	$(document).ready(function(){
		                    		
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
		                            
		                            $("#cnslnStartD").val(sD);
		                            $("#cnslnStartT").val(sT);
		                            $("#cnslnEndT").val(eT);
		                            
		                         	// 참석자가 있을 경우 화면에 표시
		                         	if( $("#chargeNo2").text() != "" ){
		                         		// 맨 뒤 콤마 제거
		                         		var no = $("#chargeNo2").text();
		                         		var li = $("#chargeList2").text();
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
		                         		var val = $("#chargeArea").html();
		                         		
		                         		for(let i = 0; i < anArr.length; i++){
		                         			val += ' <div class="su_atndDiv" id="charge' + anArr[i] + '">'
													+ '<span>' + alArr[i] + '</span>';
												if( ${ loginUser.memNo == c.cnslnWriter }){
													val += '<button class="btn" type="button" onclick="back(' + anArr[i] + ');">X</button>';
												} 
													val += '</div> &nbsp;';
		                         		}
		                         		$("#chargeArea").html(val);
		                         		
		                         	}
		                         	
		                         	
		                    	})
	                         	
	                            // 선택한 참석자 추가
	                            function chooseCharge(mNo){
		                        	var value = $("#chargeArea").html();
		                        	var chargeNoStr = $("#chargeNo2").text()
		                        	var chargeListStr = $("#chargeList2").text();
		                        	
	                            	$.ajax({
	                            		url: "chcharge.cn",
	                            		data: {memNo: mNo},
	                            		success: function(m){
	                            			//console.log(atndListStr);	// 멤버 객체
	                            			var chargeNo = m.memNo;
	                            			var chargeList = m.memName + " " + m.jobName;
	                            			chargeNoStr += chargeNo + ",";
	                            			chargeListStr += chargeList + ",";
	                            			
	                            			$("#chargeNo2").text(chargeNoStr);	// 참석자 번호 리스트
	                            			$("#chargeList2").text(chargeListStr);	// 참석자 명단 리스트
	                            			$("#cnslnChargeNo").val($("#chargeNo2").text());
	                            			$("#cnslnChargeList").val($("#chargeList2").text());
	                            			console.log($("#cnslnChargeList").val());
	                            			
	                            			var noList = chargeNo + chargeList;
	                            			//console.log($("#scheAtndList").val());
											value += ' <div class="su_atndDiv" id="charge' + chargeNo + '">'
													+ '<span>' + chargeList + '</span>'  
													+ '<button class="btn" type="button" onclick="back(' + chargeNo + ');">X</button>'
												   + '</div> &nbsp;';
												   
											$("#chargeArea").html(value);
	                            			
	                            		}, error: function(){
	                            			console.log("ajax 참석차 추가 실패");
	                            		}
	                            	});
	                                
	                            }
		                        
		                        // 참석자 번호 리스트 삭제 클릭 이벤트
		                        function back(no){
		                        	// no : 선택한 멤버 변호
		                        	var id="charge" + no;
		                        	var nolist = $("#chargeNo2").text();
		                        	//console.log(nolist);
		                        	
		                        	//console.log($("#" + id).children().eq(0).text());
		                        	var name = $("#" + id).children().eq(0).text();
		                        	
		                        	$("#" + id).remove();
		                        	
		                        	no = no + ",";
		                        	nolist = nolist.replace(no, "");
		                        	$("#chargeNo2").text(nolist);
		                        	$("#cnslnChargeNo").val($("#chargeNo2").text());
		                        	//console.log($("#cnslnChargeNo").val());
		                        	backList(name);
		                        }
		                        
		                        // 참석자 이름 리스트 삭제 이벤트
		                        function backList(name){
		                        	//console.log(name);
		                        	var namelist = $("#chargeList2").text();
		                        	
		                        	name = name + ",";
		                        	//console.log(name);
		                        	namelist = namelist.replace(name, "");
		                        	console.log(namelist);
		                        	$("#chargeList2").text(namelist);
		                        	$("#cnslnChargeList").val($("#chargeList2").text());
		                        	//console.log($("#cnslnChargeList").val());
		                        }
	                        
	                        // 담당자 검색 이벤트
	                        function searchCharge(){
	                        	var key = $("#chargeKeyword").val();
	                        	var value = "";
	                        	var pCount = 0;	// 홍보
	                        	$.ajax({
	                        		url: "search.cn",
	                        		data: {keyword: key},
	                        		success: function(list){
	                        			console.log(list);
	                        			
	                        			for(let i = 0; i < list.length; i++){
	                        				if(list[i].deptCode == 'DN'){
	                        					value += '<div class="su_ph_line ph_padding" onclick="chooseCharge(' + list[i].memNo + ');">'
	                        								+ '<span style="font-size: 20px;">&nbsp;</span>'
	                        								+ '<span class="fas fa-user"></span>'
	            		                                    + '<span>&nbsp; ' + list[i].memName + ' &nbsp; ' + list[i].jobName + '</span>'
	            		                                    + '</div>';
	                        				}
	                        			}
                            			
	                                            
										for(let i = 0; i < list.length; i++){
	                        				if(list[i].deptCode == 'D3'){
	                        					pCount++;
	                        				}
	                        			}  
										
										if(pCount > 0){
											value += '<div class="su_ph_line"><div class="collapsed ph_padding" data-toggle="collapse" data-target="#promoList" aria-expanded="true" aria-controls="collapseTwo">'
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
                                                				+ '<div class="su_ph_line" onclick="chooseCharge(' + list[i].memNo + ');">'
                                                    				+ '<span style="font-size: 20px;">-&nbsp;</span>'
                                                    				+ '<span class="fas fa-user"></span>'
                                                    				+ '<span>&nbsp; ' + list[i].memName + ' &nbsp; ' + list[i].jobName + '</span>'
                                                    			+ '</div></td></tr>';
                                    		}
                                    	}
                                    	
                                    	if(pCount > 0){
                                    		value += '</table></div></div></div>';
                                    	}
                                
										
	                                    if(pCount > 0){
	                                    	value += '</div></div>';
	                                    }
	                                    
	                        			$("#listArea").html(value);   
	                        			}, error: function(){
	                        			console.log("ajax 검색 실패");
	                        		}
	                        	});
	                        }
	                        
	                        $("#updateBtn").click(function(){
	                        	// 필수사항의 value가 비어있으면 모달창
                                // 입력했으면 data-target attr 지우기
                                if( ($("#cnslnTitle").val() != "") && ($("#cnslnStartT").val() != "") && ($("#cnslnEndT").val() != "")
                                		&& ($("#cnslnPhone").val() != "") && ($("#cnslnTopic").val() != "") ){
                                	$("#updateBtn").removeAttr("data-target");
                                	
                                	// 시작일 종료일에 날짜 시간 합치기
                                	let cnslnStartDate = $("#cnslnStartD").val();
									cnslnStartDate += " ";
									cnslnStartDate += $("#cnslnStartT").val();
									
									let cnslnEndDate = $("#cnslnStartD").val();
									cnslnEndDate += " ";
									cnslnEndDate += $("#cnslnEndT").val();
	                                // console.log(scheStartDate);
	                                
	                                $("input[name=cnslnStartDate]").val(cnslnStartDate);
	                                $("input[name=cnslnEndDate]").val(cnslnEndDate);
	                                
	                                $("#updateForm").submit();
	                                
	                                
                                } else{
                                	
                                	$("#updateBtn").attr("data-target", "#noContent");
                                	
                                }
                                
                            });
	                        
	                     // 학생 리스트 영역 출력
	                        function searchStudentDiv(){
	                        	$("#showStudent").removeClass("dis_no");
                                $("#showStudent").addClass("dis_bl");
	                        }
	                        
	                        $("#xBtn2").click(function(){
	                        	$("#showStudent").removeClass("dis_bl");
                                $("#showStudent").addClass("dis_no");
                            })
	                        
	                        // 학생 리스트 검색
	                        function searchStudent(){
	                        	var value = "";
	                        	var key = $("#studentKeyword").val();
	                        	$.ajax({
	                        		url :"stsearch.cn",
	                        		data:{ key: key},
	                        		success: function(list){
	                        			console.log(list);
	                        			for(let i = 0; i < list.length; i++){
		                        			value += '<tr style="width: 100%;" class="ph_padding">'
	                                    				+ '<td width="90%;">'
			                                     			+ '<div class="su_ph_line" onclick="chooseStudent(' + list[i].studentNo + ');">'
		                                             		+ '<span style="font-size: 20px;">-&nbsp;</span>'
		                                             		+ '<span class="fas fa-user"></span>'
		                                             		+ '<span id="sName' + list[i].studentNo + '">&nbsp;' + list[i].studentName + '</span>'
		                                         		+ '</div></td></tr>';
	                        				
	                        			}
                                	
                                	$("#studentArea").html(value);
	                        		}, error: function(){
	                        			console.log("ajax 학생 검색 실패");
	                        		}
	                        	});
	                        }
	                        
	                        
	                        // 학생 선택
	                        function chooseStudent(sNo){
	                        	var length = ${ sList.size() };
	                        	$.ajax({
	                        		url: "stst.cn",
	                        		data: {sNo: sNo},
	                        		success: function(s){
	                        			$("#cnslnTitle").val(s.studentName);
	                        			$("input[name=studentPhone]").val(s.studentPhone);
	                        			
	                        			var phone = s.studentPhone;
	                        			var p = phone.split('-');
	                        			var ph = p[0] + p[1] + p[2];
	                        			
	                        			$("input[name=cnslnPhone]").val(ph);
	                        			$("input[name=cnslnEc]").val("C");
	                        			$("input[name=studentName]").val(s.studentName);
	                        			$("input[name=studentPhone]").val(ph);
	                        			$("input[name=studentEmail]").val(s.studentEmail);
	                        			$("input[name=studentBirth]").val(s.studentBirth);
	                        			if(s.studentGender == 'M'){
	                        				$("#genderM").attr("checked", true);
	                        			} else{
	                        				$("#genderF").attr("checked", true);
	                        			}
	                        			$("input[name=studentNo]").val(s.studentNo)
	                        			
	                        		}, error: function(){
	                        			console.log("ajax 학생 조회 실패");
	                        		}
	                        	});
	                        }
	                    	</script>
		
		                    
		                    <br><br><br><br><br>
		
		                    <!-- 삭제 모달창 -->
		                    <div class="modal" id="delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		                        <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
		                            <!--Content-->
		                            <div class="modal-content modal_alert">
		                                
		                                <!--Body-->
		                                <div class="modal-body text-center modal_alert_child">
		                                    <div style="margin-top: 1.5rem;">
		                    
		                                        <h5 class="mt-1 mb-2" style="color: black">정말 삭제하시겠습니까?</h5>
		                                        <br>                                
		                                        <div class="text-center mt-4"> 
		                                            <button type="button" id="realDelete" class="btn su_btn_all su_btn_medium"
		                                            onclick="location.href='delete.cn?cNo=${ c.cnslnNo }';">확인</button>
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
		                
		                <!-- 댓글 영역 -->
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
                       	<div id="cnslnReplyArea" style="padding-left: 5px;"></div>
	                        
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
                  			url: "rlist.cn",
                  			data: {no: ${ c.cnslnNo }},
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
                  				
                  				$("#cnslnReplyArea").html(value);
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
                    			url: "rinsert.cn",
                    			data: {
                    				replyContent: $("#" + id).val(),
                    				reBoardNo: ${ c.cnslnNo },
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
	                    			url: "rupdate.cn",
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
                    			url: "rcancel.cn",
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
                    			url: "rdelete.cn",
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