<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css -->
<link href="${pageContext.request.contextPath}/resources/css/promotion.css" rel="stylesheet" type="text/css">

</head>
<body>
	
	<jsp:include page="../common/header.jsp" />
	
	<div style="display: flex" class="su_content_body">

	    <div class="container-fluid su_contentArea" style="display: block;">
	        <div class="su_content_header">
	            <h2 class="su_sub_menu_name">상담 내역 조회</h2>
	
	
	            <div class="su_btn_two_area">
	                <div class="su_left_area">
	                    <!-- <button type="button" class="btn su_btn_border su_btn_sm" id="deleteBtn" data-toggle="modal" data-target="#delete">삭제</button> -->
	                </div>
	
	                <div>
	                    <button type="button" class="btn su_btn_border" onclick="location.href='list.tcn';">목록으로</button>
	                </div>
	
	            </div>
	
	            <hr class="hr_line_top">
	
	            <br>
	
	        </div>
	
	        <!-- 게시글 영역 -->
	        <div class="su_board_body">
	
	            <div class="su_board_title" style="display:inline-block">
	                <h3 style="display:inline-block; color: black;">내담자 [${ c.cnslnTitle }] </h3>
	                
	                <span id="rCountTitle"></span>
	            </div>
	
	             <!-- 수정삭제 버튼 -->
	             <!-- 작성자에게만 보임 -->
	             <c:if test="${ loginUser.memNo == c.cnslnWriter || fn:contains(c.cnslnChargeNo, loginUser.memNo)}">
		             <div class="detailDot" style="float:right; width:10%; margin-right:-130px">
		                <ul class="navbar-nav ml-auto moDelte">
		                    <li class="nav-item dropdown no-arrow mx-1">
		                        <a class="nav-link dropdown-toggle" href="#" id="dotDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" 
		                            aria-expanded="false">
		                            <i class="fas fa-ellipsis-v" style="color:black; font-size: 25px;"></i>
		                        </a>
		                        <div class="dropdown-list dropdown-menu shadow" aria-labelledby="dotDropdown" style="margin-left:-180px; margin-top: -10px;">
			                            <a class="dropdown-item d-flex align-items-center" href="updateForm.tcn?cNo=${ c.cnslnNo }">
			                                <span class="font-weight-bold">등록/수정하기</span>
			                            </a>
			                            <a class="dropdown-item d-flex align-items-center" href="#" data-toggle="modal" data-target="#delete">
			                                <span class="font-weight-bold">삭제하기</span>
			                            </a>
		                        </div>
		                    </li>
		                </ul>
		            </div>
	            </c:if>
	            

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
	                                    onclick="location.href='delete.tcn?cNo=${ c.cnslnNo }';">확인</button>
	                                    <button type="button" id="next" class="btn su_btn_border su_btn_medium" data-dismiss="modal">취소</button>
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
	            
	            
	
	            <div class="su_board_writer">
	                <div>
	                    <img src="${pageContext.request.contextPath}/resources/profile_images/defaultProfile.png" alt="">
	                	<!-- <img src="${ c.member.memProfile}"> -->
	                </div>
	                <div>
	                    <span class="font-weight-bold">${ c.member.memName }&ensp;${ c.member.jobName }</span>
	                    <span>${ c.cnslnCreateDate }</span>
	                </div>
	            </div>
	
	            <div class="su_board_content" style="display:flex; justify-content:space-between">
	                <div class="minHeight" style="height:200px;"></div>
	                <div class="contentArea" style="width:100%">
	                	<p>상담 시간 : ${ c.cnslnStartDate } ~ ${ c.cnslnEndDate }</p>
	                	<p>전화 번호 : ${ c.cnslnPhone }</p>
	                	<p>상담 주제</p>
	                	<p style="margin-left: 75px;">${ c.cnslnTopic }</p>
                    </div>
                </div>
				
				<c:if test="${ c.cnslnContent != null }">
		            <!-- 상담 완료시 보이는 영역 -->
	                <hr class="hr_line">
	
	                <br>
	
	                <div class="su_board_content" style="display:flex; justify-content:space-between">
	                    <div class="minHeight" style="height:200px;"></div>
	                    <div class="contentArea" style="width:100%">
	                    <p>${ c.cnslnContent }</p>
	                    </div>
	                </div>
	            </c:if>
	
	            <div class="su_board_count">
	                <div>
	                    <span class="fas fa-comments"></span>
	                    <span id="rCounstSpan"></span>
	                </div>
	                &ensp;&ensp;
	                <div>
	                    <span class="fas fa-eye"></span>
	                    <span>조회수 ${ c.cnslnCount }회</span>
	                </div>
	            </div>
	            
	            
	
	            <!-- 댓글 영역 -->
	            <div class="su_board_reply">
	
	                <!-- 댓글 하나의 영역 -->
	                <!-- ajax를 통해 댓글 리스트 생성 -->
					<div id="replyArea"></div>
					
	                <!-- 댓글 작성 영역 -->
	                <div class="su_reply_Barea">
	                    <div class="su_reply" style="width: 100%;">
	                        <div>
	                            <img src="${pageContext.request.contextPath}/resources/profile_images/defaultProfile.png" alt="">
	                        	<!-- <img src="${ loginUser.memProfile}> -->
	                        </div>
	                        
	                        <div style="width: 100%">
	                            <input style="width: 100%;" type="text" placeholder="댓글 입력" id="replyContent0">
	                        </div>
	
	                    </div>
	                    <div class="su_reply_btn">
	                        <button type="button" class="btn su_btn_border btn-sm writeReplyBtn" 
	                        onclick="addReply(0);" id="writeReplyBtn">댓글 작성</button>
	                    </div>
	
	                </div>
					
					<!-- 댓글 ajax script -->
	                <script>
	                	$(function(){
	                		selectReplyList();	
	                	})
	                	
	                	// 댓글 리스트 출력 이벤트
	                	function selectReplyList(){
	                		$.ajax({
	                			url: "rlist.cn",
	                			data:{no: ${ c.cnslnNo }},
	                			success: function(list){
	                				
	                				let value = "";
	                				//let userName = "${ loginUser.memName}";
	                				let rCount = list.length;
	                				let ryCount = 0;
	                				
	                				for(let i = 0; i < rCount; i++){
	                					
	                					
	                					
	                					if(list[i].replyParent == 0 && list[i].replyStatus == 'Y'){ // 원댓글 이면
	                						value += '<div class="su_reply_Barea" id="cReply' + list[i].replyNo + '">';
	                					} else if(list[i].replyStatus == 'Y'){ // 대댓글이면
	                						value += '<div class="su_reply_Barea su_rreply_Barea" id="cReply' + list[i].replyNo + '">';
	                					} else if(list[i].replyStatus == 'N'){
	                						value += '<div>';
	                					}
	                					
	                					if(list[i].replyStatus == 'Y'){
	                						ryCount++;
		                					value += '<div class="su_reply">'
					                        			+ '<div>'
					                        				+ '<img src="${pageContext.request.contextPath}/resources/profile_images/defaultProfile.png" alt="">'
					                        			+ '</div>'
					
					                        			+ '<div>'
					                            			+ '<div class="su_reply_writer">'
						                            			+ '<span class="font-weight-bold">' + list[i].replyWriter + '&ensp;' + list[i].replyJob + '&ensp;</span>'
																+ '<span style="margin-right:10px">' + list[i].replyDate + '</span> &ensp;';
							                          
								                                <!-- 대댓글 작성 버튼 -->
								                                <!-- ()안에 댓글 번호 넣기 -->
								                                <!-- 원댓글일 때만 보이게 -->
								                                if(list[i].replyParent == 0){
								                                	value += '<a id="cReplyEvent' + list[i].replyNo + '" style="cursor: pointer;" onclick="rReply(' + list[i].replyNo + ');">'
										                                	+ '<i class="fas fa-reply" style="transform: rotate(180deg);"></i> 댓글</a>';
								                                }
								                      value += '</div>'
					                            			 + '<div class="su_reply_Bcontent">'
					                            			 	+ '<p id="rContent' + list[i].replyNo + '">' + list[i].replyContent +'</p>'
															 + '</div>'
													+ '</div>'
												+ '</div>';
												
												// 댓글 작성자만 보이는 수정, 삭제 버튼
					                      		if(list[i].replyWriter == "${ loginUser.memName }"){
					                      			value += '<div class="su_reply_btn">'
							                        			+ '<button type="button" class="btn btn-sm" style="border:0px; color: black;" onclick="updateReplyDiv(' + list[i].replyNo + ');">수정</button>|' 
							                        			+ '<button type="button" class="btn btn-sm" style="border:0px; color: black;" onclick="deleteReply(' + list[i].replyNo + ')">삭제</button>'
							                    			+ '</div>';
					                      		}
												
												value += '</div>';
											
	                					
	                					} else{
	                						var deCount = 0;
	                						for(j = i + 1; j < rCount; j++){
		                						if( (list[i].replyParent == 0) && (list[j].replyParent != 0) && (list[j].replyStatus == 'Y') && (list[j].replyParent == list[i].replyNo) ){
			                						deCount++;
		                						}
		                						
	                						}
	                						
	                						if(deCount > 0){
		                							if( (list[i].replyParent == 0) ){
			                							value += '<div class="su_reply">'
				            	                    			+ '<p style="vertical-algin: middle; margin: 8px;">삭제된 댓글입니다.</p>'
				            	                    		+ '</div>';
				            	                    		//+ '</div>';
		                							}
	                						} 
	                					}
		                				value += '</div>';
	                				}
	                				$(".su_board_reply #replyArea").html(value);	
	                				$("#rCountTitle").html(" &ensp;[" + ryCount + "]");
	                				$("#rCounstSpan").html("댓글 " + ryCount + " 개");
	                					
	                			}, error:function(){
	                				console.log("ajax 댓글 리스트 조회 실패");
	                			}
	                		});
	                	}
	                	
	                	// 대댓글 작성 영역 추가 이벤트
	                    function rReply(rNo){
	                		let reId = 'cReplyEvent' + rNo;
	                		let id = "cReply" + rNo;
	                		let caId = "cancleReReply" + rNo
	                        const rReplyDiv = '<div class="su_reply_Barea su_rreply_Barea" id="reReplyDiv' + rNo + '">'
	                                            + '<div class="su_reply" style="width: 100%;">'
	                                                + '<div>'
	                                                    + '<img src="${pageContext.request.contextPath}/resources/profile_images/defaultProfile.png" alt="">'                                        
	                                                // + '<img src="${ loginUser.memProfile }">'
	                                                    + '</div>'
	                        
	                                                + '<div style="width: 100%">'
	                                                    + '<input style="width: 100%;" type="text" placeholder="댓글 입력" id="replyContent' + rNo + '">'
	                                                + '</div>'
	
	                                            + '</div>'
	                                            + '<div class="su_reply_btn" id="su_reply_btn" style="display: inline-flex;">'
	                                                 + '<button type="button" class="btn su_btn_border btn-sm writeReplyBtn" id="writeReplyBtn"' 
	                                                 + 'onclick="addReply(' + rNo + ');">댓글 작성</button>'
	                                            + '</div>'
	
	                                            + '</div>';
	                                            
	                                            
	                        $("#" + id).after(rReplyDiv);
	                        // 원 댓의 이벤트 제거
	                        $("#" + reId).attr("onclick", "cancleReReply(" + rNo + ")");
	                        // 댓글 입력칸 focus
	                        $(".su_rreply_Barea>.su_reply input").focus();
	                       
	                    }
	                	
	                	// 대댓 작성 취소
	                	function cancleReReply(rNo){
	                		let reId = 'cReplyEvent' + rNo;
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
	                    	let id = "cReply" + num;
	                    	let cId = "rContent" + num;
	                    	let contentValue = $("#" + cId).text();
	                    	let contentId = "updateContent" + num;
	                    	let value = "";

	                    	value += '<div class="su_reply" style="width: 100%;">'
	                        			+ '<div>'
                            				+ '<img src="${pageContext.request.contextPath}/resources/profile_images/defaultProfile.png" alt="">'
                            				// + '<img src="${ loginUser.memProfile }">'
                        				+ '</div>'
                        
                        				+ '<div style="width: 100%">'
                            				+ '<input style="width: 100%;" type="text" placeholder="댓글 입력" id="' + contentId + '" value="' + contentValue + '">'
                        				+ '</div>'
                    				+ '</div>'
                    				+ '<div class="su_reply_btn" style="display: inline-flex;">'
                        				+ '<button type="button" class="btn su_btn_border btn-sm writeReplyBtn" '
                        				+ 'onclick="updateReply(' + num + ');" style="margin-left: 10px; width: 60px;">수정</button>'
                        				+ '<button type="button" class="btn su_btn_border btn-sm writeReplyBtn" '
                        				+ 'onclick="cancelReply(' + num + ');" style="margin-left: 10px; width: 60px;">취소</button>'
                    				+ '</div>';
                    				
                    		$("#" + id).html(value);
                    		$("#" + contentId).focus();
	                    }
	                    
	                    function updateReply(num){
	                    	// num : 댓글 번호
	                    	let id = "cReply" + num;
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
	                    					
	                    					value += '<div class="su_reply">'
					                        			+ '<div>'
					                        				+ '<img src="${pageContext.request.contextPath}/resources/profile_images/defaultProfile.png" alt="">'
					                        			+ '</div>'
					
					                        			+ '<div>'
					                            			+ '<div class="su_reply_writer">'
						                            			+ '<span class="font-weight-bold">' + r.replyWriter + '&ensp;' + r.replyJob + '&ensp;</span>'
																+ '<span style="margin-right:10px">' + r.replyDate + '</span> &ensp;';
							                          
								                                <!-- 대댓글 작성 버튼 -->
								                                <!-- ()안에 댓글 번호 넣기 -->
								                                <!-- 원댓글일 때만 보이게 -->
								                                if(r.replyParent == 0){
								                                	
								                                	value += '<a id="pReplyEvent" style="cursor: pointer;" onclick="rReply(' + r.replyNo + ');">'
										                                	+ '<i class="fas fa-reply" style="transform: rotate(180deg);"></i> 댓글</a>';
								                                }
								                      value += '</div>'
					                            			 + '<div class="su_reply_Bcontent">'
					                            			 	+ '<p>' + r.replyContent +'</p>'
															 + '</div>'
													+ '</div>'
												+ '</div>';
												
												// 댓글 작성자만 보이는 수정, 삭제 버튼
					                      		if(r.replyWriter == "${ loginUser.memName }"){
					                      			value += '<div class="su_reply_btn">'
							                        			+ '<button type="button" class="btn btn-sm" style="border:0px; color: black;" onclick="updateReplyDiv(' + r.replyNo + ');">수정</button>|' 
							                        			+ '<button type="button" class="btn btn-sm" style="border:0px; color: black;" onclick="deleteReply(' + r.replyNo + ')">삭제</button>'
							                    			+ '</div>';
					                      		}
												
												value += '</div>'; 
											
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
	                    	let id = "cReply" + num;
	                    	
	                    	let value = "";
	                    		
	                    		$.ajax({
	                    			url: "rcancel.cn",
	                    			data: {
	                    				replyNo: num,
	                    			}, success: function(r){
	                    				if(r != "fail"){
	                    					
	                    					value += '<div class="su_reply">'
					                        			+ '<div>'
					                        				+ '<img src="${pageContext.request.contextPath}/resources/profile_images/defaultProfile.png" alt="">'
					                        			+ '</div>'
					
					                        			+ '<div>'
					                            			+ '<div class="su_reply_writer">'
						                            			+ '<span class="font-weight-bold">' + r.replyWriter + '&ensp;' + r.replyJob + '&ensp;</span>'
																+ '<span style="margin-right:10px">' + r.replyDate + '</span> &ensp;';
							                          
								                                <!-- 대댓글 작성 버튼 -->
								                                <!-- ()안에 댓글 번호 넣기 -->
								                                <!-- 내가 작성한 댓글이 아니고 원댓글일 때만 보이게 -->
								                                if(r.replyParent == 0){
								                                	
								                                	value += '<a id="cReplyEvent" style="cursor: pointer;" onclick="rReply(' + r.replyNo + ');">'
										                                	+ '<i class="fas fa-reply" style="transform: rotate(180deg);"></i> 댓글</a>';
								                                }
								                      value += '</div>'
					                            			 + '<div class="su_reply_Bcontent">'
					                            			 	+ '<p>' + r.replyContent +'</p>'
															 + '</div>'
													+ '</div>'
												+ '</div>';
												
												// 댓글 작성자만 보이는 수정, 삭제 버튼
					                      		if(r.replyWriter == "${ loginUser.memName }"){
					                      			value += '<div class="su_reply_btn">'
							                        			+ '<button type="button" class="btn btn-sm" style="border:0px; color: black;" onclick="updateReplyDiv(' + r.replyNo + ');">수정</button>|' 
							                        			+ '<button type="button" class="btn btn-sm" style="border:0px; color: black;" onclick="deleteReply(' + r.replyNo + ')">삭제</button>'
							                    			+ '</div>';
					                      		}
												
												value += '</div>'; 
											
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
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>