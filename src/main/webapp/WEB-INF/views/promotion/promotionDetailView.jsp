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
	                
	                <span> &ensp;[${ rCount }]</span>
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
	            
	            <%-- <form id="postForm" method="post">
	            	<input type="hidden" name="pNo" value="${ p.promoNo }">
	            	<input type="hidden" name="filePath" value="${ at.atChangeName }">
	            </form>
	 --%>
	             <!-- ==================================== 삭제 완료 후 alert창 출력하기==================================================== -->
				<!-- 삭제 수정 스크립트 -->
				<!-- <script>
					function postFormSubmit(url){
						console.log($("input[name='pNo']").val());
						$("#postForm").attr("action", url);
						$("#postForm").submit();
					}
					
					
				</script> -->
	
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
	                                    <button type="button" id="realDelete" class="btn su_btn_all su_btn_medium" onclick="postFormSubmit('delete.pr')';">확인</button>
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
	                </div>
	                <div>
	                    <span class="font-weight-bold">${ p.promoWriter }</span>
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
	                    <span>댓글 ${ rCount }개</span>
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
	                <!-- id 뒤에 댓글번호 붙이기 ex) id="pReply${promoNo}" -->
	                
	                <c:if test="${ list.size() ne 0 }">
	                	<c:forEach var="r" items="${ list }">
	                		<c:if test="${ r.replyDepth eq 1 }">
		                		<div class="su_reply_Barea" id="pReply">
				                    <div class="su_reply">
				                        <div>
				                        <!-- 사진 join해서 연결하기 -->
				                            <img src="${pageContext.request.contextPath}/resources/profile_images/defaultProfile.png" alt="">
				                        </div>
				
				                        <div>
				                            <div class="su_reply_writer">
				                            	<input type="hidden" value="${ r.replyNo }">
				                                <span class="font-weight-bold">${ r.replyWriter }</span>
				                                <span style="margin-right:10px">&ensp;${ r.replyDate }</span>
				                                <!-- 대댓글 작성 버튼 -->
				                                <!-- ()안에 댓글 번호 넣기 -->
				                                <!-- 내가 작성한 댓글이 아닐 때만 보이게 -->
				                                <a id="pReplyEvent" style="cursor: pointer;" onclick="rReply();"><i class="fas fa-reply" style="transform: rotate(180deg);"></i> 댓글</a>
				                            </div>
				                            
				                            <div class="su_reply_Bcontent">
				                                <p>${ r.replyContent }</p>
				                            </div>
				                        </div>
				                    </div>
				
				                    <div class="su_reply_btn">
				                        <!-- 본인이 작성한 댓글에만 보임 -->
				                        <button type="button" class="btn btn-sm" style="border:0px; color: black;">수정</button>|
				                        <button type="button" class="btn btn-sm" style="border:0px; color: black;">삭제</button>
				                    </div>
				                </div>
				            </c:if>
			                
			                <!-- 대댓글 영역 -->
			                <!-- 위의 부모 댓글 번호의 대댓글만 출력 -->
			                
			                <c:forEach var="rr" items="${ list }">
				                <c:if test="${ rr.replyDepth eq 2 and rr.reBoardNo eq r.replyNo }">
				                
				                	<!-- 대댓글 하나의 영역 -->
					                <div class="su_reply_Barea su_rreply_Barea">
					                    <div class="su_reply">
					                        <div>
					                            <img src="${pageContext.request.contextPath}/resources/profile_images/defaultProfile.png" alt="">
					                        </div>
					
					                        <div>
					                            <div class="su_reply_writer">
					                                <span class="font-weight-bold">${ rr.replyWriter }</span>
					                                <span>${ rr.replyDate }</span>
					                            </div>
					                            
					                            <div class="su_reply_Bcontent">
					                                <p>${ rr.replyContent }</p>
					                            </div>
					                        </div>
					                    </div>
					
					                    <div class="su_reply_btn">
					                        <!-- 본인이 작성한 댓글에만 보임 -->
					                        <button type="button" class="btn btn-sm" style="border:0px">수정</button>|
					                        <button type="button" class="btn btn-sm" style="border:0px">삭제</button>
					                    </div>
					                    
					                </div>
				                </c:if>
	                		</c:forEach>
	                	</c:forEach>
		            </c:if>
		            
	                
	
	                <!-- 대댓글 작성 영역 -->
	                <!-- <div class="su_reply_Barea su_rreply_Barea">
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
	
	                </div> -->
	
	                <!-- 댓글 작성 영역 -->
	                <div class="su_reply_Barea">
	                    <div class="su_reply" style="width: 100%;">
	                        <div>
	                            <img src="${pageContext.request.contextPath}/resources/profile_images/defaultProfile.png" alt="">
	                        </div>
	                        
	                        <div style="width: 100%">
	                            <input style="width: 100%;" type="text" placeholder="댓글 입력" id="nContent">
	                        </div>
	
	                    </div>
	                    <div class="su_reply_btn">
	                        <button type="button" class="btn su_btn_border btn-sm" id="writeReplyBtn">댓글 작성</button>
	                    </div>
	
	                </div>
	
	                <script>
	                    $(document).ready(function(){
	                    })
	
	                    function rReply(){
	                        const rReplyDiv = '<div class="su_reply_Barea su_rreply_Barea">'
	                                            + '<div class="su_reply" style="width: 100%;">'
	                                                + '<div>'
	                                                    + '<img src="${pageContext.request.contextPath}/resources/profile_images/defaultProfile.png" alt="">'                                        
	                                                + '</div>'
	                        
	                                                + '<div style="width: 100%">'
	                                                    + '<input style="width: 100%;" type="text" placeholder="댓글 입력">'
	                                                + '</div>'
	
	                                            + '</div>'
	                                            + '<div class="su_reply_btn" id="su_reply_btn1">'
	                                                + '<button type="button" class="btn su_btn_border btn-sm writeReplyBtn" id="writeReplyBtn">댓글 작성</button>'
	                                            + '</div>'
	
	                                            + '</div>';
	                        $("#pReply").before(rReplyDiv);
	                        // 원 댓의 이벤트 제거
	                        $("#pReplyEvent").removeAttr("onclick");
	                        // 댓글 입력칸 focus
	                        $(".su_rreply_Barea>.su_reply input").focus();
	                            
	                    }
	
	                    // 숫자 주의하기(댓글 번호와 연결)
	                    $(document).on("click", ".su_rreply_Barea>#su_reply_btn1", function(){
	                        console.log("하,,,");
	                        $("#pReplyEvent1").attr("onclick", "rReply();");
	                    })
	                    
	
	
	                </script>
	
	                </div>
	
	            </div>
	        </div>
	
	    </div>
	
	
	
	</div>
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>