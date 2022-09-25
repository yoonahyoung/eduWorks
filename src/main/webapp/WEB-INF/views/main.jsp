<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/sumin.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/board.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/schedule.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/mail.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">

<style>
	#calendar table:hover{
		cursor:default !important;
		
	}
	#calendar .fc-content{
		width:auto;
	}
</style>
</head>
<body>

	<jsp:include page="common/header.jsp" />
	<div style="background-color:whitesmoke; height:auto;">
	<div style="width:100%; height:1250px;">
		<div style="float: left; width:17%;  background-color:whitesmoke;" class="divBox">
			<div id="profileE" style="height:400px; width:100%; text-align:center; padding-top:10px; margin: 10% 5% 5% 4%; border-radius:5px; background-color: white;">
				<div style="margin-top:7%; height:80px">
				<c:choose>
              		<c:when test="${ empty m.memProfile }">
              			<img id="Profile" name="Profile" src="resources/profile_images/defaultProfile.png" width="35%" height="120%" onclick="$('#profileImgFile').click();">
              		</c:when>
              		<c:otherwise>
              			<img id="Profile" name="Profile" src="${ m.memProfile }" width="25%" height="100% " onclick="$('#profileImgFile').click();">
              		</c:otherwise>
              	</c:choose>
              	</div> <br><br>
              	<h4>${ loginUser.memName } ${loginUser.jobName }님</h4> <br>
				<h5 class="date1"></h5> 
                <h5 class="clock"></h5> <br>
               	<div style="padding-bottom:2%;">
                <span>
                    <button type="button" class="btn su_btn_border" onclick=submitIn();>출근하기</button>
                </span>
                &nbsp;&nbsp;&nbsp;
                <span>
                    <button type="button" class="btn su_btn_border"  onclick=submitOut();>퇴근하기</button>
                </span>
                </div>
			</div>
			
			<script type="text/javascript">
                            	function submitIn(){
                            		let c = new Date();
  	                              	c.setHours(c.getHours() + 9)
  	                              	let c1 = c.toISOString();
	  	                            let date2 = c1.slice(0,10);
		                            let time2 = c1.slice(11,16);
		                            
		                            $.ajax({
		                            	url: 'submitIn.me',
                           				type: 'POST',
                           				data: {
                           					inDate : date2,
                           					inTime : time2
                           				},
                           				success: function(result) {
                           					console.log(result)
                           					if(result=='success'){
                           						alert('출근처리완료')
                           						location.reload();
                           					}else if(result='errors'){
                           						alert('이미출근하였습니다.')
                           					}else{
                           						alert('출근처리실패')
                           					}
                           				},error:function(){
                           					console.log('error')
                           				}
		                            })
                            	}
                            	
                            	function submitOut(){
                            		let c = new Date();
  	                              	c.setHours(c.getHours() + 9)
  	                              	let c1 = c.toISOString();
	  	                            let date2 = c1.slice(0,10);
		                            let time2 = c1.slice(11,16);
		                            
		                            $.ajax({
		                            	url: 'submitOut.me',
                           				type: 'POST',
                           				data: {
                           					outDate : date2,
                           					outTime : time2
                           				},
                           				success: function(result) {
                           					console.log(result)
                           					if(result=='success'){
                           						alert('퇴근처리완료')
                           						location.reload();
                           					}else if(result=='none'){
                           						alert('아직출근전입니다.')
                           					}else if(result=='zzz'){
                           						alert('이미퇴근하였습니다.')
                           					}else{
                           						alert('퇴근처리실패')
                           					}
                           				},error:function(){
                           					console.log('error')
                           				}
		                            })
                            	}
                            	
                            	$(function(){
                            		const clock = $(".clock");
                            		const date = $('.date1');
                            		
    	                            function dateClock(){
    	                              let d2 = new Date();
    	                              d2.setHours(d2.getHours() + 9)
    	                              let d3 = d2.toISOString();
    	                              //console.log(d3) //2022-09-18T20:48:07.964Z
    	                              let date1 = d3.slice(0,10);
    	                              let time = d3.slice(11,19);
    	                              let week = new Array('일', '월', '화', '수', '목', '금', '토');
    	                              let day = week[d2.getDay()]
    	                              clock.text(time)
    	                              date.text(date1+'('+day+")")
    	                            }
    	                            
    	                            dateClock();
    	                            setInterval(dateClock, 1000);
                            	})
                            </script>
			
			
			
			<div style="background-color:white; height:800px; padding-bottom: 30px;">
            	<div >
	            	<table class="bestTable" style="width:100%;">
		                <thead>
		                	<tr><td></td></tr><tr><td></td></tr>
		                    <tr>
		                        <th colspan="2">추천게시판 <i class="fa fa-thumbs-up fa-regular"></i></th>
		                        <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
		                    </tr>
		                </thead>
		                <tbody id="thumbsHotArea">
		                    
		                </tbody>
		              </table>
		              
		              <br><br><hr class="hr_line">
		              
		              <table class="bestTable" style="width:100%;">
		                <thead>
		                	<tr><td></td></tr>
		                    <tr>
		                        <th colspan="2" >핫게시판 <i class="fa fa-comments fa-regular"></i></th>
		                        <tr><td></td></tr><tr><td></td></tr>
		                    </tr>
		                </thead>
		                <tbody id="replyHotArea">
		                    
		                </tbody>
	               </table>
	            </div>
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
           	let txt = "..."; 
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
   				                      + '<td align="right" style="width:100px"></td>'
   				                   + '</tr>';
  				                count++;
								}else {
								for(let j=0; j<map.list.length; j++){
									if(count==5){
										break;
									}else
									if(map.like[i].boardNo == map.list[j].boardNo){
										value += '<tr>'
         				                      + '<td><a href="detail.bl?no=' + map.list[j].boardNo + '">';
         				                      if(map.list[j].boardTitle.length > 8){
         				                    	value += (map.list[j].boardTitle).substr(0, 8) + txt + '</a></td>';
         				                      }else{
         				                    	value += map.list[j].boardTitle + '</a></td>';
         				                      }
         				               value += '<td align="right">' + (map.list[j].boardEnDate).substr(5) + '</td>'
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
         				                      + '<td><a href="detail.bl?no=' + map.list[j].boardNo + '" class="limitTitle">';
		       									if(map.list[j].boardTitle.length > 8){
	           				                    	value += (map.list[j].boardTitle).substr(0, 8) + txt + '</a></td>';
	           				                      }else{
	           				                    	value += map.list[j].boardTitle + '</a></td>';
	           				                      }
		       							value += '<td align="right">' + (map.list[j].boardEnDate).substr(5) + '</td>'
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
		
	
		<div style="float: left; width:50%; "  class="divBox">
			<div style="text-align:center; margin:1%; border-radius:5px; background-color: white;">
				<div style="margin:0px 10px 0px 10px;">
					<div class="d-sm-flex align-items-center mb-4" id="boardHeader">
		                <div style="font-size:23px; padding-top: 5px;">전사 공지</div>
		            </div>
					<br>
		            <div class="main_width">
		                <table class="board-content table" align="center" id="mainNoticeList"> 
		                    <thead>
		                        <tr class="table_thead_border">
		                            <th width="5%">번호</th>
		                            <th width="30%">제목</th>
		                            <th width="7%">작성자</th>
		                            <th width="7%">작성일</th>
		                            <th width="5%">조회수</th>
		                        </tr>
		                    </thead>
		                    <tbody class="board-tbody">

		                    </tbody>
		                </table>
		        	</div>
	        	</div>
	        	<hr style="margin:0;">
	        	
	        	 <div id="n-pagingBar" style="margin:10px;">
	                <nav aria-label="Page navigation example">
	                    <ul id="ajaxPaging" class="pagination justify-content-center" style="padding-bottom:10px;"> 
	                    	
	                    </ul>
	                </nav>
	            </div>
			</div>
			
	
			
			<script>
				$(function(){
					
					mainNoticeList(1);
					
					setInterval(mainNoticeList,3600000); // 1000 => 1초 마다 새로고침
					
					// => 이 방법으로는 동적으로 만들어진 요소에 이벤트 부여 불가
					/*
					$("#boardList>tbody>tr").click(function(){
						location.href = "detail.bo?no=" + $(this).children().eq(0).text();
					})
					*/
					
					//$(상위요소).on("이벤트명","이벤트걸고자하는요소", function(){})
					// 동적으로 만들어진 요소에 이벤트 부여 방법!!!!
					$(document).on("click","#mainNoticeList>tbody>tr", function(){
						location.href = "detail.no?no=" + $(this).children().eq(0).text();
					})
					
				})
				
				function mainNoticeList(page){
					$.ajax({
						url:"mainList.ma",
						data:{cpage:page}, 
						success:function(map){
							
							console.log(map); // { pi:{currentPage:x, listCount:x, ..}, list:[{}, {}] };
							
							//map.pi => {currentPage:x, listCount:x, ..}
							//map.list => [{}, {}]
							
							let value = "";
							
							if(map.list.length != 0){
								for(let i in map.list){
									value += "<tr>"
									        +	"<td>" + map.list[i].boardNo + "</td>"
									        +	"<td>" + map.list[i].boardTitle + "</td>"
									        +	"<td>" + map.list[i].boWriter + "</td>"
									        +	"<td>" + map.list[i].boardEnDate + "</td>"
									        +	"<td>" + map.list[i].boardCount + "</td>"
									       + "</tr>";
								}
							}else{
								value += "<tr>"
                			 	    + "<td id='nullMail' colspan='6'>등록된 공지사항이 없습니다.</td>" + "</tr>"
							}
							$("#mainNoticeList tbody").html(value);
							
							let paging = "";
							
                    		
                    		if(map.pi.currentPage == 1){
                    			paging = "<li class='page-item'>"
                    				   	+ "<a class='page-link disabled' style='color:slategray' aria-label='Previous'>"
                    				   	 + "<span aria-hidden='true'> &laquo; </span>"
                    				   	+ "</a>"
                    				   + "</li>"
                    				   	 
                    		}else{
                    			paging = "<li class='page-item'>"
                				   	+ "<a class='page-link disabled' style='color:slategray' onclick='mainNoticeList(" + (map.pi.currentPage-1) + ");' aria-label='Previous'>"
                				   	 + "<span aria-hidden='true'> &laquo; </span>"
                				   	+ "</a>"
                				   + "</li>"
                    		}
							
                    		for(let p=map.pi.startPage; p<=map.pi.endPage; p++){
                    			paging += "<li class='page-item'><a class='page-link' style='color:slategray' onclick='mainNoticeList(" + p + ");'>" + p + "</a></li>"
                    		}
		            		
                    		if(map.pi.currentPage == map.pi.maxPage){
                    			paging += "<li class='page-item'>"
                    				   	+ "<a class='page-link disabled' style='color:slategray' aria-label='Next'>"
                    				   	 + "<span aria-hidden='true'> &raquo; </span>"
                    				   	+ "</a>"
                    				   + "</li>"
                    				   	 
                    		}else{
                    			paging += "<li class='page-item'>"
                				   	+ "<a class='page-link disabled' style='color:slategray' onclick='mainNoticeList(" + (map.pi.currentPage+1) + ");' aria-label='Next'>"
                				   	 + "<span aria-hidden='true'> &raquo; </span>"
                				   	+ "</a>"
                				   + "</li>"
                    		}
		            	
                    		$("#ajaxPaging").html(paging);
							
							
							
						},error:function(){
							console.log("조회수 top5 게시글 조회용 ajax 통신 실패");
						}
					})
				}
				
			</script>
			
			<div>
				<div class="second-title" style="text-align:left; margin:1%; border-radius:5px; padding:1%; background-color: white;">
					<div style="font-size:20px; margin:1%; font-weight: 600;">
					받은 메일함 <span id="mail-count" class="mail-count"></span>
					</div>
				
				<div class="mail-list">

					<table class="mail" id="mailList" > 
						<tbody id="mainMailList">
							
						</tbody>
					</table>
		
				<hr style="margin-bottom: 5px;">
				
				<div id="n-pagingBar" style="margin: 3px 10px -17px 5px;">
	                <nav aria-label="Page navigation example">
	                    <ul id="ajaxMail" class="pagination justify-content-center"  style="padding:3px;"> 
	                    	
	                    </ul>
	                </nav>
	            </div>
	            <form id="postMailDetail" action="mailDetail.ma" method="post">
					<input type="hidden" name="mailFolder" value="2">
					<input type="hidden" name="mailNo" id="detailNo">
					<input type="hidden" name="flag" value="B">
				</form>
				</div>
			</div>
				
			</div>
			
			<script>
				$(function(){
					
					mainMailList(1);
					
					setInterval(mainMailList,3600000); // 1000 => 1초 마다 새로고침
					
					// => 이 방법으로는 동적으로 만들어진 요소에 이벤트 부여 불가
					/*
					$("#boardList>tbody>tr").click(function(){
						location.href = "detail.bo?no=" + $(this).children().eq(0).text();
					})
					*/
					
					//$(상위요소).on("이벤트명","이벤트걸고자하는요소", function(){})
					// 동적으로 만들어진 요소에 이벤트 부여 방법!!!!
					//$(document).on("click","#mailList>tbody>tr", function(){
					//	location.href = "mailDetail.ma?no=" + $(this).children().eq(0).text();
					//})
					
					
						
					})
					
				$(function(){
					$(".mail-title").click(function(){
						
						let mailNo = $(this).children('input[type=hidden]').val();
						console.log(mailNo);
						$("#detailNo").val(mailNo);
						$("#postMailDetail").submit();
	
					})
				})
				
				function mainMailList(page){
					$.ajax({
						url:"mainMailList.ma",
						data:{cpage:page}, 
						success:function(map){
							
							console.log(map.list); // { pi:{currentPage:x, listCount:x, ..}, list:[{}, {}] };
							
							//map.pi => {currentPage:x, listCount:x, ..}
							//map.list => [{}, {}]
							
							let value = "";
							
							
							if(map.list.length != 0){ // 조회된 데이터가 있을경우
								for(let i in map.list){
									value += "<tr>"
									        +	"<td style='display:none'>" + map.list[i].mailNo + "</td>"
									        +   "<td>";
									if(map.list[i].mailStatus.mailRead == 'N'){
										value += "<i style='margin-left: 10px;' class='icon fas fa-envelope'></i>"
									}else{
										value += "<i style='margin-left: 10px;' class='icon far fa-envelope-open'></i>"
												
									}
										value +=  "</td>";
										
									if(map.list[i].sendName.isEmpty){
										value += "<td class='mail-person' width='15%''><div class='person'>" + map.list[i].sendMail + "</div></td>"
									}else{
										value += "<td class='mail-person' width='15%''><div class='person'>" + map.list[i].sendName + "</div></td>"
									}
									
									value += "<td class='mail-title'>"
									         +"<input type='hidden' name='mailNo' value='" + map.list[i].mailNo + "'>";
									
									if(map.list[i].mailType == 1){
										value += "<span style='color:red;''>&nbsp;[중요!]</span>";
									}
									
									value += "&nbsp;" + map.list[i].mailTitle + "<input type='hidden' name='mailNo' value=" + map.list[i].mailNo + "></td> <td class='mail-sendtime'>" + map.list[i].sendDate + "</td></tr>";
								
							}
								
							}else{ // 없을경우
								
								value += "<tr>"
                			 	    + "<td id='nullMail' colspan='6'>메일함이 비어있습니다.</td>" + "</tr>"
								
								
							}
							
							$(function(){
								$(".mail-title").click(function(){
									
									let mailNo = $(this).children('input[type=hidden]').val();
									console.log(mailNo);
									$("#detailNo").val(mailNo);
									$("#postMailDetail").submit();
				
								})
							})
								

							$("#mainMailList").html(value);
							let count = "전체메일 " + map.count + " / 안읽은 메일 " + map.unread;
							$("#mail-count").html(count);
							
							let paging = "";
							
                    		
                    		if(map.pi.currentPage == 1){
                    			paging = "<li class='page-item'>"
                    				   	+ "<a class='page-link disabled' style='color:slategray' aria-label='Previous'>"
                    				   	 + "<span aria-hidden='true'> &laquo; </span>"
                    				   	+ "</a>"
                    				   + "</li>"
                    				   	 
                    		}else{
                    			paging = "<li class='page-item'>"
                				   	+ "<a class='page-link disabled' style='color:slategray' onclick='mainMailList(" + (map.pi.currentPage-1) + ");' aria-label='Previous'>"
                				   	 + "<span aria-hidden='true'> &laquo; </span>"
                				   	+ "</a>"
                				   + "</li>"
                    		}
							
                    		for(let p=map.pi.startPage; p<=map.pi.endPage; p++){
                    			paging += "<li class='page-item'><a class='page-link' style='color:slategray' onclick='mainMailList(" + p + ");'>" + p + "</a></li>"
                    		}
		            		
                    		if(map.pi.currentPage == map.pi.maxPage){
                    			paging += "<li class='page-item'>"
                    				   	+ "<a class='page-link disabled' style='color:slategray' aria-label='Next'>"
                    				   	 + "<span aria-hidden='true'> &raquo; </span>"
                    				   	+ "</a>"
                    				   + "</li>"
                    				   	 
                    		}else{
                    			paging += "<li class='page-item'>"
                				   	+ "<a class='page-link disabled' style='color:slategray' onclick='mainMailList(" + (map.pi.currentPage+1) + ");' aria-label='Next'>"
                				   	 + "<span aria-hidden='true'> &raquo; </span>"
                				   	+ "</a>"
                				   + "</li>"
                    		}
		            	
                    		$("#ajaxMail").html(paging);
							
							
							
						},error:function(){
							console.log("조회수 top5 게시글 조회용 ajax 통신 실패");
						}
					})
				}
				
			</script>
			
			
			<div></div>
			<div></div>
		</div>
		<div style="float: left; width:33%;  " class="divBox">
			<div style="text-align:center; margin:3%; border-radius:5px; height:500px; background-color: white;">
					<br>
						<div id='calendar' class="su_calendar_size" ></div>
				</div>
				<script>
		
					// function getEvent로 이벤트 연결하기 
					
				    document.addEventListener('DOMContentLoaded', function() {
				    var calendarEl = document.getElementById('calendar');
				
				    var calendar = new FullCalendar.Calendar(calendarEl, {
				    plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
				 	// 날짜 칸 클릭시 해당 날짜 데이터를 갖고 일정 입력 페이지로 이동 
					dateClick:function(arg){
					    //console.log(arg.dateStr); // 날짜 출력
					    location.href="enrollForm.ca?day=" + arg.dateStr + "&memNo=" + ${ loginUser.memNo };
					},
					
					// 이벤트 클릭시 일정 상세 조회 페이지로 이동
					eventClick:function(e){
						location.href = "detail.ca?sNo=" + e.event.id + "&memNo=" + ${ loginUser.memNo };
						//console.log(e.event.id);
					},
				    
				    header: {
				        left: 'prev,next today',
				        center: 'title',
				        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
				    },
				    locale: "ko",
				    // defaultDate: '2020-02-12',
				    navLinks: true, // can click day/week names to navigate views
				    businessHours: true, // display business hours
				    editable: true,
				    timeFormat:'H(:mm)',
				    events: function(info, successCallback, failureCallback){
				    	console.log($("#calArr").text());
				    	var calStr = $("#calArr").text();
				    	$.ajax({
				    		type: 'post',
				    		cache: false,
				    		url: "sclist.ca",
				    		dataType:'json',
				    		data:{
			              		memNo: ${ loginUser.memNo },
			              		checkCnt: $("#calArr").text(),
			              		atnd: $("#atnd").text(),
			              		cmpy: $("#cmpy").text()
			              	},
			              	//contentType:"application/x-www-form-urlencoded; charset=UTF-8",
			              	success: function(param){
			              		var event = [];
			              		
			              		//console.log(calStr);
			              		$.each(param, function(index, data){
			              			// map에서 값 불러와서 조건넣어서 이벤트 푸쉬하기...
			              				event.push({
			    	              			id: data.id,
			    	              			title: data.title,
			    	              			start: data.start,
			    	              			end: data.end,
			    	              			color: hexToRgb(data.color)
			    	              			//backgroundColor: 'rgba(94, 126, 155, 0.6)'
			    	              		});
			              			
			              			
			              			 
				              		
			              	    });
			              		
			              		console.log(event);
			              		successCallback(event);
			              		}
			              	
			              	
				    		});
				 	 	  }
				   	 });
								    $(document).on("change", "input[type=checkbox]", function(){
								    	calendar.refetchEvents();
								    })
								
								    calendar.render();
								    
								    });
						</script>
						
						 <script>
		                	$(function(){
		                		
		                		calList();
		                		selectMycalList();
		                		
		                	})
		                	
		                	// 내 캘린더 리스트 출력 이벤트
		                	function selectMycalList(){
		                		$.ajax({
		                			url: "mclist.ca",
		                			data: { memNo: ${ loginUser.memNo } },
		                			success: function(list){
		                				
		                				let value = "";
		                				let str = "";
		                                
		                                for(let i = 0; i < list.length; i++){
			                                value += '<tr style="width: 100%;">'
			                                    		+ '<td width="20%;"><span class="myNo" style="color: white !important;">' + list[i].mycalNo + '</span></td>'
			                                    		+ '<td><input type="checkbox" name="mycalList" checked></td>';
			                                    	if(i == 0){
			                                    		value += '<td width="90%;" id="mcName' + list[i].mycalNo + '"> &nbsp;' + list[i].mycalName + '</td>';
			                                    	} else{
			                                    		value += '<td width="90%;" id="mcName' + list[i].mycalNo + '" onclick="changeMycal(' + list[i].mycalNo + ')"> &nbsp;' + list[i].mycalName + '</td>';
			                                    	}
				                                  
					                                    value += '<td class="su_myCalBasic">'
					                                        + '<a type="button">'
					                                            + '<div class="calColor" id="colorBtn' + list[i].mycalNo + '" style="border: 1px solid ' + list[i].mycalColor + '; background: ' + list[i].mycalColor + ';" onclick="colorMycal(' + list[i].mycalNo + ');"></div>'
					                                        	+ '<input type="hidden" id="calColor' + list[i].mycalNo + '" value="' + list[i].mycalColor + '">'	
					                                        + '</a>'
					                                    + '</td>';
			
					                                    if(i == 0){
					                                    	value += '<td class="su_myCalX dis_no"></td>';
					                                    } else {
			                                    			value += '<td class="su_myCalX dis_no"><a type="button" onclick="deleteMycal(' + list[i].mycalNo + ');">x</a></td>';
					                                    }
			                                		+ '</tr>';
			                                		
			                                str += list[i].mycalNo + ",";
		                                }
			                                
			                           //value += '</table>';
			                           
			                           $("#tb_myCal").html(value);
			                           //console.log(str);
			                           str = str.substring(0, str.lastIndexOf(","));
			                           $("#calArr").text(str);
			                           //console.log($("#calArr").text());
		                			}, error: function(){
		                				console.log("ajax 내 캘린더 조회 실패");
		                			}
		                		});
		                		
		                	}
		                	
		                	var checkCnt = "";
		            		
		            		// 내 캘린더 체크 리스트
		            		function calList(){
		            	        checkCnt = "";
		            	        $("input[name='mycalList']:checked").each(function(){
		            	        	
		            	        	//console.log($(this).parent().parent().children().eq(0).text());
		            	            checkCnt += ($(this).parent().parent().children().eq(0).text()) + ","; // 체크된 것만 게시글번호 뽑기 "2,3,4,"
		            	        });
		            	        
		            	        checkCnt = checkCnt.substring(0,checkCnt.lastIndexOf(",")); // 맨 뒤 콤마 삭제 "2,3,4"
		            	        //console.log(checkCnt);
		            	        $("#calArr").text(checkCnt);
		            		}
		            		
		            		$(document).on("change", "input[name='mycalList']", function(){
		            			calList();
		            			console.log($("#calArr").text());
		            		});
		            		
		                	// 선택된 캘린더 번호 출력 이벤트
		                	function selectMycalNo(){
		                		var result = "";
		                		$.ajax({
		                			url: "mcnolist.ca",
		                			async: false,
		                			data: { memNo: ${ loginUser.memNo } },
		                			success: function(list){
		                				console.log(list[0].mycalNo);
		                				for(let i = 0; i < list.length; i++){
		                					result += list[i].mycalNo + ',';
		                				}
		                				result = result.substring(0, result.lastIndexOf(","));
		                				$("#calArr").text(result);
		                				
		                				return result;
		                			}, error: function(){
		                				console.log("ajax 내 캘린더 번호 조회 실패");
		                			}
		                		});
		                		return result;
		                	}
		                		
		               		// 내 캘린더 추가
		               		$("#insertMyCal").click(function(){
		               			$.ajax({
		               				url: "mcinsert.ca",
		               				data: { 
		               					memNo: ${ loginUser.memNo},
		               					mycalName: $("#myCalName").val()
		               				},
		               				success: function(result){
		               					if(result == "success"){
		               						alert("내 캘린더가 추가되었습니다.");
		               						$("#myCalName").val("");
		               						$("#addMyCal").modal('hide');
		               						selectMycalList();
		               					}
		               				}, error: function(){
		               					console.log("ajax 내 캘린더 추가 실패");
		               				}
		               			});
		               		});
		               		
		               		// 내 캘린더 이름 변경
		               		function changeMycal(mcNo){
		               		// mcNo : 내 캘린더 번호
		               		var id = "mcName" + mcNo;
		               			var name = $("#" + id).text();
		               			//console.log(name);
		               			$("#chCalName").val(name);
		               			$("#updateMyCal").modal("show");
		               			$("#updateMyCalBtn").click(function(){
		               				//console.log("j");
		               				$.ajax({
		               					url: "mcupdate.ca",
		               					data: {
		               						mcNo: mcNo,
		               						mcName: $('#chCalName').val()
		               						},
		               					success: function(result){
		               						if(result == "success"){
		               							alert("수정되었습니다.");
		               							$("#chCalName").val("");
		               							$("#updateMyCal").modal("hide");
		               							selectMycalList();
		               						}
		               					}, error: function(){
		               						console.log("ajax 내 캘린더 수정 실패");
		               					}
		               				});
		               			});
		               		}
		               		
		               		// 내 캘린더 삭제
		               		function deleteMycal(mcNo){
		               			// mcNo : 내 캘린더 번호
		               			$("#delete").modal("show");
		               			$("#realDelete").click(function(){
		               				console.log("j");
		               				$.ajax({
		               					url: "mcdelete.ca",
		               					data: {checkCnt: mcNo},
		               					success: function(result){
		               						if(result == "success"){
		               							alert("삭제되었습니다.");
		               							$("#delete").modal("hide");
		               							selectMycalList();
		               						}
		               					}, error: function(){
		               						console.log("ajax 내 캘린더 삭제 실패");
		               					}
		               				});
		               			});
		               		}
		               		
		               		// 캘린더 색상 변경
		               		function colorMycal(mcNo){
		               			let value = "";
		               			let id = "colorBtn" + mcNo;
		               			let c = "calColor" + mcNo;
		               			let color = $("#" + c).val();
		               			
		               			value += '<input type="color" id="colorArea" value="' + color + '">'
		    	                       + '<button type="button" class="btn btn-sm su_btn_border" id="chColorBtn" onclick="changeColor(' + mcNo + ');">변경</button>';
		    	                
		    	                $("#colorPal").html(value);
		    	                $("#colorPal").show();
		    	                $("#" + id).attr("onclick", "cancleColor(" + mcNo + ");");
		               		}
		               		
		               		function cancleColor(mcNo){
		               			$("#colorPal").hide();
		               			let id = "colorBtn" + mcNo;
		               		 	$("#" + id).attr("onclick", "colorMycal(" + mcNo + ");");
		               		}
		               		
		               		// 색상 기본값 설정하기
		               		function changeColor(mcNo){
		               			let c = $("#colorArea").val();
		               			let color = c;
		               			$.ajax({
		               				url: "mccolor.ca",
		               				data: {
		               					mycalNo: mcNo,
		               					mycalColor: c
		               				},
		               				success: function(result){
		               					if(result == "success"){
		               						selectMycalList();
		               						location.reload();	// 이벤트 색상 변경을 위해
		               					}
		               				}, error: function(){
		               					console.log("ajax 캘린더 색상 변경 실패");
		               				}
		               			});
		               		}
		               		
		               		// color HEX to rgb
	                        function hexToRgb ( hexType ){ 
	                            /* 맨 앞의 "#" 기호를 삭제하기. */ 
	                            var hex = hexType.trim().replace( "#", "" ); 
	                            
	                            /* rgb로 각각 분리해서 배열에 담기. */ 
	                            var rgb = ( 3 === hex.length ) ? 
	                                hex.match( /[a-f\d]/gi ) : hex.match( /[a-f\d]{2}/gi );     
	                            
	                            rgb.forEach(function (str, x, arr){     
	                                /* rgb 각각의 헥사값이 한자리일 경우, 두자리로 변경하기. */ 
	                                if ( str.length == 1 ) str = str + str; 
	                                
	                                /* 10진수로 변환하기. */ 
	                                arr[ x ] = parseInt( str, 16 ); 
	                            }); 
	                            
	                            return "rgba(" + rgb.join(", ") + ", 0.5)"; 
	                        };
	                        
		                </script>
		                
		                <script>
		                    $(document).ready(function(){
		                    	
		                    	// 일정 페이지로 이동 (현재 날짜 데이터를 갖고)
		                    	$("#enrollBtn").click(function(){
		                    		var now = new Date();
		                    		var month = now.getMonth() + 1;
		                    		var date = now.getDate();
		                    		var d = now.getFullYear();
		                    		d += "-";
		                    		
		                    		if(month < 10){
		                    			d += "0" + month;
		                    		} else{
		                    			d += month;
		                    		}
		                    		
		                    		d += "-";
		                    		
		                    		if(date < 10){
		                    			d += "0" + date;
		                    		} else{
		                    			d += date;
		                    		}
		                    		
		                    		
		                    		//console.log(d);
		                    		location.href="enrollForm.ca?day=" + d + "&memNo=" + ${ loginUser.memNo };
		                    	});
		                    	
		                    	
		                        // 내/관심 캘린더 수정, 취소버튼 클릭시 보여지는 부분
		                        $("#pen1").click(function(){
		                            $("#nopen1").show();
		                            $("#pen1").hide();
		                            $(".su_myCalBasic").hide();
		                            $(".su_myCalX").show();
		                        });
		
		                        $("#nopen1").click(function(){
		                            $("#pen1").show();
		                            $("#nopen1").hide();
		                            $(".su_myCalBasic").show();
		                            $(".su_myCalX").hide();
		                        });
		
		                        $("#pen2").click(function(){
		                            $("#nopen2").show();
		                            $("#pen2").hide();
		                            $(".su_attCalBasic").hide();
		                            $(".su_attCalX").show();
		                        });
		
		                        $("#nopen2").click(function(){
		                            $("#pen2").show();
		                            $("#nopen2").hide();
		                            $(".su_attCalBasic").show();
		                            $(".su_attCalX").hide();
		                        });
		
		                        $("#addAttCal").click(function(){
		                            $("#attCalList").show();
		                        })
		
		                        $("#xBtn").click(function(){
		                            $("#attCalList").hide();
		                        });
		
		                     	// 전사일정, 참석자 일정 체크박스 이벤트
			            		$("#cmpyBox").change(function(){
			            			
				            		if( $("#cmpyBox").is(":checked") ){
				            			$("#cmpy").text('Y');
				            		} else{
				            			$("#cmpy").text('N');
				            		}
				            		
			            		});
		                     	
			            		$("#atndBox").change(function(){
				            		if( $("#atndBox").is(":checked") ){
				            			$("#atnd").text('Y');
				            		} else{
				            			$("#atnd").text('N');
				            		}
			            			
			            		});
			            		
			            		
		
		                        
		                    });
		                </script>
		
			<div style="text-align:center; margin:1%; border-radius:5px; background-color: white;">
				<div style="margin:0px 10px 0px 10px;">
					<div class="d-sm-flex align-items-center mb-4" id="boardHeader">
		                <div id="deptBoard" style="font-size:23px; padding-top: 5px;">
			            <c:choose>
			            	<c:when test="${ deptName eq '대표' }">
			            		<h3>부서 게시판 | 전체</h3>  
			            	</c:when>
			            	<c:otherwise>
			                	<h3>부서 게시판 | ${ deptName }</h3>  
			                </c:otherwise>
		                </c:choose>
		                </div>
		            </div>
					<br>
		            <div class="main_width">
		                <table class="board-content table" align="center" id="mainDeptList"> 
		                    <thead>
		                        <tr class="table_thead_border">
		                            <th width="5%">번호</th>
		                            <th width="25%">제목</th>
		                            <th width="12%">작성자</th>
		                            <th width="7%">작성일</th>
		                            <th width="5%">조회수</th>
		                        </tr>
		                    </thead>
		                    <tbody class="board-tbody">

		                    </tbody>
		                </table>
		        	</div>
	        	</div>
	        	<hr style="margin:0;">
	        	
	        	 <div id="n-pagingBar" style="margin:10px;">
	                <nav aria-label="Page navigation example">
	                    <ul id="ajaxDeptPaging" class="pagination justify-content-center" style="padding-bottom: 10px;"> 
	                    	
	                    </ul>
	                </nav>
	            </div>
			</div>
			
	
			
			<script>
				$(function(){
					
					mainDeptList(1);
					
					setInterval(mainDeptList,3600000); // 1000 => 1초 마다 새로고침
					
					// => 이 방법으로는 동적으로 만들어진 요소에 이벤트 부여 불가
					/*
					$("#boardList>tbody>tr").click(function(){
						location.href = "detail.bo?no=" + $(this).children().eq(0).text();
					})
					*/
					
					//$(상위요소).on("이벤트명","이벤트걸고자하는요소", function(){})
					// 동적으로 만들어진 요소에 이벤트 부여 방법!!!!
					$(document).on("click","#mainDeptList>tbody>tr", function(){
						location.href = "detail.de?no=" + $(this).children().eq(0).text();
					})
					
				})
				
				function mainDeptList(page){
					$.ajax({
						url:"mainDeptList.ma",
						data:{cpage:page}, 
						success:function(map){
							
							console.log(map); // { pi:{currentPage:x, listCount:x, ..}, list:[{}, {}] };
							
							//map.pi => {currentPage:x, listCount:x, ..}
							//map.list => [{}, {}]
							
							
							let value = "";
							
							if(map.list.length != 0){
								for(let i in map.list){
									value += "<tr>"
									        +	"<td>" + map.list[i].boardNo + "</td>"
									        +	"<td>" + map.list[i].boardTitle + "</td>"
									        +	"<td>" + map.list[i].boWriter + "</td>"
									        +	"<td>" + map.list[i].boardEnDate + "</td>"
									        +	"<td>" + map.list[i].boardCount + "</td>"
									       + "</tr>";
								}
							}else{
								value += "<tr>"
                			 	    + "<td id='nullMail' colspan='6'>등록된 게시물이 없습니다.</td>" + "</tr>"
							}
							$("#mainDeptList tbody").html(value);
							
							let paging = "";
							
                    		
                    		if(map.pi.currentPage == 1){
                    			paging = "<li class='page-item'>"
                    				   	+ "<a class='page-link disabled' style='color:slategray' aria-label='Previous'>"
                    				   	 + "<span aria-hidden='true'> &laquo; </span>"
                    				   	+ "</a>"
                    				   + "</li>"
                    				   	 
                    		}else{
                    			paging = "<li class='page-item'>"
                				   	+ "<a class='page-link disabled' style='color:slategray' onclick='mainDeptList(" + (map.pi.currentPage-1) + ");' aria-label='Previous'>"
                				   	 + "<span aria-hidden='true'> &laquo; </span>"
                				   	+ "</a>"
                				   + "</li>"
                    		}
							
                    		for(let p=map.pi.startPage; p<=map.pi.endPage; p++){
                    			paging += "<li class='page-item'><a class='page-link' style='color:slategray' onclick='mainDeptList(" + p + ");'>" + p + "</a></li>"
                    		}
		            		
                    		if(map.pi.currentPage == map.pi.maxPage){
                    			paging += "<li class='page-item'>"
                    				   	+ "<a class='page-link disabled' style='color:slategray' aria-label='Next'>"
                    				   	 + "<span aria-hidden='true'> &raquo; </span>"
                    				   	+ "</a>"
                    				   + "</li>"
                    				   	 
                    		}else{
                    			paging += "<li class='page-item'>"
                				   	+ "<a class='page-link disabled' style='color:slategray' onclick='mainDeptList(" + (map.pi.currentPage+1) + ");' aria-label='Next'>"
                				   	 + "<span aria-hidden='true'> &raquo; </span>"
                				   	+ "</a>"
                				   + "</li>"
                    		}
                    		
                    		$("#ajaxDeptPaging").html(paging);
							
						},error:function(){
							console.log("조회수 top5 게시글 조회용 ajax 통신 실패");
						}
					})
				}
				
			</script>
		
			</div>
		</div>
		<div class="main-list" style="text-align:center; margin:1%; border-radius:5px; background-color: white; height:10%;">
						<h2 style="padding:20px; font-weight: 600; ">전사 주소록</h2> 

					
						<table class="board-content table" align="center" id="mainAddressList">
							<thead>
								<tr class="table_thead_border">
									<th width="10%">이름</th>
									<th width="10%">부서명</th>
									<th width="10%">직급명</th>
									<th width="15%">내선번호</th>
									<th width="18%">이메일</th>
									<th width="15%">전화번호</th>
								</tr>
							</thead>
							<tbody>
							
							</tbody>
						</table>
				
			<hr style="margin:0;">
	        	
	        	 <div id="n-pagingBar" style="padding:5px; margin:0px;">
	                <nav aria-label="Page navigation example">
	                    <ul id="ajaxAddressPaging" class="pagination justify-content-center" style="margin:5px;"> 
	                    	
	                    </ul>
	                </nav>
	            </div>
			
		</div>
			
			<script>
				$(function(){
					
					mainAddressList(1);
					
					setInterval(mainAddressList,3600000); // 1000 => 1초 마다 새로고침
					
					// => 이 방법으로는 동적으로 만들어진 요소에 이벤트 부여 불가
					/*
					$("#boardList>tbody>tr").click(function(){
						location.href = "detail.bo?no=" + $(this).children().eq(0).text();
					})
					*/
					
					//$(상위요소).on("이벤트명","이벤트걸고자하는요소", function(){})
					// 동적으로 만들어진 요소에 이벤트 부여 방법!!!!
					$(document).on("click","#mainDeptList>tbody>tr", function(){
						location.href = "detail.de?no=" + $(this).children().eq(0).text();
					})
					
				})
				
				function mainAddressList(page){
					$.ajax({
						url:"mainAddressList.ma",
						data:{cpage:page}, 
						success:function(map){
							
							console.log(map); // { pi:{currentPage:x, listCount:x, ..}, list:[{}, {}] };
							
							//map.pi => {currentPage:x, listCount:x, ..}
							//map.list => [{}, {}]
							
							
							let value = "";
							
							if(map.list.length != 0){
								for(let i in map.list){
									value += "<tr>"
									        +	"<td>" + map.list[i].memName + "</td>"
									        +	"<td>" + map.list[i].deptCode + "</td>"
									        +	"<td>" + map.list[i].jobCode + "</td>"
									        +	"<td>" + map.list[i].memBusinessnum + "</td>"
									        +   "<td>" + map.list[i].memEmail + "</td>"
									        +	"<td>" + map.list[i].memPhone + "</td>"
									       + "</tr>";
								}
							}else{
								value += "<tr>"
                			 	    + "<td id='nullMail' colspan='6'>등록된 주소록이 없습니다.</td>" + "</tr>"
							}
							$("#mainAddressList tbody").html(value);
							
							let paging = "";
							
                    		
                    		if(map.pi.currentPage == 1){
                    			paging = "<li class='page-item'>"
                    				   	+ "<a class='page-link disabled' style='color:slategray' aria-label='Previous'>"
                    				   	 + "<span aria-hidden='true'> &laquo; </span>"
                    				   	+ "</a>"
                    				   + "</li>"
                    				   	 
                    		}else{
                    			paging = "<li class='page-item'>"
                				   	+ "<a class='page-link disabled' style='color:slategray' onclick='mainAddressList(" + (map.pi.currentPage-1) + ");' aria-label='Previous'>"
                				   	 + "<span aria-hidden='true'> &laquo; </span>"
                				   	+ "</a>"
                				   + "</li>"
                    		}
							
                    		for(let p=map.pi.startPage; p<=map.pi.endPage; p++){
                    			paging += "<li class='page-item'><a class='page-link' style='color:slategray' onclick='mainAddressList(" + p + ");'>" + p + "</a></li>"
                    		}
		            		
                    		if(map.pi.currentPage == map.pi.maxPage){
                    			paging += "<li class='page-item'>"
                    				   	+ "<a class='page-link disabled' style='color:slategray' aria-label='Next'>"
                    				   	 + "<span aria-hidden='true'> &raquo; </span>"
                    				   	+ "</a>"
                    				   + "</li>"
                    				   	 
                    		}else{
                    			paging += "<li class='page-item'>"
                				   	+ "<a class='page-link disabled' style='color:slategray' onclick='mainAddressList(" + (map.pi.currentPage+1) + ");' aria-label='Next'>"
                				   	 + "<span aria-hidden='true'> &raquo; </span>"
                				   	+ "</a>"
                				   + "</li>"
                    		}
                    		
                    		$("#ajaxAddressPaging").html(paging);
							
						},error:function(){
							console.log("조회수 top5 게시글 조회용 ajax 통신 실패");
						}
					})
				}
				
			</script>
	
</div>
	<jsp:include page="common/footer.jsp" />

</body>
</html>