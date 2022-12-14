<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
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

        .tb5 td, .tb5 th{
            border: 1px solid #858796;
            border-left: none; 
            border-right: none;
            border-top: none; 
            padding: 0 0 5px 0;
        }

        .positionab{
            position:absolute ;
            top: 0;
            padding: 30px;
        }
        .detailInfo{
            background-color: whitesmoke;
            width: 500px;
            height: 700px;
            left: 25%;
            z-index: 10;
           
            box-shadow: 10px 10px 20px grey;
        }
        
        .positionab2{
            position:absolute ;
            top: 0;
            padding: 30px;
        }
        .detailInfo2{
            background-color: whitesmoke;
            width: 1200px;
            height: 900px;
            left: 0%;
            z-index: 20;
           
            box-shadow: 10px 10px 20px grey;
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
        
        #pagebar a>span{
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
                        <div class="su_content_header" style="margin-left: 10px;">
                            <h3 class="su_sub_menu_name">????????????</h3>
                            <hr class="hr_line" style="border: 0px; height: 3px; width: 1000px; background-color: #5e7e9b;">
                            
                            <br>
                            <div style="width: 850px; position:relative" >
                            	<div class="detailInfo2 positionab2" id="div2" style="display: none;">
                                    
                                            
                                    <div class="close close2"></div>
                                    
                                    
                                    <div  align="left" style="font-size: 25px; font-weight: bold; color: black;"><h2 id="nametag">xxx?????? ????????????</h2><h2 id="notag" style="display: none;"></h2></div>
                                    
                                    <br>
                                    
                                    <div class="checks2">
                                                        <input type="radio" class="choose1" id="ra1" value="M" name="choose"> 
                                                        <label for="ra1">???????????????</label>
                                                        &nbsp;&nbsp;
                                                        <input type="radio" class="choose1" id="ra2" value="W" name="choose"> 
                                                        <label for="ra2">???????????????</label> 
                                                       	
                                    </div>
                                    <br>
                                    <div style="width: 1000px; height: 800px;">
								    	<canvas id="chart"></canvas>
								    </div>
                                </div>
                                
                                <script>
                                		// ??????/?????? radio?????? ????????? ??????????????? ????????????
                                		$('.choose1').on('change',function(){
                                			if($('#ra1').prop('checked')){
                                				chart($('#notag').text())
                                			}else{
                                				chart2($('#notag').text())
                                			}
                                		})
                                		
                                		// ?????????????????? ???????????? ajax
                                		function chart(userNo){
                                			$('#div1').css('display','none');
                                			$.ajax({
                                       			url:'chart.at',
                                       			method:'POST',
                                       			data:{'userNo':userNo},
                                       			success:function(result){
                                       				console.log(result)
                                       				$('#nametag').text(result.memName+'?????? ????????????')
                                       				$('#notag').text(userNo)
                                       				$('#ra1').attr('checked',true)
                                       				chart1(result) // ????????????
                                       			},error:function(){
                                       				alert('??????')
                                       				console.log('??????')
                                       			}
                                       		})
                                		}
                                		
                                		// ?????????????????? ???????????? ajax
                                		function chart2(userNo){
                                			$('#div1').css('display','none');
                               				$.ajax({
                                       			url:'chart.at2',
                                       			method:'POST',
                                       			data:{'userNo':userNo},
                                       			success:function(result){
                                       				console.log(result)
                                       				$('#nametag').text(result.memName+'?????? ????????????')
                                       				$('#notag').text(userNo)
                                     				$('#ra2').attr('checked',true)
                                       				chart1(result) // ????????????
                                        		},error:function(){
                                        			alert('??????')
                                       				console.log('??????')
                                       			}
                                       		})
                                		}
                                		
                                		// ??????????????????
                                		function chart1(result){
								            var ctx = document.getElementById('chart').getContext('2d');
								            var chart = new Chart(ctx, {
								            	type: 'bar',
									        	data: {
									                labels: [result.xlist[11],result.xlist[10],result.xlist[9],result.xlist[8],result.xlist[7],result.xlist[6],result.xlist[5],result.xlist[4],result.xlist[3],result.xlist[2],result.xlist[1],result.xlist[0]],
									                datasets: [{
									                    label: '????????????',
									                    type : 'line',         // 'line' type
									                    fill : false,         // ????????? ??????
									                    lineTension : 0.2,  // 0?????? ????????? ?????????, ????????? ???????????? ????????????
									                    pointRadius : 0,    // ??? ????????? ????????? ?????? ??????
									                    backgroundColor: 'red',
									                   
									                    borderColor: 'red',
									                    data: [result.ylist[11],result.ylist[10],result.ylist[9],result.ylist[8],result.ylist[7],result.ylist[6],result.ylist[5],result.ylist[4],result.ylist[3],result.ylist[2],result.ylist[1],result.ylist[0]]
									                },{
									                    label: '?????????',
									                    type : 'bar', // 'bar' type, ?????? ????????? ????????? ????????????
									                    backgroundColor: 'rgb(255, 204, 102)',
									                    borderColor: 'rgb(255, 204, 102)',
									                    data: [result.ylist2[11],result.ylist2[10],result.ylist2[9],result.ylist2[8],result.ylist2[7],result.ylist2[6],result.ylist2[5],result.ylist2[4],result.ylist2[3],result.ylist2[2],result.ylist2[1],result.ylist2[0]]
									                },]
									            },
									        
									            // Configuration options
									            options: {
									                legend: {
									                     labels: {
									                          fontColor: 'black' // label color
									                         }
									                      },
									                scales: {
									                    // y???
									                    yAxes: [{
									                        stacked: true,
									                        ticks: {
									                            fontColor:'black' // y??? ?????? color
									                        }
									                     }],
									                     // x???
									                     xAxes: [{
									                         stacked: true,
									                        ticks: {
									                            fontColor:'black' // x??? ?????? color
									                        }
									                     }]
									                }
									            }
								        	})
							          		$('#div2').css('display','')
                                 		}
                                		
                                		
							    </script>
                                
                                <div class="detailInfo positionab" id="div1" style="display: none;">
                                    
                                            
                                    <div class="close close2"></div>
                                    
                                    
                                    <div  align="left" style="font-size: 25px; font-weight: bold; color: black;">???????????? ????????????</div>
                                    
                                    <br>
                                    <form action="changeData.At">
                                    	<input type="hidden" id="attNo2" name="attNo">
                                    	<input type="hidden" id="memNo2" name="memNo">
                                        <table style="width: 100%;" class="tb6" >
                                            <tr>
                                                <th style="padding-top: 20px; width:40% ">?????????</th>
                                                <td style="width:60%;padding-top: 20px;" >&nbsp;<input type="text" style="width:80%;" id="memName2" name="memName" readonly></td>
                                            </tr>
                                            <tr>
                                                <th style="padding-top: 20px;">????????????</th>
                                                <td style="padding-top: 20px;">&nbsp;<input type="text" style="width:80%;" id="attDate2" name="attDate" readonly></td>
                                            </tr>
                                            <tr>
                                                <th style="padding-top: 20px;">????????????</th>
                                                <td style="padding-top: 20px;">&nbsp;<input type="text" style="width:80%;" id="testCheck" name="testCheck" readonly></td>
                                            </tr>
                                            <tr>
                                                <th style="padding-top: 20px;">??????????????????</th>
                                                <td style="padding-top: 20px;"><input type="time" id="attIn2" name="attIn"></td>
                                            </tr>
                                            <tr>
                                                <th style="padding-top: 20px;">??????????????????</th>
                                                <td style="padding-top: 20px;"><input type="time" id="attOut2" name="attOut"></td>
                                            </tr>
                                             <tr>
                                                <th style="padding-top: 20px;">????????????</th>
                                                <td style="padding-top: 20px;"><input type="text" id="attWorktime" name="attWorktime" value="" readonly></td>
                                            </tr>
                                            <tr>
                                                <th style="padding-top: 10px;">??????????????????</th>
                                                <td style="padding-bottom: 10px;">&nbsp;
                                                    <div class="checks2">
                                                        <input type="radio" class="rr1" id="radio1" value="D" name="attStatus"> 
                                                        <label for="radio1">??????</label>
                                                        &nbsp;&nbsp;
                                                        <input type="radio" class="rr1" id="radio2" value="L" name="attStatus"> 
                                                        <label for="radio2">????????????</label> 
                                                        &nbsp;&nbsp;
                                                        <input type="radio" class="rr1" id="radio3" value="E" name="attStatus"> 
                                                        <label for="radio3">????????????</label> 
                                                        &nbsp;&nbsp;
                                                        <input type="radio" class="rr1" id="radio4" value="F" name="attStatus"> 
                                                        <label for="radio4">????????????</label> 
                                                        &nbsp;&nbsp;
                                                        <input type="radio" class="rr1" id="radio5" value="H1" name="attStatus"> 
                                                        <label for="radio5">????????????</label>
                                                        &nbsp;&nbsp;
                                                        <input type="radio" class="rr1" id="radio6" value="H2" name="attStatus"> 
                                                        <label for="radio6">????????????</label>
                                                        &nbsp;&nbsp; 
                                                        <input type="radio" class="rr1" id="radio7" value="H0" name="attStatus"> 
                                                        <label for="radio7">????????????</label>  
                                                       	
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                        <br>
                                        <div align="center">
                                            <button type="submit" onclick="return checking1();" class="btn su_btn_two su_btn_all" id="submitBtn" style="width: 180px;">??????????????????</button>
                                        </div>
                                        
                                    </form>
                                </div>
                                
                                <script>
                                	// X??????????????? ??????????????? ???????????? ????????????
	                                $(".close").on('click',function(){
	            		        		$('#div1').css('display','none');
	            		        		$('#div2').css('display','none');
	            		        		$('#memName2').val('')
	            		        		$('#attDate2').val('')
	            		        		$('#testCheck').val('')
	            		        		$('#attIn2').val('')
	            		        		$('#attOut2').val('')
	            		        		$('#attWorktime').val('')
	            		        		$('.rr1').prop('checked',false)
	            		        		$('#ra2').prop('checked',false)
	            		        		$('#ra1').prop('checked',true)
	            		        	})
	            		        	
	            		        	// ??????????????? ????????? ???????????? ???????????????????????? ??????
	            		        	$("#attIn2").on('change',function(){
	            		        		let t = (new Date('2022-01-01T'+$("#attOut2").val())-new Date('2022-01-01T'+$("#attIn2").val()))
	            		        		let ti = t/1000/60/60
	            		        		let ti2 = ti.toFixed(1)
	            		        		if(ti2!='NaN'){
	            		        			$('#attWorktime').val(ti2)
	            		        		}
	            		        	})
	            		        	$("#attOut2").on('change',function(){
	            		        		let t = (new Date('2022-01-01T'+$("#attOut2").val())-new Date('2022-01-01T'+$("#attIn2").val()))
	            		        		let ti = t/1000/60/60
	            		        		let ti2 = ti.toFixed(1)
	            		        		if(ti2!='NaN'){
	            		        			$('#attWorktime').val(ti2)
	            		        		}
	            		        	})
	            		        	
	            		        	// ?????????????????? ????????????????????? ?????????????????? ?????????????????? ?????????
	            		        	$("#radio7").on('change',function(){
	            		        		if($("#radio7").prop('checked')){
	            		        			$("#attIn2").val('')
	            		        			$("#attOut2").val('')
	            		        			$("#attWorktime").val('')
	            		        		}
	            		        	})
	            		        	$("#radio4").on('change',function(){
	            		        		if($("#radio4").prop('checked')){
	            		        			$("#attIn2").val('')
	            		        			$("#attOut2").val('')
	            		        			$("#attWorktime").val('')
	            		        		}
	            		        	})
	            		        	
	            		        	// ???????????? ????????? ?????????????????? ??????????????? ????????? ????????? ????????????????????? ???????????? ??????
	            		        	function checking1(){
	                                	if(!( ($('#radio4').prop('checked')) || ($('#radio7').prop('checked'))  ) && ($('#attIn2').val()=='' || $('#attOut2').val()=='') ){
	                                		alert('???????????????????????? ????????????')
	                                		return false
	                                	}else{
	                                		return true
	                                	}
	                                }
                                </script>
                                
                                <form action="search.at">
                                <table width="100%" class="tb3">
                                     <tr>
                                        <th>????????????</th>
                                        <td>
                                            <select name="deptCode" id="select1" name="select1">
                                            	<option value="all">??????</option>
                                            	<c:forEach var="d" items="${ dlist }">
                                            		<option value="${ d.deptCode }">${ d.deptName }</option>
                                            	</c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>????????????</th>
                                        <td>
                                            <select name="jobCode" id="select2" name="select2">
                                            	<option value="all">??????</option>
                                            	<c:forEach var="j" items="${ jlist }">
                                            		<option value="${ j.jobCode }">${ j.jobName }</option>
                                            	</c:forEach>
                                            </select>

                                        </td>
                                    </tr>
                                    <tr>
                                        <th>????????????</th>
                                        <td>
                                            <input type="date" id="startDate" name="startDate" value="${condition.startDate}">&nbsp;~&nbsp;<input type="date" id="endDate" name="endDate" value="${condition.endDate}"> 
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>??????</th>
                                        <td>
                                            <input type="text" id="keyword" name="keyword" placeholder="????????????">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>????????????</th>
                                        <td>
                                            <input type="checkbox" id="cek1" name="check1" style="zoom: 1.5; vertical-align: middle;" checked>
                                            <label for="cek1" style="color:black; font-weight:500 ;">??????</label>
                                            &nbsp;
                                            <input type="checkbox" id="cek2" name="check2" style="zoom: 1.5; vertical-align: middle;" checked>
                                            <label for="cek2" style="color:black; font-weight:500 ;">????????????/??????</label>
                                            &nbsp;
                                            <input type="checkbox" id="cek3" name="check3" style="zoom: 1.5; vertical-align: middle;" checked>
                                            <label for="cek3" style="color:black; font-weight:500 ;">????????????</label>
                                        </td>
                                    </tr>
                                </table>
                                <br>
                                <div style="width: 1000px;" align="center">
                                    <button type="submit" class="btn su_btn_two su_btn_all" id="submitBtn" data-toggle="modal" data-target="#noContent">????????????</button>
                                    
                                </div>
                                </form>
                                
                                <c:if test="${ not empty condition }">
                                	<c:if test="${ condition.check1 eq false }">
                                		<script>
                                			$('#cek1').prop('checked',false)
                                		</script>
                                	</c:if>
                                	<c:if test="${ condition.check2 eq false }">
                                		<script>
                                			$('#cek2').prop('checked',false)
                                		</script>
                                	</c:if>
                                	<c:if test="${ condition.check3 eq false }">
                                		<script>
                                			$('#cek3').prop('checked',false)
                                		</script>
                                	</c:if>
                                	<c:if test="${ condition.check1 eq false and condition.check2 eq false and condition.check3 eq false }">
                                		<script>
                                			$('#cek1').prop('checked',true)
                                			$('#cek2').prop('checked',true)
                                			$('#cek3').prop('checked',true)
                                		</script>
                                	</c:if>
                                	<script>
                                		$(function(){
                                			$("option[value='${condition.deptCode}']").attr("selected", true);
                                			$('#select2').val('${condition.jobCode}')
                                			
                                			$('#keyword').val('${condition.keyword}')
                                		})
                                	</script>
                                </c:if>
                                
                                <c:if test="${ empty condition }">
	                                <script>
	                                	$(function(){
	                                		/* var timezoneOffset = new Date().getTimezoneOffset() * 60000;
	                                		var kr = new Date(Date.now() - timezoneOffset);
	                                		var kr2 = new Date(Date.now() - timezoneOffset);
	                                		const lastdate = new Date(kr.setDate(1)).toISOString().substring(0, 10);
	                                	    const currentdate = kr2.toISOString().substring(0, 10);
	                                	    console.log(new Date(kr.setDate(1)).toISOString())
	                                        console.log(currentdate)
	                                        console.log(lastdate) */
	                                        // ???????????? ?????????
	                                        var date = new Date()
	                                        date.setHours(date.getHours() + 9)
	                                        currentdate = date.toISOString().replace('T', ' ').substring(0, 10)
	                                        
	                                        // ????????? ?????????
	                                        var date2 = new Date()
	                                	    date2.setDate(1)
	                                	    date2.setHours(date2.getHours() + 9)
	                                        lastdate = date2.toISOString().replace('T', ' ').substring(0, 10)
	                                        $('#startDate').val(lastdate)
	                                        $('#endDate').val(currentdate)
	                                	})
	                                	
	                                	
	                                </script>
                                </c:if>
                                <br><br>
                                <h3 class="su_sub_menu_name">????????????</h3>
                                <hr class="hr_line" style="border: 0px; height: 3px; width: 1000px; background-color: #5e7e9b;">
                                <table id="total" width="100%" class="tb4" style="display:''; margin-left: 30px">
                                    <tr>
                                        <th>??????</th>
                                        <th>???????????? / ????????????</th>
                                        <th>????????????</th>
                                    </tr>
                                    <tr>
                                        <th>
                                        	<c:choose>
                                        		<c:when test="${ condition.check1 eq true }">${ normal }</c:when>
                                        		<c:otherwise>--</c:otherwise>
                                        	</c:choose>
                                        </th>
                                        <th>
                                        	<c:choose>
                                        		<c:when test="${ condition.check2 eq true }">${ leave }</c:when>
                                        		<c:otherwise>--</c:otherwise>
                                        	</c:choose>
                                        </th>
                                        <th>
                                        	<c:choose>
                                        		<c:when test="${ condition.check3 eq true }">${ absent }</c:when>
                                        		<c:otherwise>--</c:otherwise>
                                        	</c:choose>
                                        </th>
                                    </tr>
                                </table>
                                <br>
                           		<div id="select" style="display:'';">
                                <table id="table1" class="tb5" width="100%" style="border-collapse: separate; border-spacing: 0 10px; ">
                                	<thead>
                                    <tr>
                                        <th>??????</th>
                                        <th>??????</th>
                                        <th>????????????</th>
                                        <th>????????????</th>
                                        <th>????????????</th>
                                    </tr>
                                    </thead>
                                    <c:choose>
                                    	<c:when test="${ empty list }">
                                    		<tr>
                                    			<th colspan="5">????????? ????????? ????????????.</th>
                                    		</tr>
                                    	</c:when>
                                    	<c:otherwise>
	                                    	<tbody>
	                                    		<c:forEach var="list" items="${ list }">
	                                    			<tr>
	                                    				<td class="sel0" style="display:none;">${ list.attNo }</td>
	                                    				<td class="sel1" style="display:none;">${ list.memNo }</td>
				                                        <td class="sel2" align="center">${ list.attDate }</td>
				                                        <td class="sel3" align="center" style="cursor: pointer;" onclick="chart(${ list.memNo })">${ list.memName }</td>
				                                        <td  align="center">
				                                        	<c:if test="${ list.attStatus eq 'D' }">????????????</c:if>
				                                        	<c:if test="${ list.attStatus eq 'E' }">????????????</c:if>
				                                        	<c:if test="${ list.attStatus eq 'L' }">????????????</c:if>
				                                        	<c:if test="${ list.attStatus eq 'H' }">??????(??????)</c:if>
				                                        	<c:if test="${ list.attStatus eq 'F' }">
					                                        	<c:choose>
					                                        		<c:when test="${list.attDate lt list.memEnrollDate}">
					                                        			?????????
					                                        		</c:when>
					                                        		<c:otherwise>????????????</c:otherwise>
					                                        	</c:choose>
				                                        	</c:if>
				                                        </td>
				                                        <!-- ?????????????????? ????????? ?????? ????????? ?????? -->
				                                        <td class="sel4"" align="center" style="display:none;">${ list.attStatus }</td>
				                                        <td align="center"><c:out value="${ list.attIn }" default="--"/></td>
				                                        <td align="center"><c:out value="${ list.attOut }" default="--"/></td>
				                                        <td class="sel5" align="center" style="display:none;">${ list.attIn }</td>
				                                        <td class="sel6" align="center" style="display:none;">${ list.attOut }</td>
				                                        <td class="sel7" align="center" style="display:none;">${ list.attHstatus }</td>
				                                        <td class="sel8" align="center" style="display:none;">${ list.attDate }</td>
				                                        <td class="sel9" align="center" style="display:none;">${ list.memEnrollDate }</td>
				                                    </tr>
	                                    		</c:forEach>
	                                    	</tbody>
                                    	</c:otherwise>
                                    </c:choose>
                                 </table>
                            
                            <script>
                            	$(function(){
                            		$("#table1>tbody>tr").click(function(){
                            			// ????????? ????????? ???????????? ???????????????????????? ?????? ????????????
                            			$('#div1').css('display','none'); 
	            		        		$('#memName2').val('')
	            		        		$('#attDate2').val('')
	            		        		$('#testCheck').val('')
	            		        		$('#attIn2').val('')
	            		        		$('#attOut2').val('')
	            		        		$('#attWorktime').val('')
	            		        		$('.rr1').prop('checked',false)
                            			
	            		        		// ????????? ????????? ????????????????????? ?????????
                            			$('#attNo2').val($(this).children('.sel0').text())
                            			$('#memNo2').val($(this).children('.sel1').text())
										$('#memName2').val($(this).children('.sel3').text())
										$('#attDate2').val($(this).children('.sel2').text())
										if($(this).children('.sel4').text()=='D'){
											$('#testCheck').val('????????????')
											$("#radio1").prop('checked',true)
										}
                            			if($(this).children('.sel4').text()=='E'){
											$('#testCheck').val('????????????')
											$("#radio3").prop('checked',true)
										}
                            			if($(this).children('.sel4').text()=='L'){
											$('#testCheck').val('????????????')
											$("#radio2").prop('checked',true)
										}
                            			if($(this).children('.sel4').text()=='H'){
											$('#testCheck').val('??????(??????)')
											if($(this).children('.sel7').text()=='H0'){
												$("#radio7").prop('checked',true)
											}
											if($(this).children('.sel7').text()=='H1'){
												$("#radio5").prop('checked',true)
											}
											if($(this).children('.sel7').text()=='H2'){
												$("#radio6").prop('checked',true)
											}
										}
                            			if($(this).children('.sel4').text()=='F'){
                            				if($(this).children('.sel8').text()>=$(this).children('.sel9').text()){
											$('#testCheck').val('????????????')
											$("#radio4").prop('checked',true)
											}else{
												$('#testCheck').val('?????????')
											}
										}
                            			$('#attIn2').val($(this).children('.sel5').text())
                            			$('#attOut2').val($(this).children('.sel6').text())
                            			
                            			// ???????????? ????????????
                            			let t = (new Date('2022-01-01T'+$("#attOut2").val())-new Date('2022-01-01T'+$("#attIn2").val()))
	            		        		let ti = t/1000/60/60
	            		        		let ti2 = ti.toFixed(1) // ???????????? ??????????????????????????? ??????
	            		        		if(ti2!='NaN'){
	            		        			$('#attWorktime').val(ti2)
	            		        		}
                            			// ????????????????????? ??????
                            			$('#div1').css('display','')
                            		})
                            	})
                            	
                            	function chartpage(a){
                            			chart(a)
                            		}
                            </script>
                            
                            <br>
                            <c:if test="${ not empty list }">
	                            <div style="margin-top: 10px; width: 1000px; height: 40px;" align="center" id="pagebar">
	                                <c:if test="${ pi.currentPage ne 1 }">
	                                	<a href="search.at?p=${ pi.currentPage-1 }&deptCode=${condition.deptCode}&jobCode=${condition.jobCode}&startDate=${condition.startDate}&endDate=${condition.endDate}&keyword=${condition.keyword}&check1=${condition.check1}&check2=${condition.check2}&check3=${condition.check3}">
							                <span style="width: 40px; height: 40px; background-color: #e6e9ec; display: inline-block; border-radius: 15%; padding-top: 5px;">
							                &lt;
							                </span>
					                    </a>
	                                </c:if>
	                                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					                            	<c:if test="${ p eq pi.currentPage }">
					                            		<a href="search.at?p=${ p }&deptCode=${condition.deptCode}&jobCode=${condition.jobCode}&startDate=${condition.startDate}&endDate=${condition.endDate}&keyword=${condition.keyword}&check1=${condition.check1}&check2=${condition.check2}&check3=${condition.check3}">
							                                <span style="width: 40px; height: 40px; background-color: #5e7e9b; display: inline-block; border-radius: 15%;padding-top: 5px;">
							                                    ${ p }
							                                </span>
					                                	</a>
					                            	</c:if>
					                            	<c:if test="${ p ne pi.currentPage }">
					                            		<a href="search.at?p=${ p }&deptCode=${condition.deptCode}&jobCode=${condition.jobCode}&startDate=${condition.startDate}&endDate=${condition.endDate}&keyword=${condition.keyword}&check1=${condition.check1}&check2=${condition.check2}&check3=${condition.check3}">
							                                <span style="width: 40px; height: 40px; background-color: #e6e9ec; display: inline-block; border-radius: 15%;padding-top: 5px;">
							                                    ${ p }
							                                </span>
					                                	</a>
					                            	</c:if>
							                    	
							        </c:forEach>
							        <c:if test="${ pi.currentPage ne pi.maxPage }">
							        	<a href="search.at?p=${ pi.currentPage+1 }&deptCode=${condition.deptCode}&jobCode=${condition.jobCode}&startDate=${condition.startDate}&endDate=${condition.endDate}&keyword=${condition.keyword}&check1=${condition.check1}&check2=${condition.check2}&check3=${condition.check3}">
						                                <span style="width: 40px; height: 40px; background-color: #e6e9ec; display: inline-block; border-radius: 15%; padding-top: 5px;">
						                                    &gt;
						                                </span>
					                    </a>
							        </c:if>
	                            </div>
                            </c:if>
                            </div>
                            
                        </div>
                        

                        <!-- ????????? ?????? -->
                        
                    </div>
                   </div> 
                </div> 
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>