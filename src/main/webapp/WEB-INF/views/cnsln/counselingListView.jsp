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

</head>
<body>
	
	<jsp:include page="../common/header.jsp" />
	
	<div class="su_content_body">

	    <div class=" su_contentArea">
	        <div class="su_content_header">
	            <h2 class="su_sub_menu_name">상담 내역 관리</h2>
	
	            <br><br><br><br><br>
	
	            <div style="text-align: center;">
	                <input type="text" style="width: 300px;" id="cnslnKeyword" placeholder="내담자/전화번호 입력">
	                <button type="button" class="su_btn_border btn-sm su_btn_search" onclick="searchList(1);">검색</button>
	            </div>
	
	            <div class="su_content_body">
	
	                <div class="selectOption su_btn_area" align="right">
	                    <select style="width: 150px;" id="selectNo" onchange="searchList(1);">
	                        <option value="1">전체</option>
                            <option value="2">상담 신청</option>
                            <option value="3">상담 완료</option>
                            <option value="4">상담 취소</option>
	                    </select>
	                </div>
	
	                <div class="main_width su_table_pad">
	                    <table class="board-content table su_table_hover" id="suTable" align="center">
	                        <thead>
	                            <tr class="table_thead_border">
	                                <th width="5%;">번호</th>
                                    <th width="15%;">상태</th>
                                    <th>내담자</th>
                                    <th width="15%;">작성자</th>
                                    <th width="15%;">등록일</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                        
	                            <c:choose>
	                            	<c:when test="${empty list }">
	                            		<tr>
	                            			<th colspan="5">현재 게시글이 없습니다.</th>
	                            		</tr>
	                            	</c:when>
	                            	
	                            	<c:otherwise>
	                            		<c:forEach var="c" items="${ list }">
	                            			<tr>
				                                <td class="no">${ c.cnslnNo }</td>
				                                
				                                <c:choose>
				                                	<c:when test="${ c.cnslnStatus == 'Y' }">
					                                	<c:if test="${ c.cnslnReal != null }">
					                                		<td>상담 완료</td>
					                                	</c:if>
					                                	<c:if test="${ c.cnslnReal == null }">
					                                		<td>상담 신청</td>
					                                	</c:if>
				                                	</c:when>
				                                	<c:otherwise>
				                                		<td>상담 취소</td>
				                                	</c:otherwise>
				                                </c:choose>
				                                
				                                <td>${ c.cnslnTitle }</td>
				                                <td>${ c.cnslnWriter }</td>
				                                <td>${ c.cnslnCreateDate }</td>
				                            </tr>
	                            		</c:forEach>
	                            	</c:otherwise>
	                            </c:choose>	
	                            
	                        </tbody>
	                    </table>
	
	                    <script>
	
	                        $(document).ready(function(){
	                            
	                            // 각 게시글의 행을 클릭하면 게시글 상세보기 페이지로 이동
	                            //$("#suTable>tbody>tr").on("click", "td:not(:first-child)", function(){ 
	                           // ajax 포함되었을 땐 이런 식으로 작성하기
	                            $(document).on("click", "#suTable>tbody>tr td", function(){
	                            	 console.log($(this).parent().children(".no").text());
	                            	location.href = "detail.tcn?cNo=" + $(this).parent().children(".no").text();
	                            });
	                            
	                            // 
	                           
	                        })
	                        
	                        // 제목, 작성자 키워드 검색 / 카테고리 분류 기능 ajax=======================================================
                            function searchList(page){
	                            var cate = $("#selectNo").val();	
	                            
                            	$.ajax({
                            		url:"search.tcn",
                            		data:{
                            				keyword:$("#cnslnKeyword").val(),
                            				cpage: page
                            			},
                            		success:function(map){
                            			const pi = map.pi;
                            			const list = map.list;
                            			
                            			// 검색한 리스트와 페이징으로 대체
                            			let nList = "";
                            			// 검색 결과가 없을 때
                            			if(list.length == 0){
                            				nList += "<tr>"
	                            					+ "<th colspan='5'>현재 게시글이 없습니다.</th>"
	                            					+ "</tr>";
                            			} else {
	                            			for(let i = 0; i < list.length; i++){
	                            				
	                            				if(cate == 1){
	                            					nList += "<tr>"
		                            				      + '<td class="no">' + list[i].cnslnNo + '</td>';
		                            				
		                            				if(list[i].cnslnStatus == 'Y'){
		                            					if(list[i].cnslnReal == null){
		                            						nList += '<td>상담 신청</td>';
		                            					} else{
		                            						nList += '<td>상담 완료</td>';
		                            					}
		                            				} else{
		                            					nList += '<td>상담 취소</td>';
		                            				}
					                                
		                            				nList += '<td>' + list[i].cnslnTitle + '</td>'
		                            					  + '<td>' + list[i].cnslnWriter + '</td>'
		                            					  + '<td>' + list[i].cnslnCreateDate + '</td>'
		                            					  + '</tr>';
	                            				} else if(cate == 2 && list[i].cnslnStatus == 'Y' && list[i].cnslnReal == null){
	                            					nList += "<tr>"
		                            				      + '<td class="no">' + list[i].cnslnNo + '</td>';
		                            				
		                            						nList += '<td>상담 신청</td>';
					                                
		                            				nList += '<td>' + list[i].cnslnTitle + '</td>'
		                            					  + '<td>' + list[i].cnslnWriter + '</td>'
		                            					  + '<td>' + list[i].cnslnCreateDate + '</td>'
		                            					  + '</tr>';
	                            				} else if(cate == 3 && list[i].cnslnStatus == 'Y' && list[i].cnslnReal != null){
	                            					nList += "<tr>"
		                            				      + '<td class="no">' + list[i].cnslnNo + '</td>';
		                            				
		                            						nList += '<td>상담 완료</td>';
					                                
		                            				nList += '<td>' + list[i].cnslnTitle + '</td>'
		                            					  + '<td>' + list[i].cnslnWriter + '</td>'
		                            					  + '<td>' + list[i].cnslnCreateDate + '</td>'
		                            					  + '</tr>';
	                            				} else if(cate == 4 && list[i].cnslnStatus == 'N'){
	                            					nList += "<tr>"
		                            				      + '<td class="no">' + list[i].cnslnNo + '</td>';
		                            				
		                            						nList += '<td>상담 취소</td>';
					                                
		                            				nList += '<td>' + list[i].cnslnTitle + '</td>'
		                            					  + '<td>' + list[i].cnslnWriter + '</td>'
		                            					  + '<td>' + list[i].cnslnCreateDate + '</td>'
		                            					  + '</tr>';
	                            				}
	                            				
	                            				
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
                            			console.log("ajax 상담 내역 검색 조회 실패");
                            		}
                            	});
                            };
	                    
	                    </script>
	
	
	
	                    <br><br><br>
	                    
	                </div>
	
	                <div style="width: 100%;">
	                    <button type="button" class="btn su_btn_all" style="float: right;" onclick="location.href='enrollForm.cn?day=';">글쓰기</button>
	                </div>
	                
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
			                            	<a class="page-link su_page_btn su_prenext" href="list.tcn?cpage=${ pi.currentPage - 1 }" aria-label="Previous">
			                                <span aria-hidden="true">&laquo;</span></a>
			                            </c:otherwise>
			                        </c:choose>
			                     </li>
			                        
		                        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		                        
		                        	<c:choose>
		                        		<c:when test="${pi.currentPage eq p }">
		                        			<li class="page-item"><a class="page-link su_page_btn su_curPage_btn disabled" href="list.tcn?cpage=${ p }">${ p }</a></li>
		                        		</c:when>
		                        		<c:otherwise>
		                        			<li class="page-item"><a class="page-link su_page_btn" href="list.tcn?cpage=${ p }">${ p }</a></li>
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
			                            	<a class="page-link su_page_btn su_prenext" href="list.tcn?cpage=${ pi.currentPage + 1 }" aria-label="Next">
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