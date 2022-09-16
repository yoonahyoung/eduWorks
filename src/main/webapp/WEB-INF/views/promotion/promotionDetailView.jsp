<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css -->
<link href="${pageContext.request.contextPath}/resources/css/promotion.css" rel="stylesheet" type="text/css">

<style type="text/css">
    a:hover{
        text-decoration: none;
    }
    .su_sub_menu_name,
    .su_board_title h3{
        font-weight: 600 !important;
    }
    .su_board_content p{
        white-space: pre;
        font-size: 17px;
        font-weight: 500;
    }
    .fa-reply{
        color: #5e7e9b;
    }
    .su_board_content{
        padding: 10px 0 0 30px;
    }
    .fa-reply{
        color: #5e7e9b;
    }
    .su_board_file{
        padding: 0px 30px;
    }
    .su_board_file span{
        font-size: 17px;
        font-weight: 500;
    }
</style>

</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
	<div style="display: flex" class="su_content_body">

	    <div class="container-fluid su_contentArea" style="display: block;">
	        <div class="su_content_header">
	            <h2 class="su_sub_menu_name">홍보물 조회</h2>
	
	
	            <div class="su_btn_two_area">
	                <div class="su_left_area">
	                    <!-- <button type="button" class="btn su_btn_border su_btn_sm" id="deleteBtn" data-toggle="modal" data-target="#delete">삭제</button> -->
	                </div>
	
	                <div>
	                    <button type="button" class="btn su_btn_border" onclick="location.href='list.pr';">목록으로</button>
	                </div>
	
	            </div>
	
	            <hr class="hr_line_top">
	
	            <br>
	
	        </div>
	
	        <!-- 게시글 영역 -->
	        <div class="su_board_body">
	
	            <div class="su_board_title" style="display:inline-block">
	                <h3 style="display:inline-block; color: black;">${ p.promoTitle } / 
	                <c:choose>
                     	<c:when test="${ p.promoCateNo eq 1 }">
                     		배너</h3>
                     	</c:when>
                     	<c:when test="${ p.promoCateNo eq 2 }">
                     		블로그</h3>
                     	</c:when>
                     	<c:when test="${ p.promoCateNo eq 3 }">
                     		포스터</h3>
                     	</c:when>
                     	<c:otherwise>
                     		SNS</h3>
                     	</c:otherwise>
                    </c:choose>
	                
	                <span id="rCountTitle"></span>
	            </div>
	
	             <!-- 수정삭제 버튼 -->
	             <!-- 작성자에게만 보임 -->
	             <c:if test="${ loginUser.memNo == p.promoWriter }">
		             <div class="detailDot" style="float:right; width:10%; margin-right:-130px">
		                <ul class="navbar-nav ml-auto moDelte">
		                    <li class="nav-item dropdown no-arrow mx-1">
		                        <a class="nav-link dropdown-toggle" href="#" id="dotDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" 
		                            aria-expanded="false">
		                            <i class="fas fa-ellipsis-v" style="color:black; font-size: 25px;"></i>
		                        </a>
		                        <div class="dropdown-list dropdown-menu shadow" aria-labelledby="dotDropdown" style="margin-left:-180px; margin-top: -10px;">
			                            <a class="dropdown-item d-flex align-items-center" href="updateForm.pr?no=${ p.promoNo }">
			                                <span class="font-weight-bold">수정하기</span>
			                            </a>
			                            <a class="dropdown-item d-flex align-items-center" href="#" data-toggle="modal" data-target="#delete">
			                                <span class="font-weight-bold">삭제하기</span>
			                            </a>
		                        </div>
		                    </li>
		                </ul>
		            </div>
	            </c:if>

	             <!-- ==================================== 삭제 완료 후 alert창 출력하기==================================================== -->
	
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
	                                    onclick="location.href='delete.pr?no=${ p.promoNo }';">확인</button>
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
	                	<!-- <img src="${ p.member.memProfile}"> -->
	                </div>
	                <div>
	                    <span class="font-weight-bold">${ p.member.memName }&ensp;${ p.member.jobName }</span>
	                    <span>${ p.promoCreateDate }</span>
	                </div>
	            </div>
	
	            <div class="su_board_content" style="display:flex; justify-content:space-between">
	                <div class="minHeight" style="height:200px;"></div>
	                <div class="contentArea" style="width:100%">
	                	<p>${ p.promoContent }</p>
                    </div>
                </div>
	
	            <!-- 첨부파일 있을 때만 존재 -->
	            <div class="su_board_file">
	            	<c:if test="${ not empty at.atOriginName }">
		                <span><i class="fas fa-paperclip" style="color: #5e7e9b;">&nbsp;</i></span>
		                <span>첨부파일 &nbsp;: 
		                <a href="${ at.atChangeName }" download="${ at.atOriginName }">${ at.atOriginName }</a>
		                &nbsp;</span>
		            </c:if>
	                <!-- 첨부파일 이름 나오게 -->
	            </div>
	
	            <br>
	
	            <div class="su_board_count">
	                <div>
	                    <span class="fas fa-comments"></span>
	                    <span id="rCounstSpan"></span>
	                </div>
	                &ensp;&ensp;
	                <div>
	                    <span class="fas fa-eye"></span>
	                    <span>조회수 ${ p.promoCount }회</span>
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
	                			url: "rlist.pr",
	                			data:{no: ${ p.promoNo }},
	                			success: function(list){
	                				
	                				let value = "";
	                				//let userName = "${ loginUser.memName}";
	                				let rCount = list.length;
	                				let ryCount = 0;
	                				
	                				for(let i = 0; i < rCount; i++){
	                					
	                					
	                					
	                					if(list[i].replyParent == 0 && list[i].replyStatus == 'Y'){ // 원댓글 이면
	                						value += '<div class="su_reply_Barea" id="pReply' + list[i].replyNo + '">';
	                					} else if(list[i].replyStatus == 'Y'){ // 대댓글이면
	                						value += '<div class="su_reply_Barea su_rreply_Barea" id="pReply' + list[i].replyNo + '">';
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
								                                	value += '<a id="pReplyEvent' + list[i].replyNo + '" style="cursor: pointer;" onclick="rReply(' + list[i].replyNo + ');">'
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
	                		let reId = 'pReplyEvent' + rNo;
	                		let id = "pReply" + rNo;
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
	                		let reId = 'pReplyEvent' + rNo;
	                		let divId = 'reReplyDiv' + rNo;
	                		
	                		let value = "";
	                		$("#" + divId).remove();
	                		 $("#" + reId).attr("onclick", "rReply(" + rNo + ");");
	                	}
	                    
	                    // 댓글 작성 이벤트
	                    function addReply(num){
	                    	// num : 부모 댓글 번호
	                    	let id = "replyContent" + num;
	                    	/* const job = ${ loginUser.jobCode };
	                    	if(job == 'J0'){
	                    		job = '강사';
	                    	} else if(job == 'J1'){
	                    		job = '사원';
	                    	} else if(job == 'J2'){
	                    		job = '대리';
	                    	} else if(job == 'J3'){
	                    		job = '팀장';
	                    	} else {
	                    		job = '대표';
	                    	} */
	                    		
	                    	
	                    	if( $("#" + id).val().trim().length != 0 ){	// 유효한 댓글 작성시 => ajax로 insert 요청
	                    		
	                    		$.ajax({
	                    			url: "rinsert.pr",
	                    			data: {
	                    				replyContent: $("#" + id).val(),
	                    				reBoardNo: ${ p.promoNo },
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
	                    	let id = "pReply" + num;
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
	                    	let id = "pReply" + num;
	                    	let contentId = "updateContent" + num; // 댓글 내용 아이디
	                    	
	                    	let value = "";
	                    	if( $("#" + contentId).val().trim().length != 0 ){
	                    		
	                    		$.ajax({
	                    			url: "rupdate.pr",
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
	                    	let id = "pReply" + num;
	                    	
	                    	let value = "";
	                    		
	                    		$.ajax({
	                    			url: "rcancel.pr",
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
	                    			url: "rdelete.pr",
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