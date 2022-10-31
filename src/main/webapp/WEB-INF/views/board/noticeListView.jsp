<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전사 공지 조회</title>

<!-- css  -->
<link href="${pageContext.request.contextPath}/resources/css/sumin.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/board.css" rel="stylesheet" type="text/css">

</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<!-- Begin Page Content -->
	<div>
	    <div class="row">
	        <!-- 게시판 영역 -->
	        <div class="col-12" >
	            <!-- Page Heading -->
	            <div class="d-sm-flex align-items-center mb-4" id="boardHeader">
	                <h2>전사 공지</h2>
	            </div>
	
	            <br><br><br><br><br>
	            
	            <div style="text-align: center;">
	                <input type="text" style="width: 300px;" id="noticeKeyword" placeholder="제목/작성자 입력">
	                <button type="button" class="su_btn_border btn-sm su_btn_search" onclick="searchBar(1)">검색</button>
	            </div>
				
				<br><br>
				
	            <div class="tableOption">
	                <div class="btn_two_spacing">
	                	<!-- 대리 or 팀장 or 대표만 보여지는 공지 등록/해제 버튼 -->
	                	<c:if test="${ loginUser.jobCode eq 'J2' || loginUser.jobCode eq 'J3' || loginUser.jobCode eq 'J4'}">
		                    <button type="button" onclick="goTop(1);">공지등록</button><i class="fas fa-flag"></i>
		                    <button type="button" onclick="goTop(2);">공지해제</button><i class="fas fa-font-awesome"></i>
	                    </c:if>
	                </div>
	            </div>
	            
	            <div class="main_width">
	                <table class="board-content table" align="center" id="noticeList"> 
	                    <thead>
	                        <tr class="table_thead_border" >
	                            <th width="2%"><input type="checkbox" id="checkAll" ></th>
	                            <th width="5%">번호</th>
	                            <th width="30%">제목</th>
	                            <th width="7%">작성자</th>
	                            <th width="7%">작성일</th>
	                            <th width="5%">조회수</th>
	                        </tr>
	                    </thead>
	                    <tbody class="board-tbody">
                        	<c:if test="${ empty list }">
                        		<tr>
                        			<td colspan="6">등록된 글이 없습니다.</td>
                        		</tr>
                        	</c:if>
                        	<c:forEach var="n" items="${list}">
	                        	<c:if test="${ n.boardTop eq 'Y'}">
			                        <tr style="background:rgb(250, 232, 232)">
			                            <td onclick="event.stopPropagation()"><input type="checkbox" id="checkNo${n.boardNo}" name="chkBoardNo" value="${n.boardNo}"></td>
			                            <td class="no">${ n.boardNo }</td>
			                            <td>${ n.boardTitle }</td>
			                            <td>${ n.boWriter }</td>
			                            <td>${ n.boardEnDate }</td>
			                            <td>${ n.boardCount }</td>
			                        </tr>
	                        	</c:if>
			                </c:forEach>
                        	<c:forEach var="n" items="${list}">
		                        <c:if test="${ n.boardTop eq 'N'}">
				                        <tr>
				                            <td onclick="event.stopPropagation()"><input type="checkbox" id="checkNo${n.boardNo}" name="chkBoardNo" value="${n.boardNo}"></td>
				                            <td class="no">${ n.boardNo }</td>
				                            <td>${ n.boardTitle }</td>
				                            <td>${ n.boWriter }</td>
				                            <td>${ n.boardEnDate }</td>
				                            <td>${ n.boardCount }</td>
				                        </tr>
		                        </c:if>
		                    </c:forEach>
	                    </tbody>
	                </table>
	                
	                <br><br>
	                
	            </div>
	            <div class="board-write-btn" align="right">
                    <button type="button" class="btn" id="bWrite-btn" onclick="location.href='enrollForm.no';">글작성</button>
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
			            		<li class="page-item"><a class="page-link" href="list.no?cpage=${ p }">${ p }</a></li>
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
				                        <a class="page-link" href="list.no?cpage=${ pi.currentPage+1 }" aria-label="Next">
				                        	<span aria-hidden="true">&raquo;</span>
				                        </a>
				                    </li>
			                    </c:otherwise>
			            	</c:choose>
	                    </ul>
	                </nav>
	            </div>
	        </div>
	    </div>
	</div>
	
	<script>
       	$(function(){ // 상세화면
       		$(".col-12").on("click", "#noticeList>tbody>tr", function(){
       			// 선택된 tr의 자식요소 중에서 no라는 클래스를 가진 자식의 text값
       			location.href = "detail.no?no=" + $(this).children(".no").text(); 
       		})
       	})
       	
       	// 검색시 뿌려주는 리스트
       	function searchBar(page){
       		console.log($("#noticeKeyword").val());
       		$.ajax({
       			url:"search.no",
       			data:{
       				keyword:$("#noticeKeyword").val(),
       				page:page
       			},
       			success(map){
       				// 리스트
       				let list = map.list;
       				let sValue = "";
       				// 페이징
       				let pi = map.pi;
       				let pValue = "";
       				
       				if(list == null){
       					sValue += '<tr>'
               						+ '<td colspan="6">검색 결과가 없습니다</td>'
       							+ '</tr>';
       				}else{
       					for(let i=0; i<list.length; i++){
       						// 공지글 먼저 담기
       						if(list[i].boardTop == 'Y'){
       							sValue += '<tr style="background:rgb(250, 232, 232)">'
       										+ '<td onclick="event.stopPropagation()"><input type="checkbox" id="checkNo' + list[i].boardNo + '" name="chkBoardNo" value="${n.boardNo}"></td>'
       										+ '<td class="no">' + list[i].boardNo + '</td>'
       										+ '<td>' + list[i].boardTitle + '</td>'
       										+ '<td>' + list[i].boWriter + '</td>'
       										+ '<td>' + list[i].boardEnDate + '</td>'
       										+ '<td>' + list[i].boardCount + '</td>'
       									+ '</tr>';
       						}
       					}
       					
       					for(let i=0; i<list.length; i++){
       						// 일반글 담기
       						if(list[i].boardTop == 'N'){
       							sValue += '<tr>'
       										+ '<td><input type="checkbox" id="checkNo' + list[i].boardNo + '" name="chkBoardNo" value="${n.boardNo}"></td>'
       										+ '<td class="no">' + list[i].boardNo + '</td>'
       										+ '<td>' + list[i].boardTitle + '</td>'
       										+ '<td>' + list[i].boWriter + '</td>'
       										+ '<td>' + list[i].boardEnDate + '</td>'
       										+ '<td>' + list[i].boardCount + '</td>'
       									+ '</tr>';
       						}
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
       					
       					for(let p=pi.startPage; p<= pi.endPage; p++){
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
          	
       					$(".board-tbody").empty();
       					$(".board-tbody").html(sValue);
       					$("#n-pagingBar ul").empty();
       					$("#n-pagingBar ul").html(pValue);
       				}
       				
       			},error(){
       				console.log("ajax통신 실패");
       			}
       		})
       	}
       	
       	// 전체 선택
       	$("#noticeList").on("click", "#checkAll", function(){
       		$("input[id^=checkNo]").attr("selected", true);
       		if($("#checkAll").is(":checked")){
       			$("input[name=chkBoardNo]").prop("checked", true);
       		}else{
       			$("input[name=chkBoardNo]").prop("checked", false);
       		}
       	})
       	
       	// -----------체크박스 선택하면 값 가져오기-----------
       	$("input[name=chkBoardNo]").click(function(){
            var count = $("input[name='chkBoardNo']").length;
            var checked = $("input[name='chkBoardNo']:checked").length;
            
            // 체크한 체크박스의 개수와 전체 체크박스 개수가 같으면 전체 선택 체크박스가 체크된다.
            if(count != checked){
                $("#checkAll").prop("checked", false);
            } else{
                $("#checkAll").prop("checked", true);
            }
            
        });
       	
       	let checkList = "";
       	// 체크박스 선택시 값 가져오기
       	$("input[type=checkbox]").change(function(){
       		checkList = ""; // 여기서 한번 비워줘야, 중복요소 제거
       		$("input:checkbox[name=chkBoardNo]:checked").each(function(){
       			checkList += ($(this).val()) + ",";
       		})
   			//console.log(checkList);
   			checkList = checkList.substring(0,checkList.lastIndexOf(",")); // 맨 뒤 콤마 삭제 "2,3,4"
       	})
       	
       	// 공지 설정 ajax
		function goTop(isYN){
       		//console.log(checkList);
       		// isYN : 1 -> 공지 등록, 2-> 공지 해제
   			$.ajax({
   				url:"goTop.no",
   				data:{
   					checkList:checkList,
   					isYN:isYN
   				},
   				success(result){
   					alert("공지 등록/해제 처리 되었습니다");
   					location.reload();
   				},error(){
   					console.log("ajax통신 실패");
   				}
   			})
       	}
	
    </script>
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>