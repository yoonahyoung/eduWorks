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

<title>부서 게시판 상세 조회</title>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
	<div class="su_content_body">
	
	    <div class="su_contentArea">
	        <div class="su_content_header">
	            <h2 class="su_sub_menu_name">부서 게시판</h2>
	
	            <div class="su_btn_two_area">
	                <div class="su_left_area"><!-- 자리 채우기용 div --></div>
	                <div>
	                    <button type="button" class="n-btn su_btn_border" onclick="location.href='list.de'">목록으로</button>
	                </div>
	            </div>
	            <hr class="hr_line">
	            <br>
	        </div>
	
	        <!-- 게시글 영역 -->
	        <div class="su_board_body">
	
	            <div class="su_board_title" id="n-title">
	                <h3>${ b.boardTitle }</h3>
	            </div>
	
	            <!-- 작성자에게만 보이는 수정삭제 버튼 -->
	            <c:if test="${ loginUser.memNo eq b.boardWriter }">
		            <div class="detailDot" style="float:right; width:10%; margin-right:-130px">
		                <ul class="navbar-nav ml-auto moDelte">
		                    <li class="nav-item dropdown no-arrow mx-1">
		                        <a class="nav-link dropdown-toggle" href="#" id="dotDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" 
		                            aria-expanded="false">
		                            <i class="fas fa-ellipsis-v" style="color:black; font-size: 25px;"></i>
		                        </a>
	                        	<div class="dropdown-list dropdown-menu shadow" aria-labelledby="dotDropdown" style="margin-left:-180px; margin-top: -10px;">
		                            <a class="dropdown-item d-flex align-items-center" href="updateForm.de?no=${b.boardNo}">
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
	                                    <button type="button" id="realDeleteBoard" class="n-btn su_btn_all su_btn_medium" data-dismiss="modal">확인</button>
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
	                    <span class="font-weight-bold">${ b.boWriter } ${ b.jobName }</span>
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
				
				<c:if test="${ not empty at }">
	                <div class="su_board_file">
	                    <span><i class="fas fa-paperclip" style="color: #5e7e9b;">&nbsp;</i></span>
		            	<span>첨부파일 &nbsp;: &nbsp;</span>
		                <a href="${ at.atChangeName }" download="${ at.atOriginName }">${ at.atOriginName }</a>
		            </div>
				</c:if>
	            <br>
	
	            <div class="su_board_count tableOption">
	                <div style="display:flex">
	                    <div class="board-plus-box">
	                        <span class="fas fa-comments"></span>
	                        <span>댓글 <span id="reCount">0</span> 개</span>
	                    </div>
	                    &ensp;&ensp;
	                    <div class="board-plus-box">
	                        <span class="fas fa-eye"></span>
	                        <span>조회수 ${ b.boardCount }회</span>
	                    </div>
	                    <!-- 
	                    <div class="board-plus-box">
	                        <span class="fas fa-thumbs-up"></span>
	                        <span>추천수 0 </span>
	                    </div>
	                     -->
	                </div>
	                <div>
	                    <a href="#" onclick="window.open('address','window_name','width=430,height=500,location=no,status=no,scrollbars=yes');" style="color:black; margin-top:0px">
	                        <i class="material-symbols-outlined" style="color:#5e7e9b; font-size: 20px; vertical-align:middle; margin:0 8px 5px 20px;">mail</i>
	                        <span>메일발송</span>
	                    </a>
	                </div>
	            </div>
	
	            <!-- 댓글 영역 -->
	            <div class="su_board_reply">
	            	<div class="ajaxReply">
						<!-- 이 밑으로 ajax통해서 댓글 보여짐 -->
	            	
	            	</div>
				
					<!-- 댓글 작성 영역, onclick시 parentNo 전달 -->
	                <div class="su_reply_Barea">
	                    <div class="su_reply" style="width: 100%;">
	                        <div>
	                            <img src="resources/defaultProfile.png" alt="">
	                        </div>
	                        
	                        <div style="width: 100%">
	                            <input style="width: 100%;" type="text" placeholder="댓글 입력" id="replyContent">
	                        </div>
	
	                    </div>
                        <div class="su_reply_btn">
                            <button type="button" class="n-btn su_btn_border btn-sm" id="writeReplyBtn" onclick="insertReply(0);">댓글 작성</button>
                        </div>
	                </div>
				<script>
					$(function(){
						selectReplyList();
					})
					
					function selectReplyList(){ // 댓글 조회
						
						$.ajax({
							url: "rList.de",
							data: {no:"${b.boardNo}"},
							success:function(rList){
								let value = "";
								let user = "${loginUser.memName}";
								let root = "${pageContext.request.contextPath}";
								
								for(let i=0; i<rList.length; i++){
									// 원댓글 or 대댓글 조건문
									if(rList[i].replyParent == 0 && rList[i].replyStatus == 'Y'){ // 원댓글
										value += '<div class="su_reply_Barea selNo' + rList[i].replyNo + '">';
										console.log("원댓글");
									}else if(rList[i].replyStatus == 'Y'){ // 대댓글
										value += '<div class="su_reply_Barea su_rreply_Barea selNo' + rList[i].replyNo + '">';
										console.log("대댓글");
									}else if(rList[i].replyStatus == 'N'){ // 대댓글이면서 삭제됐을 경우
										value += '<div>';
									}
									console.log(i);
									console.log(rList[i]);
									if(rList[i].replyStatus == 'Y'){
										value += '<div class="su_reply">'
													+ '<div>' 
														+'<img src="' + root + '/resources/profile_images/defaultProfile.png" alt="">'
													+ '</div>'
													+ '<div id="reUpdateArea' + rList[i].replyNo + '">'
														+ '<div class="su_reply_writer">'
															+ '<span class="font-weight-bold">' + rList[i].replyWriter + '</span>'
															+ '<span class="font-weight-bold"> ' + rList[i].replyJob+ '</span>'
															+ '<span style="margin-right:10px"> | ' + rList[i].replyDate + '</span>';
															// 원댓글만 댓글 추가 버튼 보이게끔 (댓글 작성자 본인 또한 본인 댓글에 대댓글 가능)
															if(rList[i].replyParent == 0){
																value += '<a id="pReplyEvent' + rList[i].replyNo + '" style="cursor: pointer;" onclick="rReply(' + rList[i].replyNo + ');"><i class="fas fa-reply" style="transform: rotate(180deg);"></i> 댓글</a>';
															}
												 value += '</div>'
														+ '<div class="su_reply_Bcontent conNo' + rList[i].replyNo + '" style="width:95%;">'
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
										}
										value += '</div>'
											   + '<div class="pReply' + rList[i].replyNo + '">'
											   + '</div>';
									}else if(i < (rList.length - 1)){
										console.log("삭제된 꼬리 있는 원댓글");
										if((rList[i].replyParent == 0) && (rList[i+1].replyParent != 0) && (rList[i+1].replyStatus == 'Y')){ // 대댓글 있는 원댓글이면서 삭제됐을 경우
											value += '<div class="su_reply">'
			                							+'<div style="height:48px; line-height:48px">삭제된 댓글입니다.</div>'
			                						+'</div></div>';
										}
									}
									
								}
								
								$(".ajaxReply").html(value);
			    				$("#reCount").text(rList.length);
							}, 
							error:function(){
								console.log("댓글리스트 조회용 ajax통신 실패");
							}
						})
					}
					
					function rReply(rNo){ // 대댓글 버튼 클릭 시 실행
                        const rReplyDiv = '<div class="su_reply_Barea su_rreply_Barea selNo' + rNo + '" id="clickRR' + rNo + '">'
                                            + '<div class="su_reply" style="width: 100%;">'
                                                + '<div>'
                                                    + '<img src="${pageContext.request.contextPath}/resources/profile_images/defaultProfile.png" alt="">'                                        
                                                + '</div>'
                        
                                                + '<div style="width: 100%">'
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
					
                 	// 댓글 insert 
                    function insertReply(replyParentNo){ 
                 		let replyDepth = 0;
                 		if(replyParentNo != 0){ // 댓글 깊이
                 			replyDepth = 1;
                 		}
						 $.ajax({
							url: "insertRe.de",
							data:{
								reBoardNo:${b.boardNo},
								replyDepth:replyDepth,
								replyParent:replyParentNo,
								replyContent:$("#replyContent").val(),
								replyWriter:"${loginUser.memName}",
								replyJob:"${loginUser.jobCode}"
							},
							success(result){
								selectReplyList();
								$("#replyContent").val("");
							},
							error(){
								console.log("댓글 등록 실패");
							}
							
						}) 
					}
                    
                    // 댓글 수정 div
                    function updateReBtn(rNo){
                    	$.ajax({
							url: "selectRe.de",
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
                    		url:"updateRe.de",
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
                    			url:"deleteRe.de",
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
                    		url:"delete.de",
                    		data:{
                    			boardNo:${b.boardNo},
                    			atPath:'${at.atChangeName}'
                    		},
                    		success(result){
                    			if(result == 3){
                    				console.log(result);
                    				$("#modalContent").html("글이 삭제 되었습니다.");
	                    			$("#resultUrl").attr("onclick", "location.href='list.de'");
	                    			$("#moContent").modal("show");
                    			}else{
                    				$("#modalContent").html("삭제에 실패하였습니다.");
	                    			$("#resultUrl").attr("onclick", "");
	                    			$("#moContent").modal("show");
                    			}
                    			
                    		},
                    		error(){
                    			console.log("ajax통신 실패");
                    		}
                    	})
                    })
                    
				</script>
				
	            </div>
	        </div>
	    </div>
	
	</div>
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>