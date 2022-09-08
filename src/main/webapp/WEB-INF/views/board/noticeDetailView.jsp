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

<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
	<div class="su_content_body">
	
	    <div class="su_contentArea">
	        <div class="su_content_header">
	            <h2 class="su_sub_menu_name">전사 공지</h2>
	
	
	            <div class="su_btn_two_area">
	                <div class="su_left_area">
	                	<!-- 자리 채우기용 div -->
	                </div>
	
	                <div>
	                    <button type="button" class="n-btn su_btn_border" onclick="history.back();">목록으로</button>
	                </div>
	
	            </div>
	
	            <hr class="hr_line">
	
	            <br>
	
	        </div>
	
	        <!-- 게시글 영역 -->
	        <div class="su_board_body">
	
	            <div class="su_board_title" id="n-title">
	                <h3>${ b.boardTitle }</h3><span> [<!-- 댓글 갯수 -->]</span>
	            </div>
	
	            <!-- 수정삭제 버튼 -->
	            <div class="detailDot" style="float:right; width:10%; margin-right:-130px">
	                <ul class="navbar-nav ml-auto moDelte">
	                    <li class="nav-item dropdown no-arrow mx-1">
	                        <a class="nav-link dropdown-toggle" href="#" id="dotDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" 
	                            aria-expanded="false">
	                            <i class="fas fa-ellipsis-v" style="color:black; font-size: 25px;"></i>
	                        </a>
	                        <div class="dropdown-list dropdown-menu shadow" aria-labelledby="dotDropdown" style="margin-left:-180px; margin-top: -10px;">
	                            <!-- 작성자에게만 보임 -->
	                            <a class="dropdown-item d-flex align-items-center" href="#">
	                                <span class="font-weight-bold">수정하기</span>
	                            </a>
	                            <a class="dropdown-item d-flex align-items-center" href="#" data-toggle="modal" data-target="#delete">
	                                <span class="font-weight-bold">삭제하기</span>
	                            </a>
	                        </div>
	                    </li>
	                </ul>
	            </div>
	
	            <!-- 삭제 모달창 -->
	            <div class="modal" id="delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
	                    <!--Content-->
	                    <div class="modal-content modal_alert">
	                        
	                        <!--Body-->
	                        <div class="modal-body text-center modal_alert_child">
	                            <div>
	            
	                                <h5 class="mt-1 mb-2">정말 삭제하시겠습니까?</h5>
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
	
	             <!-- ==================================== 삭제 완료 후 alert창 출력하기==================================================== -->
				
				
	            <div class="su_board_writer">
	                <div>
	                    <img src="${pageContext.request.contextPath}/resources/profile_images/defaultProfile.png" alt="">
	                </div>
	                <div>
	                    <span class="font-weight-bold">${ b.boWriter }${ b.jobName }</span>
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
	
                <div class="su_board_file">
                    <span><i class="fas fa-paperclip" style="color: #5e7e9b;">&nbsp;</i></span>
	            	<span>첨부파일 &nbsp;: &nbsp;</span>
	                <!-- 첨부파일 이름 나오게 -->
	            </div>
	
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
				<!-- 이 밑으로 ajax통해서 댓글 보여짐 -->
				
				<!-- --------------------------- -->
	                <!-- 댓글 작성 영역 -->
	                <div class="su_reply_Barea">
	                    <div class="su_reply" style="width: 100%;">
	                        <div>
	                            <img src="resources/defaultProfile.png" alt="">
	                        </div>
	                        
	                        <div style="width: 100%">
	                            <input style="width: 100%;" type="text" placeholder="댓글 입력">
	                        </div>
	
	                    </div>
                        <div class="su_reply_btn">
                            <button type="button" class="btn su_btn_border btn-sm" id="writeReplyBtn">댓글 작성</button>
                        </div>
	
	                </div>
	            </div>
				<!-- 댓글 script -->
				<script>
					$(function(){
						selectReplyList();
					})
					
					function selectReplyList(){
						
						$.ajax({
							url: "rList.no",
							data: {no:"${b.boardNo}"},
							success:function(rList){
								console.log(rList);
								
								let value = "";
								let user = "${loginUserN.memName}";
								let root = "${pageContext.request.contextPath}";
								console.log(user);
								
								for(let i=0; i<rList.length; i++){
									// 원댓글 or 대댓글 조건문
									if(rList[i].replyParent == 0){
										value += '<div class="su_reply_Barea">';
									}else{
										value += '<div class="su_reply_Barea su_rreply_Barea">';
									}
											value += '<div class="su_reply">'
														+ '<div>' 
															+'<img src="' + root + '/resources/profile_images/defaultProfile.png" alt="">'
														+ '</div>'
														+ '<div>'
															+ '<div class="su_reply_writer">'
																+ '<span class="font-weight-bold">' + rList[i].replyWriter + '</span>'
																+ '<span style="margin-right:10px">' + rList[i].replyDate + '</span>';
																// 원댓글만 댓글 추가 버튼 보이게끔
																if(rList[i].replyParent == 0){
																	value += '<i class="fas fa-reply" style="transform: rotate(180deg);"></i> 댓글';
																}
													 value += '</div>'
															+ '<div class="su_reply_Bcontent">'
																+ '<p>' + rList[i].replyContent +'</p>'
															+ '</div>'
														+ '</div>'
													+ '</div>';
										// 댓글 작성자만 수정, 삭제 버튼 보이게끔
										if(rList[i].replyWriter == user){
											 value += '<div class="su_reply_btn">'
														+ '<button type="button" class="btn btn-sm su_btn_border" style="border:0px">수정</button>|'
														+ '<button type="button" class="btn btn-sm su_btn_border" style="border:0px">삭제</button>'
												   + '</div>';
										}
										value += '</div>';
								}
								
								$(".su_board_reply").html(value);
			    				$("#reCount").text(rList.length);
							}, 
							error:function(){
								console.log("댓글리스트 조회용 ajax통신 실패");
							}
						})
					}
				</script>
	        </div>
	    </div>
	
	</div>
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>