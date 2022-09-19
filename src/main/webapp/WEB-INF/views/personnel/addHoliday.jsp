<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/addHoPage.css" rel="stylesheet" type="text/css">
<style>
	select {
    width: 120px;
    height: 40px; 
    padding: .2em .5em; 
    font-family: inherit;  
    background: url(resources/images/selectimg.jpg) no-repeat 95% 50%;  
    border: 1px solid #999; 
    border-radius: 5px; 
    -webkit-appearance: none; 
    -moz-appearance: none;
    appearance: none;
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
                        <div class="su_content_header" style="margin-left: 10px;">
                            <h3 class="su_sub_menu_name">연차일괄지급</h3>
                            <hr class="hr_line" style="border: 0px; height: 3px; width: 1000px; background-color: #5e7e9b;">
                            <br>
                            <div>
                                <h4 style="font-weight: bold;">연차일괄지급 대상자 : 전월에 지각,결근,조퇴가 없는직원</h4>
                            </div>
                            <br>
                            <div style="width: 1000px; padding-left: 250px;" >
                                <button type="button" class="btn su_btn_two su_btn_all" id="submitBtn" data-toggle="modal" data-target="#noContent" style="width: 150px;">일괄지급</button>
                            </div>
                            <br><br>
                            <h3 class="su_sub_menu_name">연차개별지급</h3>
                            <hr class="hr_line" style="border: 0px; height: 3px; width: 1000px; background-color: #5e7e9b;">
                            <br>
                            <div class="Wbox" style="margin-left:-10px ;">
                                <div class="search1" style="width: 500px">
                                   
                                    <select name="deptCode" id="deptCode" name="deptCode">
                                          <option value="all">전체</option>
                                          <c:forEach var="d" items="${ dlist }">
                                           		<option value="${ d.deptCode }">${ d.deptName }</option>
                                          </c:forEach>
                                    </select>
                                    &nbsp;
                                    <select name="jobCode" id="jobCode" name="jobCode">
                                          <option value="all">전체</option>
                                          <c:forEach var="j" items="${ jlist }">
                                            	<option value="${ j.jobCode }">${ j.jobName }</option>
                                           </c:forEach>
                                    </select> 
                                    &nbsp;
                                    <input name="keyword" class="keyword" type="text" style=" width: 100px; height: 40px; border: 1px solid #999;  border-radius: 5px;  text-align: center;" id="searchclick" placeholder="이름검색">
                                    <button id="searchbtn" style="line-height: 30px;" class="btnpurple">검색</button>
                                    
                                </div>
                                
                                <span class="sall">
                                    <div class="checks1">
                                        
                                        <input type="checkbox" id="ch1"> 
                                        <label for="ch1">전체선택</label>
                                        
                                        <input type="checkbox" id="ch2"> 
                                        <label for="ch2" style="padding-left: 290px;">전체선택</label>
                                    </div>
                                </span>
                                
                                <div class="lbox">
                                   <ul>
                                   		<c:forEach var="list" items="${ list }">
                                   			<li>
	                                            <div class="checks11">
	                                                <input type="checkbox" class="userNo" id="a${ list.memNo }" value="${ list.memNo }" >     
	                                                <label for="a${ list.memNo }">${ list.memName } (${ list.deptName }, ${ list.jobName })</label>
	                                            </div>  
                                        	</li>
                                   		</c:forEach>
                                   </ul>
                                </div>
                                <div class="cbox">
                                    <div align="center" style="margin-top:70px ; font-size:70px;">
                                        <div><button class="rbtn btns" style="color:#5e7e9b;">›</button></div>
                                        
                                        <div><button class="lbtn btns" style="color:#5e7e9b;">‹</button></div>
                                    </div>
                                </div>
                                <div class="rbox">
                                    <ul>
                                   		<c:forEach var="list" items="${ list }">
                                   			<li style="display: none;">
	                                            <div class="checks11">
	                                                <input type="checkbox" class="selectNo" id="b${ list.memNo }" value="${ list.memNo }">     
	                                                <label for="b${ list.memNo }">${ list.memName } (${ list.deptName }, ${ list.jobName })</label>
	                                            </div>  
                                        	</li>
                                   		</c:forEach>
                                   </ul>
                                </div>

                                <script>
					                $('#ch1').on('click',function(){
					                	if($('#ch1').prop('checked')){
					                		$('.userNo').prop('checked',true)
					                	}else{
					                		$('.userNo').prop('checked',false)
					                	}
					                })
					                
					                 $('#ch2').on('click',function(){
					                	if($('#ch2').prop('checked')){
					                		$('.selectNo').prop('checked',true)
					                	}else{
					                		$('.selectNo').prop('checked',false)
					                	}
					                })
				               </script>
				               
				               <script>
				               		let rNo=[];
				               		
				               		$('.rbtn').on('click',function(){
				               			$('#ch1').prop('checked',false)
				               			$('#ch2').prop('checked',false)
				               			
				               			
				               			let li = $('input[class="userNo"]:checked');
				               			$(li).each(function(){
				               				rNo.push($(this).val())
				               				$(this).parent().parent().css('display','none')
										})
										
										let li2 = $('input[class="selectNo"]');
				               			console.log(li2)
				               			$(li2).each(function(){
				               				for(let i=0;i<rNo.length;i++){
				               					if($(this).val()==rNo[i]){
				               						$(this).parent().parent().css('display','')
				               					}
				               				}
										})
										console.log(rNo)
										$('.userNo').prop('checked',false)
				               			$('.selectNo').prop('checked',false)
				               			
				               			$('#memNo').val(rNo)
				               		})
				               		
				               		$('.lbtn').on('click',function(){
				               			$('#ch2').prop('checked',false)
				               			$('#ch1').prop('checked',false)
				               			
				               			let arr = [];
				                    	let li = $('input[class="selectNo"]:checked');
										$(li).each(function(){
											arr.push($(this).val())
											$(this).parent().parent().css('display','none')
											$(this).prop('checked',false)
										})
										
										
										for(let i=0;i<arr.length;i++){
											for(let j=0;j<rNo.length;j++){
												if(arr[i]==rNo[j]){
													
													$('#a'+rNo[j]).parent().parent().css('display','')
													console.log('제거수:'+rNo.splice(j,1))
													
												}
											}
										}
										console.log(rNo)
										$('.userNo').prop('checked',false)
				               			$('.selectNo').prop('checked',false)
				               			$('#memNo').val(rNo)
				               		})
				               		
				               		$('#searchbtn').on('click',function(){
				               			$.ajax({
                                			url:'searchSelectMem.ho',
                                			method:'POST',
                                			data:{'deptCode':$('#deptCode').val(),
                                			      'jobCode':$('#jobCode').val(),
                                			      'keyword':$('.keyword').val()
                                			      },
                                			success:function(list){
                                				console.log(list)
                                				
                                				$('.userNo').parent().parent().css('display','none')
                                				for(let i=0;i<list.length;i++){
            										$('#a'+list[i].memNo).parent().parent().css('display','')
            									}
                                				for(let i=0;i<rNo.length;i++){
        												$('#a'+rNo[i]).parent().parent().css('display','none')
        										}
                                				$('#memNo').val(rNo)
                                			},error:function(){
                                				alert('애러')
                                				console.log('애러')
                                			}
                                		})
				               		})
				               		
				               </script>
                                
                                <form id="forms" action="" method="post">
                                <div class="sendbtn">
                                    <br>
                                    <div style="padding-left:20px ; text-align: left;">
                                        <select name="dateCount" id="select1">
                                            <option value="">연차일수</option>
                                            <option style="padding-left:30px ;" value="0.5">0.5일</option>
                                            <option style="padding-left:30px ;" value="1">1일</option>
                                            <option style="padding-left:30px ;" value="2">2일</option>
                                            <option style="padding-left:30px ;" value="3">3일</option>
                                            <option style="padding-left:30px ;" value="15">15일</option>
                                        </select>  
                                    </div>
                                    <br>  
                                    <button type="button" id="add1" class="button1">연차지금</button> 
                                    &nbsp;&nbsp;&nbsp;
                                    <button type="button" id="delete1" class="button2" >연차회수</button>
                                    <br><input id="memNo" name="memNos" type="hidden" style="width: 800px" value="">
                                </div>
                                </form>
                                
                                <script>
                                	$('#add1').click(function(){
	                            		$('#forms').attr('action', 'add.ho');
                            		$('#forms').submit()
	                            	})
	                            	
	                            	$('#delete1').click(function(){
	                            		$('#forms').attr('action', 'delete.ho');
                            		$('#forms').submit()
	                            	})
                                </script>
                                
                            </div>
                            
                        </div>
                        

                        <!-- 게시글 영역 -->
                        
                    </div>
                    
                </div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>