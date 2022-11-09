<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.su_content_body h2, h3, h4, h5, h6{
		color: black !important;
	}
	
</style>

<!-- css -->
<link href="${pageContext.request.contextPath}/resources/css/promotion.css" rel="stylesheet" type="text/css">

</head>
<body>

	<jsp:include page="../common/header.jsp" />

	
	<div class="su_content_body">

	    <div class=" su_contentArea">
	        <div class="su_content_header">
	            <h2 class="su_sub_menu_name">홍보물 관리</h2>
	
	            <br><br><br><br><br>
	
	            <div style="text-align: center;">
	                <input type="text" style="width: 300px;" id="promoKeyword" placeholder="제목/작성자/직책 입력">
	                <button type="button" class="su_btn_border btn-sm su_btn_search" onclick="searchList(1);">검색</button>
	            </div>
	
	            <div class="su_content_body">
	
	                <div class="selectOption su_btn_area" align="right">
	                    <select style="width: 150px;" id="selectNo" onchange="searchList(1);">
	                        <option value="">전체</option>
	                        <option value="1">배너</option>
	                        <option value="2">블로그</option>
	                        <option value="3">포스터</option>
	                        <option value="4">SNS</option>
	                    </select>
	                </div>
	
	                <div class="main_width su_table_pad">
	                    <table class="board-content table su_table_hover" id="suTable" align="center">
	                        <thead>
	                            <tr class="table_thead_border">
	                                <th width="5%;"><input type="checkbox" name="selectAll"></th>
	                                <th width="5%;">번호</th>
	                                <th width="15%;">종류</th>
	                                <th>제목</th>
	                                <th width="15%;">작성자</th>
	                                <th width="15%;">등록일</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                        
	                            <c:choose>
	                            	<c:when test="${empty list }">
	                            		<tr>
	                            			<th colspan="6">현재 게시글이 없습니다.</th>
	                            		</tr>
	                            	</c:when>
	                            	<c:otherwise>
	                            		<c:forEach var="p" items="${ list }">
	                            			<tr>
				                                <td width="5%"><input type="checkbox" name="deleteList"></td>
				                                <td class="no">${ p.promoNo }</td>
				                                <c:choose>
				                                	<c:when test="${ p.promoCateNo eq 1 }">
				                                		<td>배너</td>
				                                	</c:when>
				                                	<c:when test="${ p.promoCateNo eq 2 }">
				                                		<td>블로그</td>
				                                	</c:when>
				                                	<c:when test="${ p.promoCateNo eq 3 }">
				                                		<td>포스터</td>
				                                	</c:when>
				                                	<c:otherwise>
				                                		<td>SNS</td>
				                                	</c:otherwise>
				                                </c:choose>
				                                
				                                <td>${ p.promoTitle }</td>
				                                <td>${ p.promoWriter }</td>
				                                <td>${ p.promoCreateDate }</td>
				                            </tr>
	                            		</c:forEach>
	                            	</c:otherwise>
	                            </c:choose>	
	                            
	                        </tbody>
	                    </table>
	
	                    <script>
	
	                        $(document).ready(function(){
	                            $("input[name='selectAll']").click(function(){
	                                // 전체 선택 체크박스 체크시 두개의 체크박스가 체크되고
	                                if( $("input[name='selectAll']").is(":checked") ){
	                                    $("input[name='deleteList']").prop("checked", true);
	                                } else{	// 전체 선택 체크박스 해제시 두개의 체크박스 체크가 해제된다.
	                                    $("input[name='deleteList']").prop("checked", false);
	                                }
	                            });
	                            
	                            $("input[name='deleteList']").click(function(){
	                                var count = $("input[name='deleteList']").length;
	                                var checked = $("input[name='deleteList']:checked").length;
	                                
	                                // 체크한 체크박스의 개수와 전체 체크박스 개수가 같으면 전체 선택 체크박스가 체크된다.
	                                if(count != checked){
	                                    $("input[name='selectAll']").prop("checked", false);
	                                } else{
	                                    $("input[name='selectAll']").prop("checked", true);
	                                }
	                                
	                            });
	                            
	                            // 각 게시글의 행을 클릭하면 게시글 상세보기 페이지로 이동
	                            //$("#suTable>tbody>tr").on("click", "td:not(:first-child)", function(){ 
	                           // ajax 포함되었을 땐 이런 식으로 작성하기
	                            $(document).on("click", "#suTable>tbody>tr td:not(:first-child)", function(){
	                            	 console.log($(this).parent().children(".no").text());
	                            	location.href = "detail.pr?no=" + $(this).parent().children(".no").text();
	                            });
	                            
	                            // 
	                           
	                            
	                            
	                        })
	                        
	                        // 제목, 작성자 키워드 검색 / 카테고리 분류 기능 ajax=======================================================
                            function searchList(page){
                            	$.ajax({
                            		url:"search.pr",
                            		data:{
                            				cNo:$("#selectNo").val(),
                            				keyword:$("#promoKeyword").val(),
                            				ppage: page
                            			},
                            		success:function(map){
                            			const pi = map.pi;
                            			const list = map.list;
                            			
                            			// 검색한 리스트와 페이징으로 대체
                            			let nList = "";
                            			// 검색 결과가 없을 때
                            			if(list.length == 0){
                            				nList += "<tr>"
	                            					+ "<th colspan='6'>현재 게시글이 없습니다.</th>"
	                            					+ "</tr>";
                            			} else {
	                            			for(let i = 0; i < list.length; i++){
	                            				nList += "<tr>"
	                            				      + "<td width='5%'><input type='checkbox' name='deleteList'></td>"
	                            				      + '<td class="no">' + list[i].promoNo + '</td>';
	                            				
	                            				if(list[i].promoCateNo == 1){
	                            					nList += '<td>배너</td>';
	                            				} else if(list[i].promoCateNo == 2){
	                            					nList += '<td>블로그</td>';
	                            				} else if(list[i].promoCateNo == 3){
	                            					nList += '<td>포스터</td>';
	                            				} else{
	                            					nList += '<td>SNS</td>';
	                            				}
				                                
	                            				nList += '<td>' + list[i].promoTitle + '</td>'
	                            					  + '<td>' + list[i].promoWriter + '</td>'
	                            					  + '<td>' + list[i].promoCreateDate + '</td>'
	                            					  + '</tr>';
	                            			}
                            				
                            			}
                            			
                            			// 검색한 페이징 변경
                            			let nPi = "";
                            			
                            			nPi = '<li class="page-item">';
                            			if(pi.currentPage == 1){
                            				nPi += '<a class="page-link su_page_btn su_prenext diabled" aria-label="Previous">'
    			                                + '<span aria-hidden="true">&laquo;</span></a>';
                            			} else{
                            				nPi += '<a class="page-link su_page_btn su_prenext" onclick="searchList(' + (pi.currentPage - 1) + ');" aria-label="Previous">'
    			                                + '<span aria-hidden="true">&laquo;</span></a>';
                            			}
                            			nPi += "</li>";
                            	
                            			for(let p = pi.startPage; p <= pi.endPage; p++){
                            				if(p == pi.currentPage){
                            					nPi += '<li class="page-item"><a class="page-link su_page_btn su_curPage_btn disabled">' + p + '</a></li>';
                            				} else{
                            					nPi += '<li class="page-item"><a class="page-link su_page_btn" onclick="searchList(' + p + ');">' + p + '</a></li>';
                            				}
                            			}
		                                
                            			nPi += '<li class="page-item">';
                            			if(pi.currentPage == pi.endPage){
                            				nPi += '<a class="page-link su_page_btn su_prenext disabled" aria-label="Next">'
    	                                		+ '<span aria-hidden="true">&raquo;</span></a>';
                            			} else{
                            				nPi += '<a class="page-link su_page_btn su_prenext" onclick="searchList(' + (pi.currentPage + 1) + ');" aria-label="Next">'
    	                                		+ '<span aria-hidden="true">&raquo;</span></a>';
                            			}
                                		nPi += "</li>";
                            			
                                		$("#suTable tbody").empty();
                            			$("#suTable tbody").append(nList);
                            			$("#suPaging").empty();
                            			$("#suPaging").append(nPi);
                            		}, error:function(){
                            			console.log("ajax 홍보물 검색 조회 실패");
                            		}
                            	});
                            };
	                    
	                    </script>
	
	
	
	                    <br><br><br>
	                    
	                </div>
	
	                <!-- 삭제 버튼은 관리자(팀장?)만 보이게 -->
	                <div style="width: 100%;">
						<c:if test="${ loginUser.jobCode eq 'J3' or loginUser.jobCode eq 'J4' }">
	                    	<button type="button" class="btn su_btn_all" style="float: left;" id="delPromoBtn" data-toggle="modal" data-target="#nocheck">삭제 &nbsp;<span class="fas fa-trash"></span></button>
			            </c:if>
	                    <button type="button" class="btn su_btn_all" style="float: right;" onclick="location.href='enrollForm.pr';">글쓰기</button>
	                </div>
	                
	                 <!-- 삭제 모달창 -->
	                 <div class="modal" id="deletePromo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                    <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
	                        <!--Content-->
	                        <div class="modal-content modal_alert">
	                            
	                            <!--Body-->
	                            <div class="modal-body text-center modal_alert_child">
	                                <div style="margin-top: 1.5rem;">
	                
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
	                
	                <!-- 체크 안했을 때 -->
	                <div class="modal" id="nocheck" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                    <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
	                        <!--Content-->
	                        <div class="modal-content modal_alert">
	                            
	                            <!--Body-->
	                            <div class="modal-body text-center modal_alert_child">
	                                <div style="margin-top: 1.5rem;">
	                
	                                    <h5 class="mt-1 mb-2">삭제할 게시글을 선택해주세요.</h5>
	                                    <br>                                
	                                    <div class="text-center mt-4"> 
	                                        <button type="button" class="btn su_btn_all su_btn_medium" data-dismiss="modal">확인</button>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
					
					
					<!-- 삭제 관련 script -->
	                <script>
	                    $(function(){
	                        // 홍보물 삭제
	                        let checkCnt = "";
	                        
	                        $("input[type=checkbox]").change(function(){
	                            checkCnt = "";
	                            $("input[name='deleteList']:checked").each(function(){
	                            	
	                            	//console.log($(this).parent().parent().children(".no").text());
	                                checkCnt += ($(this).parent().parent().children(".no").text()) + ","; // 체크된 것만 게시글번호 뽑기 "2,3,4,"
	                            });
	                            
	                            checkCnt = checkCnt.substring(0,checkCnt.lastIndexOf(",")); // 맨 뒤 콤마 삭제 "2,3,4"
                                
	                            
	                            // 선택된 체크박스 없이 삭제 버튼 누른 경우
	                            if(checkCnt == ''){
	                                $("#delPromoBtn").attr("data-target", "#nocheck");
	                            }
	
	                            else {
	                                $("#delPromoBtn").attr("data-target", "#deletePromo");
	                            }
	                        });
	
	                        // 모달에서 삭제 확인 클릭시 DB에서 삭제
	                         $("#realDelete").click(function(){
	                            
	                             $.ajax({
	                                 url:"aDelete.pr", 
	                                 data:{
	                                	 	"checkCnt":checkCnt
	                                 },
	                                 success:function(result){
	                                     if(result == "success"){
	                                         location.reload();
	                                     } else{
	                                         alert("홍보물 삭제에 실패하였습니다.");
	                                     }
	                                 },
	                                 error:function(){
	                                     console.log("ajax 게시글 삭제 실패")
	                                 }
	                             });
	                         });
	
	                    })
	                </script>
	
	                <br><br>
	
	                
	                <!-- 페이징 영역 -->
	                <div style="margin:30px 0 30px 0">
	                    <nav aria-label="Page navigation example">
	                        <ul class="pagination justify-content-center" id="suPaging">
	                            <li class="page-item">
	                            	<c:choose>
	                            		<c:when test="${ pi.currentPage eq 1 }">
			                                <a class="page-link su_page_btn su_prenext diabled" aria-label="Previous">
			                                <span aria-hidden="true">&laquo;</span></a>
			                            </c:when>
			                            <c:otherwise>
			                            	<a class="page-link su_page_btn su_prenext" href="list.pr?ppage=${ pi.currentPage - 1 }" aria-label="Previous">
			                                <span aria-hidden="true">&laquo;</span></a>
			                            </c:otherwise>
			                        </c:choose>
			                     </li>
			                        
		                        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		                        
		                        	<c:choose>
		                        		<c:when test="${pi.currentPage eq p }">
		                        			<li class="page-item"><a class="page-link su_page_btn su_curPage_btn disabled" href="list.pr?ppage=${ p }">${ p }</a></li>
		                        		</c:when>
		                        		<c:otherwise>
		                        			<li class="page-item"><a class="page-link su_page_btn" href="list.pr?ppage=${ p }">${ p }</a></li>
		                        		</c:otherwise>
		                        	</c:choose>
		                        	
		                        </c:forEach>
			                        
	                                
	                           
	                            
	                            <li class="page-item">
	                            	<c:choose>
	                            		<c:when test="${ pi.currentPage eq pi.endPage }">
			                                <a class="page-link su_page_btn su_prenext disabled" aria-label="Next">
	                                		<span aria-hidden="true">&raquo;</span></a>
			                            </c:when>
			                            <c:otherwise>
			                            	<a class="page-link su_page_btn su_prenext" href="list.pr?ppage=${ pi.currentPage + 1 }" aria-label="Next">
	                                		<span aria-hidden="true">&raquo;</span></a>
			                            </c:otherwise>
			                        </c:choose>
	                            </li>
	                            
	                        </ul>
	                    </nav>
	                </div>
	
	            </div>
	        </div>
	    </div>
	
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	

</body>
</html>