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
		                <input type="text" style="width: 300px;" id="blindKeyword" placeholder="제목/작성자 입력">
		                <button type="button" class="su_btn_border btn-sm su_btn_search" onclick="searchBar(1);">검색</button>
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
                        				<td id="emptyList">
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
				                        <a class="page-link" href="list.bl?cpage=${ pi.currentPage-1 }" aria-label="Previous">
				                        	<span aria-hidden="true">&laquo;</span>
				                        </a>
				                    </li>
			                    </c:otherwise>
			            	</c:choose>
			            	
			            	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			            		<li class="page-item"><a class="page-link" href="list.bl?cpage=${ p }">${ p }</a></li>
			            	</c:forEach>
			            	
			            	<c:choose>
	                    		<c:when test="${ pi.currentPage eq pi.maxPage }">
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
		           		$(".row").on("click", ".boardTable>tbody>tr", function(){
		           			// 선택된 tr의 자식요소 중에서 no라는 클래스를 가진 자식의 text값
		           			location.href = "detail.bl?no=" + $(this).children(".no").text(); 
		           		})
		           		
		           		selectBest("");
		           		selectReList("");
		           	})
		           	
		           	// 추천 수 조회 및 추천 게시판 리스트 뿌려주기
	           		function selectBest(reBoardNoStr){
		           		$.ajax({ // 추천 수 조회
		           			url:"likeCount.bl",
		           			data:{reBoardNoStr:reBoardNoStr},
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
	           					selectReList(reBoardNoStr);
	           					selectBest(reBoardNoStr);
		           			},
		           			error(){
		           				console.log("ajax통신 실패");
		           			}
		           		})
	           		}
		           	
		           	// 댓글 수 조회 및 핫 게시판 리스트 뿌려주기
	           		function selectReList(reBoardNoStr){
		           		$.ajax({ // 댓글 수 조회
		           			url:"replyCount.bl",
		           			data:{reBoardNoStr:reBoardNoStr},
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
	           		}
		           	
		        // 검색시 뿌려주는 리스트
	           	function searchBar(page){
	           		$.ajax({
	           			url:"search.bl",
	           			data:{
	           				keyword:$("#blindKeyword").val(),
	           				page:page
	           			},
	           			success(map){
	           				// 리스트
	           				let list = map.list;
	           				let sValue = "";
	           				// 페이징
	           				let pi = map.pi;
	           				let pValue = "";
	           				// 댓글수, 조회수 불러오기용
	           				let reBoardNoStr = "";
	           				
	           				if(list == null){
	           					sValue += '<tr>'
                       						+ '<td>검색 결과가 없습니다</td>'
               							+ '</tr>';
	           				}else{
	           					for(let i=0; i<list.length; i++){
	           						reBoardNoStr += list[i].boardNo;
	           						sValue += '<tr>'
				                            	+ '<td class="no" width="5%" align="center" id="no' + list[i].boardNo + '">' + list[i].boardNo + '</td>'
				                                + '<td id="fContent0">'
				                                    + '<p>'
				                                        + '<div class="side_side">'
				                                            + '<span id="boardTitle">' + list[i].boardTitle + '</span>'
				                                            + '<div id="likeReply">'
				                                                + '<div id="reply">'
				                                                    + '&nbsp;&nbsp;<i class="fas fa-comments"></i><br>'
				                                                    + '<span class="replyCountSpan' + list[i].boardNo + '">[0]</span>'
				                                                + '</div>'
				                                                + '<div id="like">'
				                                                    + '&nbsp;<i class="fas fa-thumbs-up"></i><br>'
				                                                    + '<span class="likeCountSpan' + list[i].boardNo + '">[0]</span>'
				                                                + '</div>'
				                                            + '</div>'
				                                        + '</div>' 
				                                        + '<span id="w-day">작성일 </span><span>' + list[i].boardEnDate + '</span>'
				                                    + '</p>'
				                                + '</td>'
				                            + '</tr>';
	           					}
	           					
	           					// 페이징바 처리
	           					if(pi.currentPage == 1){
	           						pValue += '<li class="page-item">'
	           									+ '<a class="page-link disabled" aria-label="Previous">'
	           										+ '<span aria-hidden="true">&laquo;</span>'
	           									+ '</a>'
	           								+ '</li>';
	           					}else{
	           						pValue += '<li class="page-item">'
	           									+ '<a class="page-link" onclick="searchBar(' + (pi.currentPage-1) + ')" aria-label="Previous">'
	           										+ '<span aria-hidden="true">&laquo;</span>'
	           									+ '</a>'
	           								+ '</li>';
	           					}
	           					
	           					for(let p=pi.startPage; p< pi.endPage; p++){
	           						pValue += '<li class="page-item"><a class="page-link" onclick="searchBar(' +  p  + ')">' +  p + '</a></li>';
	           					}
			            	
	           					if(pi.currentPage == pi.maxPage){
	           						pValue += '<li class="page-item">'
	           									+ '<a class="page-link disabled"  aria-label="Next">'
	           										+ '<span aria-hidden="true">&raquo;</span>'
	           									+ '</a>'
	           								+ '</li>';
	           					}else{
	           						pValue += '<li class="page-item">'
	           									+ '<a class="page-link" onclick="searchBar(' + (pi.currentPage+1) + ')" aria-label="Next">'
	           										+ '<span aria-hidden="true">&raquo;</span>'
	           									+ '</a>'
	           								+ '</li>';
	           					}
			            	
	           					$(".boardTable tbody").empty();
	           					$(".boardTable tbody").html(sValue);
	           					$("#n-pagingBar ul").empty();
	           					$("#n-pagingBar ul").html(pValue);
	           					
	           					selectBoardCount(reBoardNoStr);
	           				}
	           				
	           			},error(){
	           				console.log("ajax통신 실패");
	           			}
	           		})
	           	}
		        
		        // 검색 후 뿌려주는 게시판 추천수, 댓글수
		        function selectBoardCount(reBoardNoStr){
		        	$.ajax({ // 댓글 수 조회
	           			url:"replyCount.bl",
	           			data:{reBoardNoStr:reBoardNoStr},
	           			success(map){
	           				// 메인 게시판 댓글 수 뿌려주기
	           				for(let i=0; i<map.reply.length; i++){
	           					var id="";
	           					id = "no" + map.reply[i].reBoardNo;
			           			if($("#"+id).text() == map.reply[i].reBoardNo){
			           				$(".replyCountSpan"+id).html("[" + map.reply[i].replyCount + "]");
			           			}
			           		}
	           			},error(){
	           				console.log("ajax 통신 실패");
	           			}
	           			
		        	})
		        	
		        	 
	        		$.ajax({ // 추천 수 조회
	           			url:"likeCount.bl",
	           			data:{reBoardNoStr:reBoardNoStr},
	           			success(map){
	           				// 메인 게시판에 갯수 뿌려주기
	           				for(let i=0; i<map.like.length; i++){
	           					
			           			if($("#no"+map.like[i].boardNo).text() == map.like[i].boardNo){
			           				$(".likeCountSpan"+map.like[i].boardNo).html("[" + map.like[i].likeCount + "]");
			           			}
	           				}
	           			}
		        	})
		        }
		        </script>
	
	    </div>
	   
	</div>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>