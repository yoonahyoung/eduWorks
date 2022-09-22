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
	
	<div style="display:flex;">
	
	    <!-- sub menu -->
	    <div class="container-fluid su_content_body su_sub_menu_div" style="width: 15%;">
	        <nav class="menu-sidebar" style="width: 100%;">
	            <div class="insider">
	                <h4 style="color: black;">캘린더</h4>
	                
	                <div class="su_btn_center">
	                    <button type="button" id="enrollBtn" class="btn btn-lg su_btn_border" style="width: 80%;">일정 등록</button>
	                </div>
	                <br>
	
	
	                <!-- 서브메뉴 내 캘린더 -->
	                <ul class="accordion" id="accordionSidebar" >
	                    <li class="su_sub_menu_item">
	                        
	                        <!-- 변경 버튼 클릭 전 -->
	                        <span class="fas fa-pen pen_icon dis_bl" id="pen1"></span>
	
	                        <!-- 변경버튼 클릭 후 -->
	                        <div class="dis_no" id="nopen1">
	                            <!-- <span class="fas fa-xmark pen_icon" id="x1"></span> -->
	                            <span class="fas fa-check pen_icon" id="check1"></span>
	                        </div>
	                        
	                        <div class="collapsed su_sub_menu_list" id="mycalCol" style="width:70%;" data-toggle="collapse" data-target="#myCalendar" aria-expanded="true" aria-controls="collapseTwo">
	                            <span>&nbsp;내 캘린더</span>
	                        </div>
	
	                        <span style="display:none" id="calArr">${ calArr }</span>
	                    
	
	                        <div id="myCalendar" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
	                            <table id="tb_myCal">
	                                <!-- script에서 채워짐 -->
	                            </table>
	                            <a type="button" class="addCal" data-toggle="modal" data-target="#addMyCal">+ 내 캘린더 추가</a>
	                        </div>
	                    </li>
	                </ul>
	                
	                 <!-- 서브메뉴 관심 캘린더 -->
                     <ul class="accordion" id="accordionSidebar" >
                         <li class="su_sub_menu_item">

                             <!-- 변경 버튼 클릭 전 -->
                             <span class="fas fa-pen pen_icon dis_bl" id="pen2"></span>

                             <!-- 변경버튼 클릭 후 -->
                             <div class="dis_no" id="nopen2">
                                 <!-- <span class="fas fa-xmark pen_icon" id="x1"></span> -->
                                 <span class="fas fa-check pen_icon" id="check1"></span>
                             </div>

                             <div class="collapsed su_sub_menu_list" style="width:70%;" data-toggle="collapse" data-target="#attCalendar" aria-expanded="true" aria-controls="collapseTwo">
                                 <span>&nbsp;관심 캘린더</span>
                             </div>

							<span style="display:none" id="lcalArr"></span>
								
                             <div id="attCalendar" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                                 <table id="tb_likeCal" style="margin-left: -42px;">
                                     
                                 </table>
                                 
                                 <a type="button" class="addCal" id="addAttCal">+ 관심 캘린더 추가</a>
                             </div>
                         </li>
                     </ul>
                     
                        <!-- 관심 캘린더 추가 창 -->
	                    <div class="su_ph_div dis_no ui-draggable" id="attCalList" style="top: 350px; left: 470px;">
	                        <aside class="ph_aside">
	                            <div class="su_ph_header" style="position: static">
	                                <div class="su_ph_title">
	                                    <h5 class="mt-1 mb-2" id="moveCal" style="color: black; cursor: move;">관심 캘린더 추가<span class="fas fa-xmark" id="xBtn" style="cursor: pointer;"></span></h5>
	                                </div>
	                            </div>
	                        </aside>
	                        
	                        
	                        <hr class="hr_line">
	
	                        <div class="su_ph_body">
	                            <div class="div_left_line" id="atndArea" style="margin-top: -1rem;">
	                                	<c:forEach var="a" items="${ aList }">
	                                		<c:if test="${ a.deptCode eq 'DN' }">
	                                			<div class="su_ph_line ph_padding" onclick="chooseAtt(${ a.memNo });">
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
			                                                    <div class="su_ph_line" onclick="chooseAtt(${ a.memNo });">
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
	                                        		<c:if test="${ a.deptCode eq 'D3' }">
			                                            <tr style="width: 100%;" class="ph_padding">
			                                                <td width="90%;">
			                                                    <div class="su_ph_line" onclick="chooseAtt(${ a.memNo });">
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
			                                                    <div class="su_ph_line" onclick="chooseAtt(${ a.memNo });">
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
			                                                    <div class="su_ph_line" onclick="chooseAtt(${ a.memNo });">
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
	                    
	                    
	
	                <!-- 내 캘린더 추가 모달창 -->
	                <div class="modal fade" id="addMyCal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                    <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
	                        <!--Content-->
	                        <div class="modal-content modal_alert">
	            
	                            <!--Body-->
	                            <div class="modal-body text-center modal_alert_child">
	            
	                                <h5 class="mt-1 mb-2" style="color: black;">내 캘린더 추가</h5>
	                                <br>
	            
	                                <div class="md-form ml-0 mr-0">
	                                    <input type="text" id="myCalName" class="form-control form-control-sm validate ml-0">
	                                </div>
	            
	                                <div class="text-center mt-4">
	                                    <button type="button" id="insertMyCal" class="btn su_btn_all su_btn_medium">확인</button>
	                                    <button type="button" class="btn su_btn_border su_btn_medium" data-dismiss="modal">취소</button>
	                                </div>
	                                
	                            </div>
	            
	                        </div>
	                    </div>
	                </div>
	                
	                <!-- 내 캘린더 수정 모달창 -->
	                <div class="modal fade" id="updateMyCal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                    <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
	                        <!--Content-->
	                        <div class="modal-content modal_alert">
	            
	                            <!--Body-->
	                            <div class="modal-body text-center modal_alert_child">
	            
	                                <h5 class="mt-1 mb-2" style="color: black;">내 캘린더 이름 변경</h5>
	                                <br>
	            
	                                <div class="md-form ml-0 mr-0">
	                                    <input type="text" id="chCalName" class="form-control form-control-sm validate ml-0">
	                                </div>
	            
	                                <div class="text-center mt-4">
	                                    <button type="button" id="updateMyCalBtn" class="btn su_btn_all su_btn_medium">수정</button>
	                                    <button type="button" class="btn su_btn_border su_btn_medium" data-dismiss="modal">취소</button>
	                                </div>
	                                
	                            </div>
	            
	                        </div>
	                    </div>
	                </div>
	                
	                <!-- 내 캘린더 관련 script -->
	                <script>
	                	$(function(){
	                		
	                		calList();
	                		selectMycalList();
	                		selectLikecalList();
	                		
	                	})
	                	
	                	// 내 캘린더 리스트 출력 이벤트
	                	function selectMycalList(){
	                		$.ajax({
	                			url: "mclist.ca",
	                			data: { memNo: ${ loginUser.memNo } },
	                			success: function(list){
	                				
	                				let value = "";
	                				let str = "";
	                                
	                                for(let i = 0; i < list.length; i++){
		                                value += '<tr style="width: 100%;">'
		                                    		+ '<td width="20%;"><span class="myNo" style="color: white !important;">' + list[i].mycalNo + '</span></td>'
		                                    		+ '<td><input type="checkbox" name="mycalList" checked></td>';
		                                    	if(i == 0){
		                                    		value += '<td width="90%;" id="mcName' + list[i].mycalNo + '"> &nbsp;' + list[i].mycalName + '</td>';
		                                    	} else{
		                                    		value += '<td width="90%;" id="mcName' + list[i].mycalNo + '" onclick="changeMycal(' + list[i].mycalNo + ')"> &nbsp;' + list[i].mycalName + '</td>';
		                                    	}
			                                  
				                                    value += '<td class="su_myCalBasic">'
				                                        + '<a type="button">'
				                                            + '<div class="calColor" id="colorBtn' + list[i].mycalNo + '" style="border: 1px solid ' + list[i].mycalColor + '; background: ' + list[i].mycalColor + ';" onclick="colorMycal(' + list[i].mycalNo + ');"></div>'
				                                        	+ '<input type="hidden" id="calColor' + list[i].mycalNo + '" value="' + list[i].mycalColor + '">'	
				                                        + '</a>'
				                                    + '</td>';
		
				                                    if(i == 0){
				                                    	value += '<td class="su_myCalX dis_no"></td>';
				                                    } else {
		                                    			value += '<td class="su_myCalX dis_no"><a type="button" onclick="deleteMycal(' + list[i].mycalNo + ');">x</a></td>';
				                                    }
		                                		+ '</tr>';
		                                		
		                                str += list[i].mycalNo + ",";
	                                }
		                                
		                           //value += '</table>';
		                           
		                           $("#tb_myCal").html(value);
		                           //console.log(str);
		                           str = str.substring(0, str.lastIndexOf(","));
		                           $("#calArr").text(str);
		                           //console.log($("#calArr").text());
	                			}, error: function(){
	                				console.log("ajax 내 캘린더 조회 실패");
	                			}
	                		});
	                		
	                	}
	                	
	                	// 관심 캘린더 리스트 출력 이벤트
	                	function selectLikecalList(){
	                		$.ajax({
	                			url: "lclist.ca",
	                			data: { memNo: ${loginUser.memNo} },
	                			success: function(list){
	                				console.log(list);
	                				var value = "";
	                				var str = "";
	                				
	                				for(let i = 0; i < list.length; i++){
	                					value += '<tr style="width: 100%;">'
		                                    		+ '<td width="20%;"><span class="lcNo" style="color: white !important;">' + list[i].likeMemNo + '</span></td>'
		                                    		+ '<td><input type="checkbox" name="likecalList"></td>'
		                                    		+ '<td width="90%;"> &nbsp;' + list[i].Member.memName + ' ' + list[i].Member.jobName + '</td>'
		                                    		+ '<td class="su_attCalX dis_no"><a type="button" onclick="deleteLikecal(' + list[i].likecalNo + ');">x</a></td>'
		                                		+ '</tr>';
		                                
	                					str += list[i].likecalNo + ",";
	                				}
	                				
	                				$("#tb_likeCal").html(value);
	                				//$("#lcalArr").text(str);
	                				
	                			}, error: function(){
	                				console.log("ajax 관심 캘린더 리스트 출력 실패");
	                			}
	                		});
	                	}
	                	
	                	var checkCnt = "";
	            		
	            		// 내 캘린더 체크 리스트
	            		function calList(){
	            	        checkCnt = "";
	            	        $("input[name='mycalList']:checked").each(function(){
	            	        	
	            	        	//console.log($(this).parent().parent().children().eq(0).text());
	            	            checkCnt += ($(this).parent().parent().children().eq(0).text()) + ","; // 체크된 것만 게시글번호 뽑기 "2,3,4,"
	            	        });
	            	        
	            	        checkCnt = checkCnt.substring(0,checkCnt.lastIndexOf(",")); // 맨 뒤 콤마 삭제 "2,3,4"
	            	        //console.log(checkCnt);
	            	        $("#calArr").text(checkCnt);
	            		}
	            		
	            		$(document).on("change", "input[name='mycalList']", function(){
	            			calList();
	            			//console.log($("#calArr").text());	
	            		});
	            		
	            		// 관심 캘린더 체크 리스트 (memNo로)
	            		
	            		var checkList = "";
	            		
	            		function likecalList(){
	            			checkList = "";
	            			$("input[name=likecalList]:checked").each(function(){
	            				//console.log($(this).parent().parent().children().eq(0).text());
	            				checkList += ($(this).parent().parent().children().eq(0).text()) + ","; // 체크된 것만 게시글번호 뽑기
	            			});
	            			checkList = checkList.substring(0,checkList.lastIndexOf(",")); // 맨 뒤 콤마 삭제
	            			$("#lcalArr").text(checkList);
	            			console.log(checkList);
	            			
	            			
	            		}
	            		
	            		$(document).on("change", "input[name='likecalList']", function(){
	            			likecalList();
	            			
	            		});
	            		
	                	// 선택된 캘린더 번호 출력 이벤트
	                	function selectMycalNo(){
	                		var result = "";
	                		$.ajax({
	                			url: "mcnolist.ca",
	                			async: false,
	                			data: { memNo: ${ loginUser.memNo } },
	                			success: function(list){
	                				console.log(list[0].mycalNo);
	                				for(let i = 0; i < list.length; i++){
	                					result += list[i].mycalNo + ',';
	                				}
	                				result = result.substring(0, result.lastIndexOf(","));
	                				$("#calArr").text(result);
	                				
	                				return result;
	                			}, error: function(){
	                				console.log("ajax 내 캘린더 번호 조회 실패");
	                			}
	                		});
	                		return result;
	                	}
	                		
	               		// 내 캘린더 추가
	               		$("#insertMyCal").click(function(){
	               			$.ajax({
	               				url: "mcinsert.ca",
	               				data: { 
	               					memNo: ${ loginUser.memNo},
	               					mycalName: $("#myCalName").val()
	               				},
	               				success: function(result){
	               					if(result == "success"){
	               						alert("내 캘린더가 추가되었습니다.");
	               						$("#myCalName").val("");
	               						$("#addMyCal").modal('hide');
	               						selectMycalList();
	               					}
	               				}, error: function(){
	               					console.log("ajax 내 캘린더 추가 실패");
	               				}
	               			});
	               		});
	               		
	               		// 내 캘린더 이름 변경
	               		function changeMycal(mcNo){
	               		// mcNo : 내 캘린더 번호
	               		var id = "mcName" + mcNo;
	               			var name = $("#" + id).text();
	               			//console.log(name);
	               			$("#chCalName").val(name);
	               			$("#updateMyCal").modal("show");
	               			$("#updateMyCalBtn").click(function(){
	               				//console.log("j");
	               				$.ajax({
	               					url: "mcupdate.ca",
	               					data: {
	               						mcNo: mcNo,
	               						mcName: $('#chCalName').val()
	               						},
	               					success: function(result){
	               						if(result == "success"){
	               							alert("수정되었습니다.");
	               							$("#chCalName").val("");
	               							$("#updateMyCal").modal("hide");
	               							selectMycalList();
	               						}
	               					}, error: function(){
	               						console.log("ajax 내 캘린더 수정 실패");
	               					}
	               				});
	               			});
	               		}
	               		
	               		// 관심 캘린더 추가
	               		function chooseAtt(mNo){
	               			$.ajax({
	               				url: "lcinsert.ca",
	               				data:{
	               					memNo: ${loginUser.memNo},
	               					likeMemNo: mNo
	               				},
	               				success:function(result){
	               					if(result == "success"){
	               						alert("관심 캘린더가 추가되었습니다.");
	               						$("#attCalList").css("display", "none");
	               						selectLikecalList();
	               					}
	               				}, error:function(){
	               					console.log("ajax 관심 캘린더 추가 실패");
	               				}
	               			});
	               		}
	               		
	               		// 내 캘린더 삭제
	               		function deleteMycal(mcNo){
	               			// mcNo : 내 캘린더 번호
	               			$("#delete").modal("show");
	               			$("#realDelete").click(function(){
	               				//console.log("j");
	               				$.ajax({
	               					url: "mcdelete.ca",
	               					data: {checkCnt: mcNo},
	               					success: function(result){
	               						if(result == "success"){
	               							alert("삭제되었습니다.");
	               							$("#delete").modal("hide");
	               							selectMycalList();
	               						}
	               					}, error: function(){
	               						console.log("ajax 내 캘린더 삭제 실패");
	               					}
	               				});
	               			});
	               		}
	               		
	               		// 관심 캘린더 삭제
	               		function deleteLikecal(lcNo){
	               			// lcNo : 관심 캘린더 번호
	               			$("#deleteLc").modal("show");
	               			$("#realDeleteLc").click(function(){
	               				$.ajax({
	               					url: "lcdelete.ca",
	               					data: {lcNo: lcNo},
	               					success: function(result){
	               						if(result == "success"){
	               							alert("삭제되었습니다.");
	               							$("#deleteLc").modal("hide");
	               							selectLikecalList();
	               						}
	               					}, error: function(){
	               						console.log("ajax 관심 캘린더 삭제 실패");
	               					}
	               				});
	               			});
	               		
	               		}
	               		
	               		// 캘린더 색상 변경
	               		function colorMycal(mcNo){
	               			let value = "";
	               			let id = "colorBtn" + mcNo;
	               			let c = "calColor" + mcNo;
	               			let color = $("#" + c).val();
	               			
	               			value += '<input type="color" id="colorArea" value="' + color + '">'
	    	                       + '<button type="button" class="btn btn-sm su_btn_border" id="chColorBtn" onclick="changeColor(' + mcNo + ');">변경</button>';
	    	                
	    	                $("#colorPal").html(value);
	    	                $("#colorPal").show();
	    	                $("#" + id).attr("onclick", "cancleColor(" + mcNo + ");");
	               		}
	               		
	               		function cancleColor(mcNo){
	               			$("#colorPal").hide();
	               			let id = "colorBtn" + mcNo;
	               		 	$("#" + id).attr("onclick", "colorMycal(" + mcNo + ");");
	               		}
	               		
	               		// 색상 기본값 설정하기
	               		function changeColor(mcNo){
	               			let c = $("#colorArea").val();
	               			let color = c;
	               			$.ajax({
	               				url: "mccolor.ca",
	               				data: {
	               					mycalNo: mcNo,
	               					mycalColor: c
	               				},
	               				success: function(result){
	               					if(result == "success"){
	               						selectMycalList();
	               						location.reload();	// 이벤트 색상 변경을 위해
	               					}
	               				}, error: function(){
	               					console.log("ajax 캘린더 색상 변경 실패");
	               				}
	               			});
	               		}
	               		
	               		// color HEX to rgb
                        function hexToRgb ( hexType ){ 
                            /* 맨 앞의 "#" 기호를 삭제하기. */ 
                            var hex = hexType.trim().replace( "#", "" ); 
                            
                            /* rgb로 각각 분리해서 배열에 담기. */ 
                            var rgb = ( 3 === hex.length ) ? 
                                hex.match( /[a-f\d]/gi ) : hex.match( /[a-f\d]{2}/gi );     
                            
                            rgb.forEach(function (str, x, arr){     
                                /* rgb 각각의 헥사값이 한자리일 경우, 두자리로 변경하기. */ 
                                if ( str.length == 1 ) str = str + str; 
                                
                                /* 10진수로 변환하기. */ 
                                arr[ x ] = parseInt( str, 16 ); 
                            }); 
                            
                            return "rgba(" + rgb.join(", ") + ", 0.5)"; 
                        };
                        
	                </script>
	                
	                
	                
	                <!-- 내 캘린더 삭제 모달창 -->
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
	                                    <button type="button" id="realDelete" class="btn su_btn_all su_btn_medium">확인</button>
	                                    <button type="button" id="next" class="btn su_btn_border su_btn_medium" data-dismiss="modal">취소</button>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            
	             <!-- 관심 캘린더 삭제 모달창 -->
	                <div class="modal" id="deleteLc" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
	                    <!--Content-->
	                    <div class="modal-content modal_alert">
	                        
	                        <!--Body-->
	                        <div class="modal-body text-center modal_alert_child">
	                            <div style="margin-top: 1.5rem;">
	            
	                                <h5 class="mt-1 mb-2" style="color: black;">정말 삭제하시겠습니까?</h5>
	                                <br>
	                                <div class="text-center mt-4"> 
	                                    <button type="button" id="realDeleteLc" class="btn su_btn_all su_btn_medium">확인</button>
	                                    <button type="button" id="next" class="btn su_btn_border su_btn_medium" data-dismiss="modal">취소</button>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	
	
	                <script>
	                    $(document).ready(function(){
	                    	
	                    	// 일정 페이지로 이동 (현재 날짜 데이터를 갖고)
	                    	$("#enrollBtn").click(function(){
	                    		var now = new Date();
	                    		var month = now.getMonth() + 1;
	                    		var date = now.getDate();
	                    		var d = now.getFullYear();
	                    		d += "-";
	                    		
	                    		if(month < 10){
	                    			d += "0" + month;
	                    		} else{
	                    			d += month;
	                    		}
	                    		
	                    		d += "-";
	                    		
	                    		if(date < 10){
	                    			d += "0" + date;
	                    		} else{
	                    			d += date;
	                    		}
	                    		
	                    		
	                    		//console.log(d);
	                    		location.href="enrollForm.ca?day=" + d + "&memNo=" + ${ loginUser.memNo };
	                    		
	                    		
	                    	});
	                    	
	                    	
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
	                        });
	
	                        $("#xBtn").click(function(){
	                            $("#attCalList").hide();
	                        });
	
	                     	// 전사일정, 참석자 일정 체크박스 이벤트
		            		$("#cmpyBox").change(function(){
		            			
			            		if( $("#cmpyBox").is(":checked") ){
			            			$("#cmpy").text('Y');
			            		} else{
			            			$("#cmpy").text('N');
			            		}
			            		
		            		});
	                     	
		            		$("#atndBox").change(function(){
			            		if( $("#atndBox").is(":checked") ){
			            			$("#atnd").text('Y');
			            		} else{
			            			$("#atnd").text('N');
			            		}
		            			
		            		});
		            		
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
	                            <td><input type="checkbox" id="cmpyBox"></td>
	                            <td> &nbsp;전사 일정</td>
	                            <td width="10%"></td>
	                        </tr>
	                        <tr>
	                            <td></td>
	                            <td><input type="checkbox" id="atndBox"></td>
	                            <td> &nbsp;참석자 일정</td>
	                            <td></td>
	                        </tr>
	                    </table>
	                </div>
	                
	                <span style="display:none;" id="cmpy">N</span>
	                <span style="display:none;" id="atnd">N</span>
	                
	                <!-- 캘린더 관리 페이지로 이동 -->
	                <br>
	                    <!-- <a href="manage.ca" class="su_sub_menu_list" style="color: black;">
	                        <h6><span class="fas fa-fw fa-cog"></span> &nbsp;캘린더 관리</h6>
	                    </a> -->
	                    <!-- <a href=""><h6>항목</h6></a> -->
	
	
	                <br><br>
	
	                <!-- 색상 팔레트 -->
	                <div class="colorPal" id="colorPal">
	                    
	                </div>
	  
	            </div>
	                                
	        </nav>
	    </div>
	
	    <!-- ============================================================================================================ -->
	    <!-- full calendar -->
	    <div class="container-fluid" style="margin: auto; width: 85%">
	        <div id='calendar' class="su_calendar_size"></div>
	    </div>
	    
	
	<script>
	
		// function getEvent로 이벤트 연결하기 
		
	    document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('calendar');
	
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	    plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
	 	// 날짜 칸 클릭시 해당 날짜 데이터를 갖고 일정 입력 페이지로 이동 
		dateClick:function(arg){
		    //console.log(arg.dateStr); // 날짜 출력
		    location.href="enrollForm.ca?day=" + arg.dateStr + "&memNo=" + ${ loginUser.memNo };
		},
		
		// 이벤트 클릭시 일정 상세 조회 페이지로 이동
		eventClick:function(e){
			location.href = "detail.ca?sNo=" + e.event.id + "&memNo=" + ${ loginUser.memNo };
			//console.log(e.event.id);
		},
	    
	    header: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
	    },
	    locale: "ko",
	    // defaultDate: '2020-02-12',
	    navLinks: true, // can click day/week names to navigate views
	    businessHours: true, // display business hours
	    editable: true,
	    timeFormat:'H(:mm)',
	    events: function(info, successCallback, failureCallback){
	    	//console.log($("#calArr").text());
	    	var calStr = $("#calArr").text();
	    	var lcalStr = $("#lcalArr").text();
	    	var mem = ${loginUser.memNo};
	    	$.ajax({
	    		type: 'post',
	    		cache: false,
	    		url: "sclist.ca",
	    		dataType:'json',
	    		data:{
              		memNo: ${ loginUser.memNo },
              		checkCnt: $("#calArr").text(),	// 내 캘린더
              		checkList: $("#lcalArr").text(),	// 관심 캘린더
              		atnd: $("#atnd").text(),
              		cmpy: $("#cmpy").text()
              	},
              	//contentType:"application/x-www-form-urlencoded; charset=UTF-8",
              	success: function(param){
              		var event = [];
              		//console.log(param);
              		//console.log(calStr);
              		$.each(param, function(index, data){
              			// map에서 값 불러와서 조건넣어서 이벤트 푸쉬하기...
              			if(calStr.includes(data.mycal)){
              				event.push({
    	              			id: data.id,
    	              			title: data.title,
    	              			start: data.start,
    	              			end: data.end,
    	              			color: hexToRgb(data.color)
    	              			//backgroundColor: 'rgba(94, 126, 155, 0.6)'
    	              		});
              			 }
              			else if( ($("#atnd").text() == 'Y') && data.atnd != null){
              				var atndNoStr = data.atnd;
              				console.log(atndNoStr);
              				if(atndNoStr.includes(mem)){
              					event.push({
        	              			id: data.id,
        	              			title: data.title,
        	              			start: data.start,
        	              			end: data.end,
        	              			color: hexToRgb(data.color)
        	              			//backgroundColor: 'rgba(94, 126, 155, 0.6)'
        	              		});
              				}
              			} else if($("#cmpy").text() == 'Y'){
              				if(data.cmpy == 'Y'){
              					event.push({
        	              			id: data.id,
        	              			title: data.title,
        	              			start: data.start,
        	              			end: data.end,
        	              			color: hexToRgb(data.color)
        	              			//backgroundColor: 'rgba(94, 126, 155, 0.6)'
        	              		});
              				}
              			} 
              			
              			if(lcalStr.includes(data.writer)){
              				event.push({
    	              			id: data.id,
    	              			title: data.title,
    	              			start: data.start,
    	              			end: data.end,
    	              			color: hexToRgb(data.color)
    	              			//backgroundColor: 'rgba(94, 126, 155, 0.6)'
    	              		});
              			}
	              		
              	    });
              		
              		console.log(event);
              		successCallback(event);
              	}
              	
              	
	    	});
	    }
	    
	    	
	    	
	    });
	    
	    
	    
	    $(document).on("change", "input[type=checkbox]", function(){
	    	calendar.refetchEvents();
	    })
	
	    calendar.render();
	    
	    });
	</script>
	
	</div>
	           

                
	<jsp:include page="../common/footer.jsp" />

</body>
</html>