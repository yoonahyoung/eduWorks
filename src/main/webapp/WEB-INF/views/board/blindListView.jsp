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

<title>익명 게시판 조회</title>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<!-- Begin Page Content -->
	<div>
	    <div class="row">
	        <!-- 게시판 영역 -->
	        <div class="col-10" id="col-10">
                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4" id="boardHeader">
                    <h2 style="margin:25px 15px 25px 15px; color:black">익명 게시판</h2>
                </div><br><br>
                <div class="filterHead">
                	<div><!-- 자리 채우기용 --></div>
                    <div style="text-align: center;">
		                <input type="text" style="width: 300px;" id="promoKeyword" placeholder="제목/작성자 입력">
		                <button type="button" class="su_btn_border btn-sm su_btn_search">검색</button>
	            	</div>
                    <div class="board-write-btn">
                        <button type="button" class="btn" id="bWrite-btn" onclick="location.href='enrollForm.bl'">글작성</button>
                    </div>
                </div><br>
                
                <div>
                    <table class="boardTable">
                        <tbody>
                        	<c:choose>
                        		<c:when test="${ empty list }">
                        			<tr>
                        				<td>
                        					글이 존재하지 않습니다.
                        				</td>
                        			</tr>
                        		</c:when>
                        		<c:otherwise>
                        			<c:forEach var="b" items="${ list }">
			                            <tr>
			                            	<td class="no" width="5%" align="center" id="no${b.boardNo}">${ b.boardNo }</td>
			                                <td id="fContent0">
			                                    <p>
			                                        <div class="side_side">
			                                            <span id="boardTitle">${ b.boardTitle }</span>
			                                            <div id="likeReply">
			                                                <div id="reply">
			                                                    &nbsp;&nbsp;<i class="fas fa-comments"></i><br>
			                                                    <span class="replyCountSpan${b.boardNo}">[0]</span>
			                                                </div>
			                                                <div id="like">
			                                                    &nbsp;<i class="fas fa-thumbs-up"></i><br>
			                                                    <span class="likeCountSpan${b.boardNo}">[0]</span>
			                                                </div>
			                                            </div>
			                                        </div> 
			                                        <span id="w-day">작성일 </span><span>${ b.boardEnDate }</span>
			                                    </p>
			                                </td>
			                            </tr>
			                        </c:forEach>
		                        </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>
			        
                <div id="n-pagingBar">
	                <nav aria-label="Page navigation example">
	                    <ul class="pagination justify-content-center"> 
	                    	<c:choose>
	                    		<c:when test="${ pi.currentPage eq 1 }">
	                    			<li class="page-item">
				                        <a class="page-link disabled" aria-label="Previous">
				                        	<span aria-hidden="true">&laquo;</span>
				                        </a>
			                    	</li>
	                    		</c:when>
	                    		<c:otherwise>
				                    <li class="page-item">
				                        <a class="page-link" href="list.no?cpage=${ pi.currentPage-1 }" aria-label="Previous">
				                        	<span aria-hidden="true">&laquo;</span>
				                        </a>
				                    </li>
			                    </c:otherwise>
			            	</c:choose>
			            	
			            	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			            		<li class="page-item"><a class="page-link" href="list.bl?cpage=${ p }">${ p }</a></li>
			            	</c:forEach>
			            	
			            	<c:choose>
	                    		<c:when test="${ pi.currentPage eq maxPage }">
	                    			<li class="page-item">
				                        <a class="page-link disabled" aria-label="Next">
				                        	<span aria-hidden="true">&raquo;</span>
				                        </a>
			                    	</li>
	                    		</c:when>
	                    		<c:otherwise>
				                    <li class="page-item">
				                        <a class="page-link" href="list.bl?cpage=${ pi.currentPage+1 }" aria-label="Next">
				                        	<span aria-hidden="true">&raquo;</span>
				                        </a>
				                    </li>
			                    </c:otherwise>
			            	</c:choose>
	                    </ul>
	                </nav>
	            </div>
            </div>
	
            <!-- 오른쪽 content -->
            <div class="col-2" id="col-2">
              <table class="bestTable">
                <thead>
                	<tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                    <tr>
                        <th colspan="2">추천게시판 <i class="fa fa-thumbs-up fa-regular"></i></th>
                    </tr>
                </thead>
                <tbody id="thumbsHotArea">
                    
                </tbody>
              </table>
              
              <br><hr class="hr_line">
              
              <table class="bestTable">
                <thead>
                	<tr><td></td></tr><tr><td></td></tr>
                    <tr>
                        <th colspan="2">핫게시판 <i class="fa fa-comments fa-regular"></i></th>
                    </tr>
                </thead>
                <tbody id="replyHotArea">
                    
                </tbody>
              </table>
              
              <br><hr class="hr_line">
              
              <div align="center" style="line-height:30px; margin-top:30px; font-weight:700;">
              	<i class="fa fa-exclamation-circle"></i>
              	<p>인터넷은 우리가 함께 만들어가는 <br> 소중한 공간입니다. <br>
              	댓글 작성 시 <br>타인에 대한 배려와 책임을 담아주세요.</p>
              </div>
            </div>
            
            <script>
		           	$(function(){ 
		           		// 상세화면
		           		$(".boardTable>tbody>tr").click(function(){
		           			// 선택된 tr의 자식요소 중에서 no라는 클래스를 가진 자식의 text값
		           			location.href = "detail.bl?no=" + $(this).children(".no").text(); 
		           		})
		           		
		           		$.ajax({ // 추천 수 조회
		           			url:"likeCount.bl",
		           			success(map){
		           				// 메인 게시판에 갯수 뿌려주기
		           				for(let i=0; i<map.like.length; i++){
		           					
				           			if($("#no"+map.like[i].boardNo).text() == map.like[i].boardNo){
				           				$(".likeCountSpan"+map.like[i].boardNo).html("[" + map.like[i].likeCount + "]");
				           			}
		           				}
		           				
		           				// 추천 게시판에 리스트 뿌려주기
		           				let value="";
		           				let count = 0;
       							for(let i=0; i<map.list.length; i++){ // 상위 다섯개 게시판만 불러오도록
       								if(count==5){
   										break;
   									}else
       								if(map.like[i] == undefined || map.like[i] == null || map.like[i] == ""){
       									value += '<tr>'
	           				                      + '<td align="center"><a>-</a></td>'
	           				                      + '<td align="right"></td>'
	           				                   + '</tr>';
           				                count++;
       								}else {
	       								for(let j=0; j<map.list.length; j++){
	       									if(count==5){
	       										break;
	       									}else
	       									if(map.like[i].boardNo == map.list[j].boardNo){
		       									value += '<tr>'
			           				                      + '<td><a href="detail.bl?no=' + map.list[j].boardNo + '">' + map.list[j].boardTitle + '</a></td>'
			           				                      + '<td align="right">' + (map.list[j].boardEnDate).substr(5) + '</td>'
			           				                   + '</tr>';
		       									count++;
		       								}
	       								}
       								}
       							}
       							
       							$("#thumbsHotArea").html(value);
	           					
		           			},
		           			error(){
		           				console.log("ajax통신 실패");
		           			}
		           		})
		           		
		           		$.ajax({ // 댓글 수 조회
		           			url:"replyCount.bl",
		           			success(map){
		           				// 메인 게시판 댓글 수 뿌려주기
		           				for(let i=0; i<map.reply.length; i++){
				           			if($("#no"+map.reply[i].reBoardNo).text() == map.reply[i].reBoardNo){
				           				$(".replyCountSpan"+map.reply[i].reBoardNo).html("[" + map.reply[i].replyCount + "]");
				           			}
				           		}
		           				
		           				// 핫 게시판에 리스트 뿌려주기
		           				let value="";
		           				let count = 0;
		           				for(let i=0; i<map.list.length; i++){ // 상위 다섯개 게시판만 불러오도록
		           					if(count == 5){
		           						break;
		           					}else
       								if(map.reply[i] == undefined || map.reply[i] == null || map.reply[i] == ""){
       									value += '<tr>'
	           				                      + '<td colspan="2" align="center"><a>-</a></td>'
	           				                   + '</tr>';
           				                count++;
       								}else {
	       								for(let j=0; j<map.list.length; j++){
	       									if(count == 5){
	    		           						break;
	    		           					}else
	       									if(map.reply[i].reBoardNo == map.list[j].boardNo){
		       									value += '<tr>'
			           				                      + '<td><a href="detail.bl?no=' + map.list[j].boardNo + '">' + map.list[j].boardTitle + '</a></td>'
			           				                      + '<td align="right">' + (map.list[j].boardEnDate).substr(5) + '</td>'
			           				                   + '</tr>';
		       									count++;
		       								}
	       								}
       								}
       							}
       							
       							$("#replyHotArea").html(value);
		           			},
		           			error(){
		           				console.log("ajax통신 실패");
		           			}
		           		})
		           		
		           		
		           	})
		        </script>
	
	    </div>
	   
	</div>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>