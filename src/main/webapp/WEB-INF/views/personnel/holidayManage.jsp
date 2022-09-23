<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
select {
            width: 200px; 
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

  
  .td4 {
            width: 100%;
            border: 1px solid #858796;
            border-collapse: collapse;
        }
        
        
        .tb3{
            width: 100%;
            border: 1px solid white;
            border-collapse: collapse;
        }

        .tb3 th, .tb3 td{
            border: 1px solid white;
            padding: 10px;
        }

        .tb3 th{width: 10%; height: 50px;}
        .tb3 td{width: 90%; height: 50px;}
        
        .tb4 th{width: 33%;}
        .tb4 th, .tb4 td{
            border: 1px solid #858796;
            padding: 10px;
            padding: 5px;
        }

        .tb5 td, .tb5 th{
            border: 1px solid #858796;
            border-left: none; 
            border-right: none;
            border-top: none; 
            padding: 0 0 5px 0;
        }

        .tb6{
            
            border-collapse: collapse;
        }
        .tb6 td,.tb6 th{
            border: 0;
            padding:2px;
        }
        .tb6 th{width: 40%;}
        .positionab{
            position:absolute ;
            top: 30%;
            padding: 30px;
        }
        .detailInfo{
            background-color: whitesmoke;
            width: 500px;
            height: 500px;
            left: 35%;
            z-index: 10;
           
            box-shadow: 10px 10px 20px grey;
        }
                .close {
        position:relative;
        display:inline-block;
        display:inline;
        width:50px;
        height:50px;
        text-align:center;
        margin-right:20px;
        
        }
        .close2:after {
        content: "\00d7"; 
        font-size:25pt;
        line-height:45px;
        }
        .checks2 {position: relative;}
        .checks2 input[type="radio"] {
        position: absolute;
        width: 1px;
        height: 1px;
        padding: 0;
        margin: -1px;
        overflow: hidden;
        clip:rect(0,0,0,0);
        border: 0;
        }
        .checks2 input[type="radio"] + label {
        display: inline-block;
        position: relative;
        padding-left: 27px;
        cursor: pointer;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        }
        .checks2 input[type="radio"] + label:before {
        content: '';
        position: absolute;
        left: 1px;
        top: 1px;
        width: 21px;
        height: 21px;
        text-align: center;
        background: #fafafa;
        border: 1px solid #cacece;
        border-radius: 100%;
        box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);
        }
        .checks2 input[type="radio"] + label:active:before,
        .checks2 input[type="radio"]:checked + label:active:before  {
        box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1);
        }
        .checks2 input[type="radio"]:checked + label:before {
        background: #E9ECEE;
        border-color: #adb8c0;
        }
        .checks2 input[type="radio"]:checked + label:after {
        content: '';
        position: absolute;
        top: 5px;
        left: 5px;
        width: 13px;
        height: 13px;
        background: #99a1a7;
        border-radius: 100%;
        box-shadow: inset 0px 0px 10px rgba(0,0,0,0.3);
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
                <div class="container-fluid">
                    <jsp:include page="../personnel/personnelSidebar.jsp" />
                   
                    <div class="container-fluid su_contentArea" style="padding-left: 10px;">
                        <div class="su_content_header" style="margin-left: 10px; ">
                            <h3 class="su_sub_menu_name">조회설정</h3>
                            <hr class="hr_line" style="border: 0px; height: 3px; width: 1000px; background-color: #5e7e9b; ">
                            
                            <br>
                            <div style="width: 1000px;" >
                                <form action="selectManage.ho">
                                <table width="100%" class="tb3">
                                    
                                    <tr>
                                        <th>조회부서</th>
                                        <td>
                                            <select name="deptCode" id="select1" name="select1">
                                            	<option value="all">전체</option>
                                            	<c:forEach var="d" items="${ dlist }">
                                            		<option value="${ d.deptCode }">${ d.deptName }</option>
                                            	</c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>조회직급</th>
                                        <td>
                                            <select name="jobCode" id="select2" name="select2">
                                            	<option value="all">전체</option>
                                            	<c:forEach var="j" items="${ jlist }">
                                            		<option value="${ j.jobCode }">${ j.jobName }</option>
                                            	</c:forEach>
                                            </select>

                                        </td>
                                    </tr>
                                    <tr>
                                        <th>기간설정</th>
                                        <td>
                                            <input type="date" id="startDate" name="startDate" value="${condition.startDate}">&nbsp;~&nbsp;<input type="date" id="endDate" name="endDate" value="${condition.endDate}"> 
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>이름</th>
                                        <td>
                                            <input type="text" id="keyword" name="keyword" placeholder="이름검색">
                                        </td>
                                    </tr>
                                    
                                    
                                </table>
                                <br>
                                <div style="width: 1000px;" align="center">
                                    <button type="submit" class="btn su_btn_two su_btn_all" id="submitBtn" data-toggle="modal" data-target="#noContent">조회하기</button>
                                    
                                </div>
                                </form>
                                
                                <c:if test="${ not empty condition.jobCode }">
                                	<script>
                                		$(function(){
                                			$("option[value='${condition.deptCode}']").attr("selected", true);
                                			
                                			$('#select2').val('${condition.jobCode}')
                                			
                                			$('#keyword').val('${condition.keyword}')
                                		})
                                	</script>
                                </c:if>
                                
                                <!--  
                                 <c:if test="${ not empty condition }">
	                                <script>
	                                	$(function(){
	                                		
	                                        var date = new Date()
	                                        date.setHours(date.getHours() + 9)
	                                        currentdate = date.toISOString().replace('T', ' ').substring(0, 10)
	                                        var date2 = new Date()
	                                	    date2.setHours(date.getHours() + 9)
	                                        date2.setDate(1)
	                                        lastdate = date2.toISOString().replace('T', ' ').substring(0, 10)
	                                        console.log(currentdate)
	                                        console.log(lastdate)
	                                        $('#startDate').val(lastdate)
	                                        $('#endDate').val(currentdate)
	                                	})
	                                	
	                                	
	                                </script>
	                            </c:if>
                                -->
                                
                                

                                <br><br>
                                <h3 class="su_sub_menu_name">연차승인내역</h3>
                                <hr class="hr_line" style="border: 0px; height: 3px; width: 1000px; background-color: #5e7e9b; position:relative">
                                <div class="detailInfo positionab" id="div1" style="display:none ;">
                                    
                                            
                                    <div class="close close2"></div>
                                    
                                    
                                    <div   align="left" style="font-size: 25px; font-weight: bold; color: black;">승인연차 등록하기</div>
                                    
                                    <br>
                                    <form action="">
                                    	<input type="hidden" id="memNo1" name="memNo">
                                    	
                                        <table style="width: 100%;" class="tb6" >
                                            <tr>
                                                <th style="padding-top: 20px; width:40% ">사원명</th>
                                                <td style="width:60%;padding-top: 20px;" >&nbsp;<input type="text" class="divall" style="width:80%;" id="memName1" name="memName" readonly></td>
                                            </tr>
                                            <tr>
                                                <th style="padding-top: 20px;">연차시작날짜</th>
                                                <td style="padding-top: 20px;">&nbsp;<input type="text" style="width:80%;" class="divall" id="startDate1" name="startDate" readonly></td>
                                            </tr>
                                            <tr>
                                                <th style="padding-top: 20px;">연차종료날짜</th>
                                                <td style="padding-top: 20px;">&nbsp;<input type="text" style="width:80%;" class="divall" id="endDate1" name="endDate" readonly></td>
                                            </tr>
                                            
                                            <tr>
                                            	<th class="checks2" colspan="2">
                                            		 <input type="checkbox" id="ck1" name="check1" > 
	                                    			 <label for="ck1">연차시작일 반차여부</label>
	                                    			 <br>
	                                    			 <input type="checkbox" id="ck2" name="check2" > 
	                                    			 <label for="ck2">연차종료일 반차여부</label>
                                            	</th>
                                            </tr>
                                         </table>
                                         <br><br>
                                         <div align="center">
                                            <button type="submit" onclick="return test11();" class="btn su_btn_two su_btn_all" id="submitBtn" data-toggle="modal" data-target="#noContent" style="width: 180px;">연차등록하기</button>
                                        </div>
                                     </form>
                            	</div>
                            	
                            	<div class="detailInfo positionab" id="div2" style="display:none ;">
                                    
                                            
                                    <div class="close close2"></div>
                                    
                                    
                                    <div  align="left" style="font-size: 25px; font-weight: bold; color: black;">승인반차 등록하기</div>
                                    
                                    <br>
                                    <form action="">
                                    	<input type="hidden" id="memNo" name="memNo">
                                    	
                                        <table style="width: 100%;" class="tb6" >
                                            <tr>
                                                <th style="padding-top: 20px; width:40% ">사원명</th>
                                                <td style="width:60%;padding-top: 20px;" >&nbsp;<input type="text" class="divall" style="width:80%;" id="memName2" name="memName" readonly></td>
                                            </tr>
                                            <tr>
                                                <th style="padding-top: 20px;">반차날짜</th>
                                                <td style="padding-top: 20px;">&nbsp;<input type="text"  class="divall" style="width:80%;" id="attDate2" name="attDate" readonly></td>
                                            </tr>
                                            <tr>
                                                <th style="padding-top: 20px;">반차종류</th>
                                                <td style="padding-top: 20px;">&nbsp;
                                                <div class="checks2">
                                                		<input type="radio" class="rr1" class="divall" id="radio1" value="H1" name="attHStatus"> 
                                                        <label for="radio1">오전반차</label>
                                                        &nbsp;&nbsp;
                                                        <input type="radio" class="rr1" class="divall" id="radio2" value="H2" name="attHStatus"> 
                                                        <label for="radio2">오후반차</label> 
                                                </div>
                                                </td>
                                            </tr>
                                         </table>
                                         <br><br>
                                         <div align="center">
                                            <button type="submit" onclick="return test11();" class="btn su_btn_two su_btn_all" id="submitBtn" data-toggle="modal" data-target="#noContent" style="width: 180px;">반차등록하기</button>
                                        </div>
                                     </form>
                            	</div>
                                <br>

                               

                                <table class="tb5" width="95%" style="border-collapse: separate; border-spacing: 0 10px; ">
                                    <tr>
                                    	<th>사원명</th>
                                    	<th>부서</th>
                                    	<th>직급</th>
                                        <th>연차시작날짜</th>
                                        <th>연차종료날짜</th>
                                        <th>연차사용일</th>
                                        <th>연차종류</th>
                                       
                                    </tr>
                                    <c:choose>
                                    	<c:when test="${ empty list1 }">
                                    		<tr><th colspan="6">조회된 목록 없음</th></tr>
                                    	</c:when>
                                    	<c:otherwise>
                                    		<c:forEach var="l1" items="${ list1 }">
                                    		<tr class="list1">
		                                    	<td id="name1" align="center">${ l1.memName }</td>
		                                    	<td align="center">${ l1.deptName }</td>
		                                    	<td align="center">${ l1.jobName }</td>
		                                        <td align="center">
		                                        	${ l1.leaveStartDate }
		                                        	<c:if test="${ l1.leaveType eq 1 and l1.aa eq 2 }">
		                                        	(오후시작)
		                                        	</c:if>
		                                        </td>
		                                        <td align="center">
		                                        	${ l1.leaveEndDate }
		                                        	<c:if test="${ l1.leaveType eq 1 and l1.bb eq 1 }">
		                                        	(오전종료)
		                                        	</c:if>
		                                        </td>
		                                        <td align="center">
		                                        	${ l1.requestPeriod }
		                                        </td>
		                                        <td align="center">
		                                        	<c:if test="${ l1.leaveType eq 1 }">
		                                        		연차
		                                        	</c:if>
		                                        	<c:if test="${ l1.leaveType eq 2 and l1.aa eq 1 }">
		                                        		오전반차
		                                        	</c:if>
		                                        	<c:if test="${ l1.leaveType eq 2 and l1.aa eq 2 }">
		                                        		오후반차
		                                        	</c:if>
		                                        </td>
		                                        <td id="sel0" style="display: none;">${ l1.leave }</td>
		                                        <td id="sel1" style="display: none;">${ l1.leaveType }</td>
		                                        <td id="sel2" style="display: none;">${ l1.memNo }</td>
		                                        <td id="sel3" style="display: none;">${ l1.leaveStartDate }</td>
		                                        <td id="sel4" style="display: none;">${ l1.leaveEndDate }</td>
		                                        <td id="sel5" style="display: none;">${ l1.aa }</td>
		                                        <td id="sel6" style="display: none;">${ l1.bb }</td>
		                                   </tr>
		                                   </c:forEach>
                                    	</c:otherwise>
                                    </c:choose>
                                </table>
                            </div>
                            
                            <script type="text/javascript">
                            	$('.list1').on('click',function(){
                            		if($(this).children('#sel0').text()!=''){
                            			alert('이미 연차등록이 완료된 건입니다.')
                            		}else{
                            			if($(this).children('#sel1').text()=='1'){
                            				$('#memNo1').val($(this).children('#sel2').text())
                            				$('#memName1').val($(this).children('#name1').text())
                            				$('#startDate1').val($(this).children('#sel3').text())
                            				$('#endDate1').val($(this).children('#sel4').text())
                            				if($(this).children('#sel5').text()==2){
                            					$('#ck1').attr('checked',true)
                            				}
                            				if($(this).children('#sel5').text()==2){
                            					$('#ck1').attr('checked',true)
                            				}
                            				if($(this).children('#sel6').text()==1){
                            					$('#ck2').attr('checked',true)
                            				}
                            				$('#div1').css('display','')
                            				$('#div2').css('display','none')
                            			}else{
                            				$('#div1').css('display','none')
                            				$('#div2').css('display','')
                            			}
                            		}
                            	})
                            	
                            	$(".close").on('click',function(){
	            		        		$('#div1').css('display','none');
	            		        		$('#div2').css('display','none');
	            		        		$('.divall').val('')
	            		        		$('#ck1').attr('checked',false)
	            		        		$('#ck2').attr('checked',false)
	            		        })
                            </script>
                            
                            <br>
                            <c:if test="${ not empty list1 }">
                            	<div style="margin-top: 10px; width: 1000px; height: 40px;" align="center" id="pagebar">
                               		<c:if test="${ pi1.currentPage ne 1 }">
                               					<a href="selectManage.ho?p1=${ pi1.currentPage-1 }&p2=${ pi2.currentPage }&keyword=${ condition.keyword }&deptCode=${ condition.deptCode }&jobCode=${ condition.jobCode }&startDate=${ condition.startDate }&endDate=${ condition.endDate }">
						                              <span style="width: 40px; height: 40px; background-color: #e6e9ec; display: inline-block; border-radius: 15%; padding-top: 5px;">
						                                    &lt;
						                              </span>
					                            </a>
				                     </c:if>
				                     
				                     <c:forEach var="p" begin="${ pi1.startPage }" end="${ pi1.endPage }">
					                            	<c:if test="${ p eq pi1.currentPage }">
					                            		<a href="selectManage.ho?p1=${ p }&p2=${ pi2.currentPage }&keyword=${ condition.keyword }&deptCode=${ condition.deptCode }&jobCode=${ condition.jobCode }&startDate=${ condition.startDate }&endDate=${ condition.endDate }">
							                                <span style="width: 40px; height: 40px; background-color: #5e7e9b; display: inline-block; border-radius: 15%;padding-top: 5px;">
							                                    ${ p }
							                                </span>
					                                	</a>
					                            	</c:if>
					                            	<c:if test="${ p ne pi1.currentPage }">
					                            		<a href="selectManage.ho?p1=${ p }&p2=${ pi2.currentPage }&keyword=${ condition.keyword }&deptCode=${ condition.deptCode }&jobCode=${ condition.jobCode }&startDate=${ condition.startDate }&endDate=${ condition.endDate }">
							                                <span style="width: 40px; height: 40px; background-color: #e6e9ec; display: inline-block; border-radius: 15%;padding-top: 5px;">
							                                    ${ p }
							                                </span>
					                                	</a>
					                            	</c:if>
							                    	
							        </c:forEach>
				                    
				                    <c:if test="${ pi1.currentPage ne pi1.maxPage }">
                               					<a href="selectManage.ho?p1=${ pi1.currentPage+1 }&p2=${ pi2.currentPage }&keyword=${ condition.keyword }&deptCode=${ condition.deptCode }&jobCode=${ condition.jobCode }&startDate=${ condition.startDate }&endDate=${ condition.endDate }">
						                              <span style="width: 40px; height: 40px; background-color: #e6e9ec; display: inline-block; border-radius: 15%; padding-top: 5px;">
						                                    &gt;
						                              </span>
					                            </a>
				                     </c:if>
				                     
                            	</div>
                            </c:if>

                            <br><br>
                                <h3 class="su_sub_menu_name">연차지급내역</h3>
                                <hr class="hr_line" style="border: 0px; height: 3px; width: 1000px; background-color: #5e7e9b;">
                            <div>    
                                <br>
                                 <table width="90%" class="tb4" style="display:none ;">
                                    <tr>
                                        <th>연차지급일수</th>
                                        <th>연차사용일수</th>
                                        <th>남은연차일수</th>
                                    </tr>
                                    <tr>
                                        <th>--</th>
                                        <th>--</th>
                                        <th>--</th>
                                    </tr>
                                    
                                </table>
                                <br>
                                <table class="tb5" width="95%" style="border-collapse: separate; border-spacing: 0 10px; ">
                                    <tr>
                                        <th>사원명</th>
                                        <th>부서</th>
                                        <th>직급</th>
                                        <th>지급일</th>
                                        <th>지급상태</th>
                                        <th>지급갯수</th>
                                        <th>비고</th>
                                    </tr>
                                    <c:choose>
                                    	<c:when test="${ empty list2 }">
                                    		<tr><th colspan="6">조회된 목록 없음</th></tr>
                                    	</c:when>
                                    	<c:otherwise>
                                    		<c:forEach var="l2" items="${ list2 }">
                                    		<tr class="list2" onclick="holidayDetail(${ l2.memNo })">
		                                    	<td align="center">${ l2.memName }</td>
		                                    	<td align="center">${ l2.deptName }</td>
		                                    	<td align="center">${ l2.jobName }</td>
		                                        <td align="center">${ l2.hoDate }</td>
		                                        <td align="center">
		                                        	<c:if test="${ l2.hoNum gt 0 }">
		                                        		지급
		                                        	</c:if>
		                                        	<c:if test="${ l2.hoNum lt 0 }">
		                                        		회수
		                                        	</c:if>
		                                        </td>
		                                        <td align="center">
		                                        	<c:if test="${ l2.hoNum gt 0 }">
		                                        		${ l2.hoNum }
		                                        	</c:if>
		                                        	<c:if test="${ l2.hoNum lt 0 }">
		                                        		${ l2.hoNum * -1 }
		                                        	</c:if>
		                                        </td>
		                                        <td align="center">
		                                        	<c:out value="${ l2.hoComment }" default="--"></c:out>
		                                        </td>
		                                   </tr>
		                                   </c:forEach>
                                    	</c:otherwise>
                                    </c:choose>
                             	</table>
                            </div>
                            <br>
                            <c:if test="${ not empty list2 }">
                            	<div style="margin-top: 10px; width: 1000px; height: 40px;" align="center" id="pagebar2">
                               		<c:if test="${ pi2.currentPage ne 1 }">
                               					<a href="holiday.me?p2=${ pi2.currentPage-1 }&p1=${ pi1.currentPage }&keyword=${ condition.keyword }&deptCode=${ condition.deptCode }&jobCode=${ condition.jobCode }&startDate=${ condition.startDate }&endDate=${ condition.endDate }">
						                              <span style="width: 40px; height: 40px; background-color: #e6e9ec; display: inline-block; border-radius: 15%; padding-top: 5px;">
						                                    &lt;
						                              </span>
					                            </a>
				                     </c:if>
				                     
				                     <c:forEach var="p" begin="${ pi2.startPage }" end="${ pi2.endPage }">
					                            	<c:if test="${ p eq pi2.currentPage }">
					                            		<a href="holiday.me?p2=${ p }&p1=${ pi1.currentPage }&keyword=${ condition.keyword }&deptCode=${ condition.deptCode }&jobCode=${ condition.jobCode }&startDate=${ condition.startDate }&endDate=${ condition.endDate }">
							                                <span style="width: 40px; height: 40px; background-color: #5e7e9b; display: inline-block; border-radius: 15%;padding-top: 5px;">
							                                    ${ p }
							                                </span>
					                                	</a>
					                            	</c:if>
					                            	<c:if test="${ p ne pi2.currentPage }">
					                            		<a href="holiday.me?p2=${ p }&p1=${ pi1.currentPage }&keyword=${ condition.keyword }&deptCode=${ condition.deptCode }&jobCode=${ condition.jobCode }&startDate=${ condition.startDate }&endDate=${ condition.endDate }">
							                                <span style="width: 40px; height: 40px; background-color: #e6e9ec; display: inline-block; border-radius: 15%;padding-top: 5px;">
							                                    ${ p }
							                                </span>
					                                	</a>
					                            	</c:if>
							                    	
							        </c:forEach>
				                    
				                    <c:if test="${ pi2.currentPage ne pi2.maxPage }">
                               					<a href="holiday.me?p2=${ pi2.currentPage+1 }&p1=${ pi1.currentPage }&keyword=${ condition.keyword }&deptCode=${ condition.deptCode }&jobCode=${ condition.jobCode }&startDate=${ condition.startDate }&endDate=${ condition.endDate }">
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