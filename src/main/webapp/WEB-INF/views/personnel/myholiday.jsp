<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	select {
            width: 190px; 
            height: 30px;
            padding: 0em .5em; 
            font-family: inherit;  
            background: url(resources/images/selectimg.jpg) no-repeat 95% 50%;  
            border: 1px solid #999; 
            border-radius: 0px; 
            -webkit-appearance: none; 
            -moz-appearance: none;
            appearance: none;
        }
        
        #pagebar a>span{
        	text-decoration: none;
        	color:black;
        }
        
        #pagebar2 a>span{
        	text-decoration: none;
        	color:black;
        }
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../personnel/personnelCss.jsp" />
	
	<!--Begin of Main Content -->
                <!-- Begin Page Content -->
                <div class="container-fluid" style="padding: 10px;">
                   
                    <div class="container-fluid su_contentArea" style="padding-left: 10px;">
                        <div class="su_content_header">
                            <h2 class="su_sub_menu_name">연차내역</h2>
                            <br><br>

                            <h3 class="su_sub_menu_name">잔여연차조회</h3>
                            <hr class="hr_line" style="border: 0px; height: 3px; width: 1000px; background-color: #5e7e9b;">
                            <br>
                            
                            
                            <div  style="margin-left: 10px; padding: 10px; background-color:#ced3d9; width: 1000px; height: 150px;">
                                <div style="width: 20%; height: 100%; float: left; padding-top: 20px;"  align="center">
                                    <div style="width: 100%;">
                                        <h2>현재날짜</h2>
                                    </div>
									
                                    <div style="width: 100%;" >
                                        <h2 class="date1"></h2>
                                    </div>
                                </div>
                                
                                <script>
                            	$(function(){
                            		const date = $('.date1');
                            		
    	                            function dateClock(){
    	                              let d2 = new Date();
    	                              d2.setHours(d2.getHours() + 9)
    	                              let d3 = d2.toISOString();
    	                              //console.log(d3) //2022-09-18T20:48:07.964Z
    	                              let year1 = d3.slice(2,4);
    	                              let month1 = d3.slice(5,7)
    	                              let day1 = d3.slice(8,10)
    	                              let date1 = year1+"."+month1+"."+day1
    	                              date.text(date1)
    	                            }
    	                            
    	                            dateClock();
    	                            setInterval(dateClock, 1000);
                            	})
                            	</script>
                                
                                <div style="width: 80%; height: 100%; padding-top: 25px; float: left;">
                                    <table style="width: 80%; height: 80%;" align="center">
                                        <tr style="background-color: #e6e9ec;">
                                            <th>총연차</th>
                                            <th>사용연차</th>
                                            <th>잔여연차</th>
                                            
                                        </tr>
                                        <tr>
                                            <th>${ totalHo }</th>
                                            <th>${ useHo }</th>
                                            <th>${ remain }</th>
                                            
                                        </tr>
                                    </table>
                                </div>
                            </div>

                            <br style="clear: both;">
                            <br>

                            <div style="float:left">
                            <h3 class="su_sub_menu_name">연차승인내역</h3>
                            </div>
                            <div style="float:right">
                            <form id="forms" action="holiday.me?p1=${ pi1.currentPage }&p2=${ pi2.currentPage }">
                            <input type="hidden" id="selectY2" name="selectY2">
                            <select style="width: 250px;" name="selectY1" id="selectY1">
                            	<c:forEach var="slist" items="${ selectlist }" >
                            		<c:if test="${ status.index eq status.end }">
                            			<option selected value="${ slist.substring(0, 4) }">${ slist }</option>
                            		</c:if>
                            		<c:if test="${ status.index ne status.end }">
                            			<option value="${ slist.substring(0, 4) }">${ slist }</option>
                            		</c:if>
                            	</c:forEach>
                            </select>
                            </form>
                            </div>
                            
                            <hr class="hr_line" style="border: 0px; height: 3px; width: 1000px; background-color: #5e7e9b; clear: both;">
                            <br>
                            
                            <div style="padding: 10px; width: 1000px; height: 180px;">
                                <table style="width: 80%; height: 80%;" align="center">
                                    <tr style="background-color: #e6e9ec;">
                                        <th style="width:250px;">사용일시</th>
                                        <th>휴가종류</th>
                                        <th>사용연차일</th>
                                        <th style="width: 150px;">상태</th>
                                    </tr>
                                    <c:choose>
                                    	<c:when test="${ empty list1 }"><tr><th colspan="4">조회내역없음</th></tr></c:when>
                                    	<c:otherwise>
                                    		<c:forEach var="l1" items="${ list1 }">
                                    		<tr>
		                                        <th>${ l1.leaveStartDate } ~ ${ l1.leaveEndDate }</th>
		                                        <th>
		                                        	<c:choose>
		                                        		<c:when test="${ l1.leaveType eq 1 }">연차</c:when>
		                                        		<c:when test="${ l1.leaveType ne 1 and l1.aa eq 1 }">오전반차</c:when>
		                                        		<c:when test="${ l1.leaveType ne 1 and l1.aa eq 2 }">오후반차</c:when>
		                                        		<c:otherwise>?</c:otherwise>
		                                        	</c:choose>
		                                        </th>
		                                        <th>${ l1.requestPeriod } </th>
		                                        <th>
		                                        	<c:choose>
		                                        		<c:when test="${ l1.aprvStatus eq 'D'}">
		                                        			승인
		                                        		</c:when>
		                                        		<c:when test="${ l1.aprvStatus eq 'W' or l1.aprvStatus eq 'I' }">
		                                        			승인대기
		                                        		</c:when>
		                                        		<c:when test="${ l1.aprvStatus eq 'R'}">
		                                        			거절
		                                        		</c:when>
		                                        	</c:choose>
		                                        </th>
		                                    </tr>
		                                    </c:forEach>
                                    	</c:otherwise>
                                    </c:choose>
                            	</table>
                            </div>
                            
                            <c:if test="${ not empty list1 }">
                            	<div style="margin-top: 10px; width: 1000px; height: 40px;" align="center" id="pagebar">
                               		<c:if test="${ pi1.currentPage ne 1 }">
                               					<a href="holiday.me?p1=${ pi1.currentPage-1 }&selectY1=${ selectY1 }&selectY2=${ selectY2 }&p2=${ pi2.currentPage }">
						                              <span style="width: 40px; height: 40px; background-color: #e6e9ec; display: inline-block; border-radius: 15%; padding-top: 5px;">
						                                    &lt;
						                              </span>
					                            </a>
				                     </c:if>
				                     
				                     <c:forEach var="p" begin="${ pi1.startPage }" end="${ pi1.endPage }">
					                            	<c:if test="${ p eq pi1.currentPage }">
					                            		<a href="holiday.me?p1=${ p }&selectY1=${ selectY1 }&selectY2=${ selectY2 }&p2=${ pi2.currentPage }">
							                                <span style="width: 40px; height: 40px; background-color: #5e7e9b; display: inline-block; border-radius: 15%;padding-top: 5px;">
							                                    ${ p }
							                                </span>
					                                	</a>
					                            	</c:if>
					                            	<c:if test="${ p ne pi1.currentPage }">
					                            		<a href="holiday.me?p1=${ p }&selectY1=${ selectY1 }&selectY2=${ selectY2 }&p2=${ pi2.currentPage }">
							                                <span style="width: 40px; height: 40px; background-color: #e6e9ec; display: inline-block; border-radius: 15%;padding-top: 5px;">
							                                    ${ p }
							                                </span>
					                                	</a>
					                            	</c:if>
							                    	
							        </c:forEach>
				                    
				                    <c:if test="${ pi1.currentPage ne pi1.maxPage }">
                               					<a href="holiday.me?p1=${ pi1.currentPage+1 }&selectY1=${ selectY1 }&selectY2=${ selectY2 }&p2=${ pi2.currentPage }">
						                              <span style="width: 40px; height: 40px; background-color: #e6e9ec; display: inline-block; border-radius: 15%; padding-top: 5px;">
						                                    &gt;
						                              </span>
					                            </a>
				                     </c:if>
				                     
                            	</div>
                            </c:if>
                            

                            <br>

                            <div style="float:left">
                                <h3 class="su_sub_menu_name">연차지급내역</h3>
                                </div>
                                <div style="float:right">
                                <select style="width: 250px;" name="" id="sel2">
	                            	<c:forEach var="slist" items="${ selectlist }" >
	                            		<c:if test="${ status.index eq status.end }">
	                            			<option selected value="${ slist.substring(0, 4) }">${ slist }</option>
	                            		</c:if>
	                            		<c:if test="${ status.index ne status.end }">
	                            			<option value="${ slist.substring(0, 4) }">${ slist }</option>
	                            		</c:if>
	                            	</c:forEach>
                            	</select>
                            	
                            	<script>
                            		$('#sel2').on('change',function(){
                            			$('#selectY2').val($(this).val())
                            			$('#forms').submit()
                            		})
                            		
                            		$('#selectY1').on('change',function(){
                            			$('#selectY2').val($('#sel2').val())
                            			$('#forms').submit()
                            		})
                            		
                            	</script>
                            	
                            	<c:if test="${ not empty selectY2 }">
                            		<script type="text/javascript">
	                            		$(function(){
	                            			$('#sel2').val(${ selectY2 })
	                            		})
                            		</script>
                            	</c:if>
                            	
                            	<c:if test="${ not empty selectY1 }">
                            		<script type="text/javascript">
	                            		$(function(){
	                            			$('#selectY1').val(${ selectY1 })
	                            		})
                            		</script>
                            	</c:if>
                            	
                                </div>
                                
                                <hr class="hr_line" style="border: 0px; height: 3px; width: 1000px; background-color: #5e7e9b; clear: both;">
                                <br>
                                
                                <div style="padding: 10px; width: 1000px; height: 180px;">
                                    <table style="width: 80%; height: 80%;" align="center">
                                        <tr style="background-color: #e6e9ec;">
                                            <th style="width:250px;">지급/회수일시</th>
                                           	<th>상태</th>
                                            <th>지급/회수일수</th>
                                            <th style="width: 150px;">내용</th>
                                        </tr>
                                        <c:choose>
                                        	<c:when test="${ empty list2 }">
                                        		<tr><th colspan="4">지급내역없음</th></tr>
                                        	</c:when>
                                        	<c:otherwise>
                                        		<c:forEach var="l2" items="${ list2 }">
                                        			<tr>
			                                            <th>${ l2.hoDate }</th>
			                                            <th>
			                                            	<c:choose>
			                                            		<c:when test="${ l2.hoNum gt 0 }">
			                                            			연차지급
			                                            		</c:when>
			                                            		<c:otherwise>
			                                            			연차회수
			                                            		</c:otherwise>
			                                            	</c:choose>
			                                            </th>
			                                            <th>${ l2.hoNum }</th>
			                                            <th><c:out value="${ l2.hoComment }" default="--"></c:out></th>
			                                        </tr>
                                        		</c:forEach>
                                        	</c:otherwise>
                                        </c:choose>
                                    </table>
                                </div>
                                
								
								<c:if test="${ not empty list2 }">
                            	<div style="margin-top: 10px; width: 1000px; height: 40px;" align="center" id="pagebar2">
                               		<c:if test="${ pi2.currentPage ne 1 }">
                               					<a href="holiday.me?p2=${ pi2.currentPage-1 }&selectY1=${ selectY1 }&selectY2=${ selectY2 }&p1=${ pi1.currentPage }">
						                              <span style="width: 40px; height: 40px; background-color: #e6e9ec; display: inline-block; border-radius: 15%; padding-top: 5px;">
						                                    &lt;
						                              </span>
					                            </a>
				                     </c:if>
				                     
				                     <c:forEach var="p" begin="${ pi2.startPage }" end="${ pi2.endPage }">
					                            	<c:if test="${ p eq pi2.currentPage }">
					                            		<a href="holiday.me?p2=${ p }&selectY1=${ selectY1 }&selectY2=${ selectY2 }&p1=${ pi1.currentPage }">
							                                <span style="width: 40px; height: 40px; background-color: #5e7e9b; display: inline-block; border-radius: 15%;padding-top: 5px;">
							                                    ${ p }
							                                </span>
					                                	</a>
					                            	</c:if>
					                            	<c:if test="${ p ne pi2.currentPage }">
					                            		<a href="holiday.me?p2=${ p }&selectY1=${ selectY1 }&selectY2=${ selectY2 }&p1=${ pi1.currentPage }">
							                                <span style="width: 40px; height: 40px; background-color: #e6e9ec; display: inline-block; border-radius: 15%;padding-top: 5px;">
							                                    ${ p }
							                                </span>
					                                	</a>
					                            	</c:if>
							                    	
							        </c:forEach>
				                    
				                    <c:if test="${ pi2.currentPage ne pi2.maxPage }">
                               					<a href="holiday.me?p2=${ pi2.currentPage+1 }&selectY1=${ selectY1 }&selectY2=${ selectY2 }&p1=${ pi1.currentPage }">
						                              <span style="width: 40px; height: 40px; background-color: #e6e9ec; display: inline-block; border-radius: 15%; padding-top: 5px;">
						                                    &gt;
						                              </span>
					                            </a>
				                     </c:if>
				                     
                            	</div>
                            </c:if>


                                

                        </div>
                        

                        <!-- 게시글 영역 -->
                        
                    </div>
                    
                </div>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>