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
	<style>
		input[:radio] {
		 color: red;
		}
	</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp" />
	
	 <div>
	     
	     <div class="su_contentArea">
	         <div class="su_content_header">
	             <h2 class="su_sub_menu_name" style="color: black;">상담 일정 등록</h2>
	
	             <hr class="hr_line_top">
	
	             <form action="insert.cn" method="post" id="insertForm">
	                 <div class="su_content_body" style="width: 90%;">
	 
	                     <table id="eventForm">
	                         <tr>
	                             <td width="5%;"><span class="fas fa-star-of-life fontRed">&nbsp;</span></td>
	                             <td><span>&nbsp;내담자명</span></td>
	                             <td style="width: 80%;">
	                             &ensp; &ensp;<input type="text" id="cnslnTitle" name="cnslnTitle" placeholder="내담자명 입력" style="width:300px;" onclick="searchStudentDiv();" required>
	                             </td>
	                         </tr>
	
	                         <tr>
	                             <td width="5%;"><span class="fas fa-star-of-life fontRed">&nbsp;</span></td>
	                             <td><span>&nbsp;상담 시간</span></td>
	                             <td>
	                                 &ensp; &ensp;<input type="date" id="cnslnStartD" value='${ day }' required>&nbsp;
	                                 <input type="time"  id="cnslnStartT"  required>
	                                 <span> ~ </span>
	                                 &nbsp;<input type="time" name="cnslnEndT" id="cnslnEndT" required>
	                                 
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
	                         
	                         <span style="display: none;" id="chargeNo2"></span>
							<span style="display: none;" id="chargeList2"></span>
							<input type="hidden" id="cnslnChargeNo" name="cnslnChargeNo" value="">
							<input type="hidden" id="cnslnChargeList" name="cnslnChargeList" value="">
							<input type="hidden" name="cnslnWriter" value="${ loginUser.memNo }">
							<input type="hidden" name="studentPhone" >
							<input type="hidden" name="studentNo" value="0">
							<input type="hidden" name="studentName">
							<input type="hidden" name="cnslnEc" value="E">
	
	                         <tr>
	                             <td width="5%;"><span class="fas fa-star-of-life fontRed">&nbsp;</span></td>
	                             <td><span>&nbsp;전화번호</span></td>
	                             <td width="670px;">
	                             &ensp;&ensp;&ensp;<input type="text" name="cnslnPhone" id="cnslnPhone" style="width: 640px;" placeholder="학생의 전화번호를 입력해주세요" required>
	                             </td>
	                         </tr>
	                         
	                         <tr>
	                             <td width="5%;"><span class="fas fa-star-of-life fontRed">&nbsp;</span></td>
	                             <td><span>&nbsp;이메일</span></td>
	                             <td width="670px;">
	                             &ensp;&ensp;&ensp;<input type="text" name="studentEmail" id="studentEmail" style="width: 640px;" placeholder="학생의 이메일을 입력해주세요" required>
	                             </td>
	                         </tr>
	                         
	                         <tr>
	                             <td width="5%;"><span class="fas fa-star-of-life fontRed">&nbsp;</span></td>
	                             <td><span>&nbsp;생년월일</span></td>
	                             <td width="670px;">
	                             &ensp;&ensp;&ensp;<input type="text" name="studentBirth" id="studentBirth" style="width: 640px;" placeholder="학생의 생년월일 6자를 입력해주세요" required>
	                             </td>
	                         </tr>
	                         
	                         <tr>
	                             <td width="5%;"><span class="fas fa-star-of-life fontRed">&nbsp;</span></td>
	                             <td><span>&nbsp;성별</span></td>
	                             <td width="670px;">
	                             &ensp;&ensp;&ensp;<input type="radio" name="studentGender" id="genderM" value="M"> &ensp;&ensp;남자 &ensp;&ensp;&ensp;<input type="radio" name="studentGender" id="genderF" value="F"> &ensp;&ensp;여자
	                             </td>
	                         </tr>
	
	                         <tr>
	                             <td style="padding-top: 13px; vertical-align: top;"><span class="fas fa-star-of-life fontRed">&nbsp;</span></td>
	                             <td style="vertical-align: top;">
	                                 <span style="display: inline-block; margin-top: 10px;">&nbsp;상담 주제</span>
	                             </td>
	                             <td>
	                             &ensp;&ensp;&ensp;<textarea style="width: 640px;" name="cnslnTopic" id="cnslnTopic" placeholder="상담 주제를 입력해주세요" required></textarea>
	                             </td>
	                         </tr>
	
	                     </table>
	
	                     <!-- 담당자 추가 창 -->
	                     <div class="su_ph_div dis_no ui-draggable" id="attCalList" style="top: 195px; left: 1182px;">
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
	                             
	
	                         })
	                         
	                         // 선택한 담당자 추가
                            function chooseCharge(mNo){
	                        	var value = $("#chargeArea").html();
	                        	var chargeNoStr = $("#chargeNo2").val();
	                        	var chargeListStr = $("#chargeList2").val();
	                        	
                            	$.ajax({
                            		url: "chcharge.cn",
                            		data: {memNo: mNo},
                            		success: function(m){
                            			//console.log(m);	// 멤버 객체
                            			var chargeNo = m.memNo;
                            			var chargeList = m.memName + " " + m.jobName;
                            			chargeNoStr += chargeNo + ",";
                            			chargeListStr += chargeList + ",";
                            			
                            			$("#chargeNo2").val(chargeNoStr);	// 담당자 번호 리스트
                            			$("#chargeList2").val(chargeListStr);	// 담당자 명단 리스트
                            			$("#cnslnChargeNo").val($("#chargeNo2").val());
                            			$("#cnslnChargeList").val($("#chargeList2").val());
                            			
                            			var noList = chargeNo + chargeList;
                            			
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
	                        
	                        // 담당자 번호 리스트 삭제 클릭 이벤트
	                        function back(no){
	                        	// no : 선택한 멤버 변호
	                        	var id="charge" + no;
	                        	var nolist = $("#chargeNo2").val();
	                        	//console.log(nolist);
	                        	
	                        	//console.log($("#" + id).children().eq(0).text());
	                        	var name = $("#" + id).children().eq(0).text();
	                        	
	                        	$("#" + id).remove();
	                        	
	                        	no = no + ",";
	                        	nolist = nolist.replace(no, "");
	                        	$("#chargeNo2").val(nolist);
	                        	$("#cnslnChargeNo").val($("#chargeNo2").val());
	                        	//console.log($("#atndNo2").val());
	                        	backList(name);
	                        }
	                        
	                        // 담당자 이름 리스트 삭제 이벤트
	                        function backList(name){
	                        	//console.log(name);
	                        	var namelist = $("#chargeList2").val();
	                        	
	                        	name = name + ",";
	                        	//console.log(name);
	                        	namelist = namelist.replace(name, "");
	                        	console.log(namelist);
	                        	$("#chargeList2").val(namelist);
	                        	$("#cnslnChargeList").val($("#chargeList2").val());
	                        }
	                        
	                        // 담당자 검색 이벤트
	                        function searchCharge(){
	                        	var key = $("#chargeKeyword").val();
	                        	var value = "";
	                        	var pCount = 0;	// 홍보
	                        	$.ajax({
	                        		url: "search.cn",
	                        		data: {
	                        			keyword: key,
	                        			memNo : ${ loginUser.memNo }
	                        			},
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
	                     
	                     <br><br>
	
	                     <div class="su_btn_two_center" style="width: 80%;">
	                         <button type="button" class="btn su_btn_two su_btn_all" id="submitBtn" data-toggle="modal" data-target="#noContent">등록</button>
	                         <button type="button" class="btn su_btn_two su_btn_border" onclick="history.back();">취소</button>
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
		                                // 필수사항의 value가 비어있으면 모달창
		                                // 입력했으면 data-target attr 지우기
		                                if( ($("#cnslnTitle").val() != "") && ($("#cnslnStartT").val() != "") && ($("#cnslnEndT").val() != "")
		                                		&& ($("#cnslnPhone").val() != "") && ($("#cnslnTopic").val() != "") ){
		                                	$("#submitBtn").removeAttr("data-target");
		                                	
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
			                                $("input[name=studentPhone]").val($("input[name=cnslnPhone]").val());
				 	                        $("input[name=studentName]").val($("input[name=cnslnTitle]").val());
			                                
			                                $("#insertForm").submit();
			                                
			                                
		                                } else{
		                                	
		                                	$("#submitBtn").attr("data-target", "#noContent");
		                                	
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