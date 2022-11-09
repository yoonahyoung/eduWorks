<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- css  -->
<link href="${pageContext.request.contextPath}/resources/css/sumin.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/board.css" rel="stylesheet" type="text/css">

<title>익명 게시판 상세 조회</title>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
	<div class="su_content_body">
	
	    <div class="su_contentArea">
	        <div class="su_content_header">
	            <h2 class="su_sub_menu_name">익명 게시판</h2>
	            	<c:if test="${ isReport eq 1 }">
	            		 신고 관리
	            	</c:if>
	            
	
	            <div class="su_btn_two_area">
	                <div class="su_left_area"><!-- 자리 채우기용 div --></div>
	                <div>
	                	<c:if test="${ empty isReport }">
	                    	<button type="button" class="n-btn su_btn_border" onclick="location.href='list.bl'">목록으로</button>
	                    </c:if>
	                    <c:if test="${ isReport eq 1 }">
	                    	<button type="button" class="n-btn su_btn_border" onclick="location.href='reportList.ad'">목록으로</button>
	                    </c:if>
	                </div>
	            </div>
	            <hr class="hr_line">
	            <br>
	        </div>
	
	        <!-- 게시글 영역 -->
	        <div class="su_board_body">
	
	            <div class="su_board_title" id="n-title">
	                <h3>${ b.boardTitle }</h3>[<span class="replyCount"></span>]
	            </div>
	
	            <!-- 작성자에게만 보이는 수정삭제 버튼 -->
	            <c:if test="${ loginUser.memNo eq b.boardWriter}">
		            <div class="detailDot" style="float:right; width:10%; margin-right:-130px">
		                <ul class="navbar-nav ml-auto moDelte">
		                    <li class="nav-item dropdown no-arrow mx-1">
		                        <a class="nav-link dropdown-toggle" href="#" id="dotDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" 
		                            aria-expanded="false">
		                            <i class="fas fa-ellipsis-v" style="color:black; font-size: 25px;"></i>
		                        </a>
	                        	<div class="dropdown-list dropdown-menu shadow" aria-labelledby="dotDropdown" style="margin-left:-180px; margin-top: -10px;">
		                            <a class="dropdown-item d-flex align-items-center" href="updateForm.bl?no=${b.boardNo}">
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
				
				<!-- 신고 관리자에게만 보이는 블라인드 처리 버튼 -->
				<c:if test="${ isReport eq 1 }">
		            <div class="detailDot" style="float:right; width:10%; margin-right:-130px">
		                <ul class="navbar-nav ml-auto moDelte">
		                    <li class="nav-item dropdown no-arrow mx-1">
		                        <a class="nav-link dropdown-toggle" href="#" id="dotDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" 
		                            aria-expanded="false">
		                            <i class="fas fa-ellipsis-v" style="color:black; font-size: 25px;"></i>
		                        </a>
	                        	<div class="dropdown-list dropdown-menu shadow" aria-labelledby="dotDropdown" style="margin-left:-180px; margin-top: -10px;">
		                            <c:choose>
		                            	<c:when test="${ b.boardStatus ne 'B' }">
				                            <a class="dropdown-item d-flex align-items-center" onclick="goBlind(1);" data-toggle="modal" style="cursor:pointer">
				                                <span class="font-weight-bold">블라인드 처리</span>
				                            </a>
				                        </c:when>
				                        <c:when test="${ b.boardStatus eq 'B' }">
				                            <a class="dropdown-item d-flex align-items-center" onclick="goBlind(2);" data-toggle="modal" style="cursor:pointer">
				                                <span class="font-weight-bold">블라인드 해제</span>
				                            </a>
		                            	</c:when>
		                            </c:choose>
	                        	</div>
		                    </li>
		                </ul>
		            </div>
				</c:if>
				
	            <!-- 글 삭제 모달창 -->
	            <div class="modal" id="delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
	                    <!--Content-->
	                    <div class="modal-content modal_alert">
	                        
	                        <!--Body-->
	                        <div class="modal-body text-center modal_alert_child">
	                            <div id="req-modal">
	            
	                                <h5 class="mt-1 mb-2 req-msg">정말 삭제하시겠습니까?</h5>
	                                <br>
	                                <div class="text-center mt-4" id="boardDeleteDiv"> 
	                                    <button type="button" id="realDeleteBoard" class="n-btn su_btn_all su_btn_medium">확인</button>
	                                    <button type="button" id="next" class="n-btn su_btn_border su_btn_medium" data-dismiss="modal">취소</button>
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
	                            <div id="req-modal">
	            
	                                <h5 class="mt-1 mb-2 req-msg">정말 삭제하시겠습니까?</h5>
	                                <br>
	                                <div class="text-center mt-4" id="realDeleteDiv"> 
	                                    <button type="button" id="realDeleteReply" class="n-btn su_btn_all su_btn_medium" data-dismiss="modal">확인</button>
	                                    <button type="button" id="next" class="n-btn su_btn_border su_btn_medium" data-dismiss="modal">취소</button>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            
	            <!-- 알람용 모달창 -->
                <div class="modal" id="moContent" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
                        <!--Content-->
                        <div class="modal-content modal_alert">
                            
                            <!--Body-->
                            <div class="modal-body text-center modal_alert_child">
                                <div id="req-modal">
                
                                    <h5 class="mt-1 mb-2 req-msg" id="modalContent"></h5>
                                    <br>                                
                                    <div class="text-center mt-4"> 
                                        <button type="button" class="n-btn su_btn_all su_btn_medium" data-dismiss="modal" id="resultUrl">확인</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
				
	            <div class="su_board_writer">
	                <div>
	                    <img src="${pageContext.request.contextPath}/resources/profile_images/defaultProfile.png" alt="">
	                </div>
	                <div>
	                    <span class="font-weight-bold"> 익명 </span>
	                    <span>${ b.boardEnDate }</span>
	                </div>
	            </div>
	
	            <div class="su_board_content" style="display:flex; justify-content:space-between">
	            	<div class="minHeight" style="height:200px;"></div>
	                <div class="contentArea" style="width:100%">
	                    <p>${ b.boardContent }
	                    </p>
                    </div>
                </div>
                
	            <br>
	
	            <div class="su_board_count tableOption">
	                <div style="display:flex" id="ajaxOption">
	                    <div class="board-plus-box">
	                        <span class="fas fa-comments"></span>
	                        <span>댓글 <span class="replyCount"></span> 개</span>
	                    </div>
	                    &ensp;&ensp;
	                    <div class="board-plus-box">
	                        <span class="fas fa-eye"></span>
	                        <span>조회수 ${ b.boardCount }회</span>
	                    </div>
	                    &ensp;&ensp;
	                    <div class="board-plus-box" id="thumbsDiv">
	                        <span class="fas fa-thumbs-up" id="thumbsIcon"></span>
	                        <span id="thumbsSpan" class="noThumbs">추천수 <span class="likeCount">0</span></span>
	                    </div>
	                    
	                </div>
	                <div class="boReport">
	                	<c:choose>
	                		<c:when test="${ isReport eq 1 }">
	                			<a class="nav-link" style="color:grey; padding-top:0; padding-bottom:0; cursor:default;">
	                		</c:when>
	                		<c:when test="${ b.boardWriter ne loginUser.memNo }">
	                    		<a onclick="insertReport(0);" class="nav-link" style="color:black; padding-top:0; padding-bottom:0;" data-toggle="modal" data-target="#reportModal">
	                    	</c:when>
	                    	<c:otherwise>
	                    		<a onclick="insertReport(0);" class="nav-link" style="color:black; padding-top:0; padding-bottom:0;" data-toggle="modal">
	                    	</c:otherwise>
	                    </c:choose>
                            <span class="material-symbols-outlined" style="color:rgb(250, 71, 71); font-size: 24px; vertical-align:top;">E911_Emergency</span>
                            <span>신고하기</span>
                        </a>
	                </div>
	            </div>
	            
	            <!-- 신고 모달창 -->
                <div class="modal" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
                        <!--Content-->
                        <div class="modal-content modal_alertB">
                            
                            <!--Body-->
                            <div class="modal-body text-center modal_alert_child">
                                <div>
                                    <h5 class="mt-1 mb-2 repTitle">신고</h5><br>
                                    <div id="radioDiv">
	                                    <input type="radio" id="report-1" name="rpt_reason_no" value="1"> <label for="report-1">성적 불쾌감을 주는 내용</label><br>
	                                    <input type="radio" id="report-2" name="rpt_reason_no" value="2"> <label for="report-2">욕설/비방의 내용</label><br>
	                                    <input type="radio" id="report-3" name="rpt_reason_no" value="3"> <label for="report-3">도배 및 홍보의 내용</label><br>
                                    </div>
                                    <div class="text-center mt-4" style="margin-top: 1.5rem;"> 
                                        <button type="button" id="realReport" class="n-btn su_btn_all su_btn_medium">신고</button>
                                        <button type="button" id="next" class="n-btn su_btn_border su_btn_medium" data-dismiss="modal">취소</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
	
	            <!-- 댓글 영역 -->
	            <div class="su_board_reply">
	            	<div class="ajaxReply">
						<!-- 이 밑으로 ajax통해서 댓글 보여짐 -->
	            	
	            	</div>
				
					<!-- 댓글 작성 영역, onclick시 parentNo 전달 -->
	                <div class="su_reply_Barea">
	                    <div class="su_reply" style="width: 100%; display:flex; flex-wrap: wrap">
	                        <div>
	                            <img src="resources/defaultProfile.png" alt="">
	                        </div>
	                        <div style="width:100%">
		                        <div style="width: 60%">
		                            닉네임 : <span id="idArea"></span>
		                        </div>
	                        </div>
	                        <div style="width: 100%">
	                            내용 : <input style="width: 100%;" type="text" placeholder="댓글 입력" id="replyContent">
	                        </div>
	
	                    </div>
                        <div class="su_reply_btn">
                            <button type="button" class="n-btn su_btn_border btn-sm" id="writeReplyBtn" onclick="insertReply(0);" style="margin-top:80px">댓글 작성</button>
                        </div>
	                </div>
				<script>
					$(function(){
						selectReplyList();
						selectLikeCount();
						
						// 추천하기/해제 보여지는 구문
						$("#thumbsSpan").hover(function(){
							$(".likeCount").css("font-size", "0");
						}, function(){
							$(".likeCount").css("font-size", "17px");
						})
						
						
					})
					
					function selectReplyList(){ // 댓글 조회
						
						$.ajax({
							url: "rList.bl",
							data: {no:"${b.boardNo}"},
							success:function(rList){
								let value = "";
								let user = "${loginUser.memName}";
								let root = "${pageContext.request.contextPath}";
								let isReport = "${isReport}";
								let replyCount = 0;
								let idArea = '<input type="text" placeholder="6자 이내 입력" id="blindId">&ensp;'
											+ '<button type="button" class="n-btn su_btn_border btn-sm" onclick="ajaxBlindId(0);" id="blindBtn">등록</button>';
								
								for(let i=0; i<rList.length; i++){
									// 원댓글 or 대댓글 조건문
									if(rList[i].replyParent == 0 && rList[i].replyStatus == 'Y'){ // 원댓글
										value += '<div class="su_reply_Barea selNo' + rList[i].replyNo + '">';
										
									}else if(rList[i].replyStatus == 'Y'){ // 대댓글
										value += '<div class="su_reply_Barea su_rreply_Barea selNo' + rList[i].replyNo + '">';
										
									}else if(rList[i].replyStatus == 'N' || rList[i].replyStatus == 'B' ){ // 대댓글이면서 삭제됐을 경우
										value += '<div>';
									}
									
									
									if(rList[i].replyStatus == 'Y'){
										value += '<div class="su_reply">'
													+ '<div>' 
														+'<img src="' + root + '/resources/profile_images/defaultProfile.png" alt="">'
													+ '</div>'
													+ '<div id="reUpdateArea' + rList[i].replyNo + '" class="' + rList[i].replyWriter + '">'
														+ '<div class="su_reply_writer">'
															+ '<span class="font-weight-bold">' + rList[i].replyBlind + '</span>'
															+ '<span style="margin-right:10px"> | ' + rList[i].replyDate + '</span>';
															// 원댓글만 댓글 추가 버튼 보이게끔 (댓글 작성자 본인 또한 본인 댓글에 대댓글 가능)
															if(rList[i].replyParent == 0){
																value += '<a id="pReplyEvent' + rList[i].replyNo + '" style="cursor: pointer;" onclick="rReply(' + rList[i].replyNo + ');"><i class="fas fa-reply" style="transform: rotate(180deg);"></i> 댓글 </a>';
															}
															if(isReport == 1){ // 관리자가 신고 게시판에서 들어왔을 시 보여지는 버튼
																value += '&ensp;<a onclick="goReBlind(' + rList[i].replyNo + ')" style="color:black; cursor:pointer;">'
															 				+ '<i class="fas fa-eye-slash" style="color:#5e7e9b"></i>'
						                                                 	+ ' 숨김처리'
				                                            			+ '</a>';
															}
												  value += '</div>'
														+ '<div class="su_reply_Bcontent conNo' + rList[i].replyNo + '" style="width:100%;">'
															+ '<p style="width:100%">' + rList[i].replyContent +'</p>'
														+ '</div>'
													+ '</div>'
												+ '</div>';
										
										// 댓글 작성자만 수정, 삭제 버튼 보이게끔
										if(rList[i].replyWriter == user){
											 value += '<div class="su_reply_btn">'
														+ '<button type="button" class="btn btn-sm su_btn_border" style="border:0px" onclick="updateReBtn(' + rList[i].replyNo + ');">수정</button>|'
														+ '<button type="button" class="btn btn-sm su_btn_border" style="border:0px" onclick="deleteReBtn(' + rList[i].replyNo + ');">삭제</button>'
												   + '</div>';
										}else{ // 본인이 작성 하지 않은 댓글에는 신고버튼보여짐
											 if(isReport == 1){ // 신고 관리로 들어왔다면 신고 버튼 비활성화
												value += '<div class="su_reply_btn reReport">'
															+ '<a class="nav-link" style="color:grey; padding-top:0; padding-bottom:0; cursor:default;">'
			                                        			+ '<span class="material-symbols-outlined" style="color:rgb(250, 71, 71); font-size: 23px; vertical-align:top;">E911_Emergency</span>'
			                                        			+ '<span>신고</span>'
			                                        		+ '</a>'
			                                        	+ '</div>';
											 }else {
												value += '<div class="su_reply_btn reReport">'
															+ '<a onclick="insertReport(' + rList[i].replyNo + ', &quot;댓글&quot;);" class="nav-link" style="color:black; padding-top:0; padding-bottom:0;" data-toggle="modal" data-target="#reportModal">'
			                                        			+ '<span class="material-symbols-outlined" style="color:rgb(250, 71, 71); font-size: 23px; vertical-align:top;">E911_Emergency</span>'
			                                        			+ '<span>신고</span>'
		                                            		+ '</a>'
		                                            	+ '</div>';
											}
										}
										value += '</div>'
											   + '<div class="pReply' + rList[i].replyNo + '">'
											   + '</div>';
										replyCount += 1;
									}else if(rList[i].replyStatus == 'B'){ // 블라인드 처리된 댓글
										value += '<div class="su_reply">'
		                							+'<div style="height:48px; line-height:48px">관리자에 의해 규제된 댓글입니다.</div>'
		                						+'</div></div>';
									}else
									if(i < (rList.length - 1)){ 
										if((rList[i].replyParent == 0) && (rList[i+1].replyParent != 0) && (rList[i+1].replyStatus == 'Y')){ // 대댓글 있는 원댓글이면서 삭제됐을 경우
											value += '<div class="su_reply">'
			                							+'<div style="height:48px; line-height:48px">삭제된 댓글입니다.</div>'
			                						+'</div></div>';
										}
									}
									
									// 댓글 작성 시 익명 아이디 뿌려주기
									if(rList[i].replyWriter == user){ // 댓글 작성자가 로그인한 유저와 같다 == 즉, 댓글 작성한 익명 아이디가 있다
										idArea = '<input type="text" value="' + rList[i].replyBlind + '" id="blindId" disabled>&ensp;'
											   + '<button type="button" class="n-btn su_btn_border btn-sm" id="blindBtn" disabled>등록</button>';
									}
								}
								
								$(".ajaxReply").html(value);
			    				$(".replyCount").text(replyCount);
			    				$("#idArea").html(idArea);
			    				// 신고 당한 댓글 배경 색 바뀌게끔
								$(".selNo"+"${rNo}").css("background", "rgb(252, 226, 226)");
							}, 
							error:function(){
								console.log("댓글리스트 조회용 ajax통신 실패");
							}
						})
					}
					
					function rReply(rNo){ // 대댓글 버튼 클릭 시 실행
						let rReplyDiv = "";
                        rReplyDiv += '<div class="su_reply_Barea su_rreply_Barea selNo' + rNo + '" id="clickRR' + rNo + '">'
                                            + '<div class="su_reply" style="width: 100%;">'
                                            	+ '<div style="width:30%">'
            		                        		+ '<div>'
            		                            		+ '닉네임 : <span id="idArea">';
           		                            			if(!$("#blindId").val()){
           		                            				rReplyDiv += '<input type="text" placeholder="6자 이내 입력" id="blindId" style="width:35%">&ensp;'
           		                            							+ '<button type="button" class="n-btn su_btn_border btn-sm" onclick="ajaxBlindId(0);" id="blindBtn">등록</button>';
           		                            			}else{
           		                            				rReplyDiv += '<input type="text" value="' + $("#blindId").val() + '" id="blindId" disabled style="width:35%">&ensp;'
   		                            							+ '<button type="button" class="n-btn su_btn_border btn-sm" id="blindBtn" disabled>등록</button>';
           		                            			}
            		                            		rReplyDiv += '</span>'
            		                        		+ '</div>'
            	                        		+ '</div>'
                                                + '<div style="width: 100%; margin-left:-80px;">'
                                                    + '<input style="width: 100%;" type="text" placeholder="댓글 입력" id="replyContent">'
                                                + '</div>'
                                            + '</div>'
                                            + '<div class="su_reply_btn" id="su_reply_btn1" style="display:flex">'
                                                + '<button type="button" class="n-btn su_btn_border btn-sm writeReplyBtn" id="writeReplyBtn" onclick="insertReply(' + rNo + ');">댓글 작성</button>'
                                            + '</div>'

                                        + '</div>';

                        $('.pReply' + rNo).html(rReplyDiv);
                        
                        // 댓글 입력칸 focus
                        $(".su_rreply_Barea>.su_reply input").focus();
                        
                        // 대댓글 보여지게끔
                        $("#pReplyEvent" + rNo).attr("onclick", "rReplyView( " + rNo  + ");");
						
                    }
					
					// 대댓글 버튼 클릭시 없어지는 function
					function rReplyView(rNo){
						$("#clickRR" + rNo).remove();
						$("#pReplyEvent" + rNo).attr("onclick", "rReply(" + rNo + ");");
					}
					
					// 익명 아이디 check
                 	function ajaxBlindId(replyParentNo){
                 		let replyDepth = 0;
                 		if(replyParentNo != 0){ // 댓글 깊이
                 			replyDepth = 1;
                 		}
                 		$.ajax({
                 			url:"checkReId.bl",
                 			data:{
                 				reBoardNo:${b.boardNo},
                 				replyBlind:$("#blindId").val()
                 			},
                 			success(result){ 
                 				if(result == 0){
                 					// 중복이 아닐 시 아이디 disabled
                 					$("#blindId").attr("disabled", "true");
                 					$("#blindBtn").attr("disabled", "true");
                 				}else{
                 					// 중복 시 다시 입력
                 					alert("이미 사용중인 닉네임 입니다!");
                 				}
                 			},
                 			error(){ 
                 				console.log("ajax통신 실패");
                 			}
                 		})
                 	}
					
                 	// 댓글 insert 
                    function insertReply(replyParentNo){ 
                 		if(!$("#blindId").val()){
                 			alert("닉네임을 먼저 입력하세요");
                 		}else if(!$("#replyContent").val()){
                 			alert("댓글 내용을 입력하세요");
                 		}else{
	                 		let replyDepth = 0;
	                 		if(replyParentNo != 0){ // 댓글 깊이
	                 			replyDepth = 1;
	                 		}
							 $.ajax({
								url: "insertRe.bl",
								data:{
									reBoardNo:${b.boardNo},
									replyDepth:replyDepth,
									replyParent:replyParentNo,
									replyContent:$("#replyContent").val(),
									replyWriter:"${loginUser.memName}",
									replyJob:"${loginUser.jobName}",
									replyBlind:$("#blindId").val(),
									replyWno:${loginUser.memNo}
								},
								success(result){
									$("#replyContent").val("");
									selectReplyList();
								},
								error(){
									console.log("댓글 등록 실패");
								}
							}) 
                 		}
					}
                 	
                    // 댓글 수정 div
                    function updateReBtn(rNo){
                    	$.ajax({
							url: "selectRe.bl",
							data:{no:rNo},
							success(reply){
								const rReplyDiv = '<div class="su_reply" style="width: 100%;">'
					                        		+ '<div>'
					                    				+ '<img src="${pageContext.request.contextPath}/resources/profile_images/defaultProfile.png" alt="">'
					                				+ '</div>'
					                
					                				+ '<div style="width: 100%">'
					                    				+ '<input style="width: 100%;" type="text" id="upRe' + rNo + '" value="' + reply.replyContent + '">'
					                				+ '</div>'
					            				+ '</div>'
					            				+ '<div class="su_reply_btn" style="display: inline-flex;">'
					                				+ '<button type="button" class="n-btn su_btn_border btn-sm writeReplyBtn" '
					                				+ 'onclick="updateReply(' + rNo + ');" style="margin-left: 10px; width: 60px;">수정</button>'
					                				+ '<button type="button" class="n-btn su_btn_border btn-sm writeReplyBtn" '
					                				+ 'onclick="selectReplyList();" style="margin-left: 10px; width: 60px;">취소</button>'
					            				+ '</div>';
						                         
						        $(".selNo"+rNo).html(rReplyDiv);
						        
							},
							error(){
								console.log("댓글 조회 실패");
							}
						}) 
                    }
                    
                    // 댓글 수정 ajax
                    function updateReply(rNo){
                    	$.ajax({
                    		url:"updateRe.bl",
                    		data:{
                    			no:rNo,
                    			replyContent: $("#upRe"+rNo).val()
                    			},
                    		success(result){
                    			console.log("댓글 수정 성공");
                    			selectReplyList();
                    		},
                    		error(){
                    			console.log("댓글 수정 실패");
                    		}
                    	})
                    }
                    
                    // 댓글 삭제 ajax
                    function deleteReBtn(rNo){
                    	$("#deleteReply").modal("show");
                    	
                    	$("#realDeleteDiv").on("click", "#realDeleteReply", function(){
                    		$.ajax({
                    			url:"deleteRe.bl",
                    			data:{no:rNo},
                    			success(result){
                    				let value = "";
                    				
                    				value += '<div class="su_reply">'
                    							+'<div>삭제된 댓글입니다.</div>'
                    						+'</div>';
                    						
                    				$(".selNo"+rNo).html(value);
                    				$("#deleteReply").modal("hide");
                    				selectReplyList();
                    			},
                    			error(){
                    				console.log("댓글 삭제 실패");
                    			}
                    		})
                    	})
                    }
                    
                    // 글삭제
                    $("#boardDeleteDiv").on("click", "#realDeleteBoard", function(){
                    	$.ajax({
                    		url:"delete.bl",
                    		data:{
                    			boardNo:${b.boardNo},
                    			atPath:'${at.atChangeName}'
                    		},
                    		success(result){
                    			if(result > 0){
                    				console.log(result);
                    				$("#modalContent").html("글이 삭제 되었습니다.");
	                    			$("#resultUrl").attr("onclick", "location.href='list.bl'");
	                    			$("#moContent").modal("show");
	                    			$("#delete").modal("hide");
                    			}else{
                    				$("#modalContent").html("삭제에 실패하였습니다.");
	                    			$("#resultUrl").attr("onclick", "");
	                    			$("#moContent").modal("show");
	                    			$("#delete").modal("hide");
                    			}
                    			
                    		},
                    		error(){
                    			console.log("ajax통신 실패");
                    		}
                    	})
                    })
                    
                	// 추천 조회
                    function selectLikeCount(){
                    	let boardNo = ${b.boardNo};
                    	let memNo = ${loginUser.memNo};
                    	$.ajax({
                    		url:"selectLike.bl",
                    		data:{boardNo:boardNo},
                    		success(like){
                    			$(".likeCount").html(like.length);
                    			let count = 0;
                    			for(let i=0; i<like.length; i++){
                    				if(like[i].memNo == memNo){ // 이미 추천되어있는 경우
                    					count++;
                    				}
                    			}
                    			
                    			if(count == 1){
                					$("#thumbsIcon").css("font-weight", "600");
                					$("#thumbsSpan").attr("class", "yesThumbs");
                					$("#thumbsSpan").removeClass("noThumbs");
                				}else{ // 추천 안되어 있는 경우
                					$("#thumbsIcon").css("font-weight", "500");
                					$("#thumbsSpan").attr("class", "noThumbs");
                					$("#thumbsSpan").removeClass("yesThumbs");
                				}
                    		},
                    		error(){
                    			console.log("ajax통신 실패");
                    		}
                    	})
                    }
                    
                    // 추천 insert/delete
                    $("#ajaxOption").on("click", "#thumbsDiv", function(){
                    	if($("#thumbsSpan").attr("class") != 'yesThumbs'){ 
                    		// 추천 안 한 글일 시 insert
                    		$.ajax({
	                    		url:"insertLike.bl",
	                    		data:{
	                    			memNo:${loginUser.memNo},
	                    			boardNo:${b.boardNo}
	                    		},
	                    		success(result){
	                    			$("#thumbsIcon").css("font-weight", "600");
                					$("#thumbsSpan").attr("class", "yesThumbs");
                					$("#thumbsSpan").removeClass("noThumbs");
                					
                					selectLikeCount();
	                    		},
	                    		error(){
	                    			console.log("ajax통신 실패");
	                    		}
                    		})
                    	}else{ 
                    		// 추천 한 글일 시 delete
                    		$.ajax({ 
	                    		url:"deleteLike.bl",
	                    		data:{
	                    			memNo:${loginUser.memNo},
	                    			boardNo:${b.boardNo}
	                    		},
	                    		success(result){
	                    			$("#thumbsIcon").css("font-weight", "500");
                					$("#thumbsSpan").attr("class", "noThumbs");
                					$("#thumbsSpan").removeClass("yesThumbs");
                					
                					selectLikeCount();
	                    		},
	                    		error(){
	                    			console.log("ajax통신 실패");
	                    		}
                    		})
                    	}
                    })
                    
                    
                    // 신고 insert
                    function insertReport(rptBoardNo, isReply){
                    	// rptBoardNo = 게시글 신고 누르면 0/ 댓글 신고 누르면 댓글번호
                    	// 댓글은 내가 쓴게 아니면 신고가 보여짐, 작성 글은 내가 쓴 글이면 신고가 불가능
                    	// => 댓글에서 신고 버튼을 눌렀다면 신고 불가능 모달 뜨면 안됨
                    	
                    	let rptRefCat = 0;
                    	if(rptBoardNo == 0){ // 게시글 신고일 시
                    		rptBoardNo = ${b.boardNo};
                    		rptRefCat = 1;
                    		if(${loginUser.memNo} == ${b.boardWriter}){
	                    		$("#modalContent").html("본인이 작성한 글은 신고가 불가능합니다!");
	                			$("#moContent").modal("show");
	                    	}
                		}else{ // 댓글 신고일 시
                			rptRefCat = 2;
                		}
                    	
                    	// 모달 창 안에 신고버튼 눌렀을시 작동하는 ajax
                    	$("#reportModal").on("click", "#realReport", function(){
                       		let rptRsn = $("input[name^='rpt_reason_no']:checked").val();
   	                    	if(!rptRsn){
   	                    		// 사유 미 체크시
   	                    		$("#modalContent").html("사유를 선택해주세요!");
   	                			$("#moContent").modal("show");
   	                    	}else{
   	                    		$.ajax({
   	                    			url:"insertReport.bl",
   	                    			data:{
   	                    				rptRefCat:rptRefCat,
   	                    				rptBoardNo:rptBoardNo,
   	                    				rptMemNo:${loginUser.memNo},
   	                    				rptReasonNo:rptRsn
   	                    			},
   	                    			success(result){
   	                    				if(result > 0){
   	                    					$("#modalContent").html("신고 완료");
   	        	                			$("#moContent").modal("show");
   	        	                			$("#reportModal").modal("hide");
   	                    				}else{
   	                    					$("#modalContent").html("신고에 실패하였습니다");
   	        	                			$("#moContent").modal("show");
   	        	                			$("#reportModal").modal("hide");
   	                    				}
   	                    			},
   	                    			error(){
   	                    				console.log("ajax통신 실패");
   	                    			}
   	                    		})
    	                    }
                        })
                    	
                    }
                    
                    // 게시글 블라인드 
                    function goBlind(category){
                    	// category 1일시 블라인드 처리, 2일 시 해제
                   		$.ajax({
                   			url:"goBlind.ad",
                   			data:{
                   				rptBoardNo:${b.boardNo},
                   				category:category,
                   				rptNoStr:"${rptNoStr}"
                   			},
                   			success(result){
                   				if(result > 0){
                   					$("#modalContent").html("블라인드 처리/해제 되었습니다");
    	                			$("#moContent").modal("show");
    	                			$("#resultUrl").attr("onclick", "location.reload();");
                   				}else{
                   					$("#modalContent").html("블라인드 처리/해제에 실패하였습니다.");
    	                			$("#moContent").modal("show");
    	                			$("#resultUrl").attr("onclick", "location.reload();");
                   				}
                   				
                   			},error(){
                   				console.log("ajax통신 실패");
                   			}
                   		})
                    }
                    
                 	// 댓글 블라인드 
                    function goReBlind(replyNo){
                 		
                   		$.ajax({
                   			url:"goReBlind.ad",
                   			data:{
                   				replyNo:replyNo,
                   				rptNoStr:"${rptNoStr}"
                   			},
                   			success(result){
                   				value = "";
                   				
                  				$("#modalContent").html("블라인드 처리/해제 되었습니다");
   	                			$("#moContent").modal("show");
   	                			
   	                			value += '<div class="su_reply">'
	            							+'<div style="height:48px; line-height:48px">관리자에 의해 규제된 댓글입니다.</div>'
	            						+'</div></div>';
   	                			$(".selNo"+replyNo).html(value);
                   				selectReplyList();
                   				
                   			},
                   			error(){
                   				console.log("ajax통신 실패");
                   			}
                   		})
                    }
                    
				</script>
				
	            </div>
	        </div>
	    </div>
	
	</div>
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>