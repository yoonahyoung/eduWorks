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
            height: 600px;
            left: 25%;
            z-index: 10;
           
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
                            <h3 class="su_sub_menu_name">조회설정</h3>
                            <hr class="hr_line" style="border: 0px; height: 3px; width: 1000px; background-color: #5e7e9b;">
                            
                            <br>
                            <div style="width: 850px; position:relative" >
                                <div class="detailInfo positionab" id="div1" style="display: none;">
                                    
                                            
                                    <div class="close close2"></div>
                                    
                                    
                                    <div  align="left" style="font-size: 25px; font-weight: bold; color: black;">근태내역 수정하기</div>
                                    
                                    <br>
                                    <form>
                                        <table style="width: 100%;" class="tb6" >
                                            <tr>
                                                <th style="padding-top: 20px;">사원명</th>
                                                <td >&nbsp;<input type="text" style="width:100%;" ></td>
                                            </tr>
                                            <tr>
                                                <th style="padding-top: 20px;">변경신청날짜</th>
                                                <td style="padding-bottom: 10px;">&nbsp;<input type="text" style="width:100%;" id="date1"></td>
                                            </tr>
                                            <tr>
                                                <th style="padding-top: 20px;">신청날짜 근태현황</th>
                                                <td style="padding-bottom: 10px;">&nbsp;<input type="text" style="width:100%;"></td>
                                            </tr>
                                            <tr>
                                                <th style="padding-top: 20px;">출근시간변경</th>
                                                <td style="padding-top: 20px;"><input type="date"></td>
                                            </tr>
                                            
                                            <tr>
                                                <th style="padding-top: 20px;">퇴근시간변경</th>
                                                <td style="padding-top: 20px;"><input type="date"></td>
                                            </tr>
                                            <tr>
                                                <th style="padding-top: 10px;">근무상태변경</th>
                                                <td style="padding-bottom: 10px;">&nbsp;
                                                    <div class="checks2">
                                                        <input type="radio" id="radio1" name="grade"> 
                                                        <label for="radio1">정상</label>
                                                        &nbsp;&nbsp;
                                                        <input type="radio" id="radio2" name="grade"> 
                                                        <label for="radio2">무단지각/조퇴</label> 
                                                        &nbsp;&nbsp;
                                                        <input type="radio" id="radio3" name="grade"> 
                                                        <label for="radio3">무단결근</label> 
                                                       
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                        <br>
                                        <div align="center">
                                            <button type="button" class="btn su_btn_two su_btn_all" id="submitBtn" data-toggle="modal" data-target="#noContent" style="width: 180px;">근태조정 신청하기</button>
                                        </div>
                                        
                                    </form>
                                </div>
                                <form action="search.at">
                                <table width="100%" class="tb3">
                                    
                                    <tr>
                                        <th>조회부서</th>
                                        <td>
                                            <select name="deptCode" id="select1" name="select1">
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
                                            	<c:forEach var="j" items="${ jlist }">
                                            		<option value="${ j.jobCode }">${ j.jobName }</option>
                                            	</c:forEach>
                                            </select>

                                        </td>
                                    </tr>
                                    <tr>
                                        <th>기간설정</th>
                                        <td>
                                            <input type="date" id="startDate" name="startDate" value="">&nbsp;~&nbsp;<input type="date" id="endDate" name="endDate" value=""> 
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>이름</th>
                                        <td>
                                            <input type="text" name="keyword" placeholder="이름검색">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>근무상태</th>
                                        <td>
                                            <input type="checkbox" id="cek1" name="check1" style="zoom: 1.5; vertical-align: middle;" checked>
                                            <label for="cek1" style="color:black; font-weight:500 ;">정상</label>
                                            &nbsp;
                                            <input type="checkbox" id="cek2" name="check2" style="zoom: 1.5; vertical-align: middle;" checked>
                                            <label for="cek2" style="color:black; font-weight:500 ;">무단지각/조퇴</label>
                                            &nbsp;
                                            <input type="checkbox" id="cek3" name="check3" style="zoom: 1.5; vertical-align: middle;" checked>
                                            <label for="cek3" style="color:black; font-weight:500 ;">무단결근</label>
                                        </td>
                                    </tr>
                                </table>
                                <br>
                                <div style="width: 1000px;" align="center">
                                    <button type="submit" class="btn su_btn_two su_btn_all" id="submitBtn" data-toggle="modal" data-target="#noContent">조회하기</button>
                                    
                                </div>
                                </form>
                                <script>
                                	$(function(){
                                		var timezoneOffset = new Date().getTimezoneOffset() * 60000;
                                		var kr = new Date(Date.now() - timezoneOffset);
                                		var kr2 = new Date(Date.now() - timezoneOffset);
                                		const lastdate = new Date(kr.setDate(2)).toISOString().substring(0, 10);
                                	    const currentdate = kr2.toISOString().substring(0, 10);
                                	    console.log(new Date(kr.setDate(2)).toISOString())
                                        console.log(currentdate)
                                        console.log(lastdate)
                                        $('#startDate').val(lastdate)
                                        $('#endDate').val(currentdate)
                                	})
                                </script>
                                
                                <br><br>
                                <h3 class="su_sub_menu_name">조회내역</h3>
                                <hr class="hr_line" style="border: 0px; height: 3px; width: 1000px; background-color: #5e7e9b;">
                                <table id="total" width="100%" class="tb4" style="display:''">
                                    <tr>
                                        <th>정상</th>
                                        <th>무단지각 / 무단조퇴</th>
                                        <th>무단결근</th>
                                    </tr>
                                    <tr>
                                        <th>3</th>
                                        <th>3</th>
                                        <th>3</th>
                                    </tr>
                                    
                                </table>
                                <br>
                           		<div id="select" style="display:'';">
                                <table class="tb5" width="100%" style="border-collapse: separate; border-spacing: 0 10px; ">
                                    <tr>
                                        <th>날짜</th>
                                        <th>이름</th>
                                        <th>근무상태</th>
                                        <th>출근시간</th>
                                        <th>퇴근시간</th>
                                    </tr>
                                    <tr>
                                        <td align="center">2022-07-20</td>
                                        <td align="center">xx</td>
                                        <td align="center">xx</td>
                                        <td align="center">08:55</td>
                                        <td align="center">18:00</td>
                                    </tr>
                                    <tr>
                                        <td align="center">2022-07-20</td>
                                        <td align="center">xx</td>
                                        <td align="center">xx</td>
                                        <td align="center">08:55</td>
                                        <td align="center">18:00</td>
                                    </tr>
                                    <tr>
                                        <td align="center">2022-07-20</td>
                                        <td align="center">xx</td>
                                        <td align="center">xx</td>
                                        <td align="center">08:55</td>
                                        <td align="center">18:00</td>
                                    </tr>
                                    <tr>
                                        <td align="center">2022-07-20</td>
                                        <td align="center">xx</td>
                                        <td align="center">xx</td>
                                        <td align="center">08:55</td>
                                        <td align="center">18:00</td>
                                    </tr>
                                    <tr>
                                        <td align="center">2022-07-20</td>
                                        <td align="center">xx</td>
                                        <td align="center">xx</td>
                                        <td align="center">08:55</td>
                                        <td align="center">18:00</td>
                                    </tr>
                                </table>
                            
                            <br>
                            <div style="margin-top: 10px; width: 1000px; height: 40px;" align="center">
                                <span style="width: 40px; height: 40px; background-color: #e6e9ec; display: inline-block; border-radius: 15%; padding-top: 5px;">
                                    &lt;
                                </span>
                                <span style="width: 40px; height: 40px; background-color: #e6e9ec; display: inline-block; border-radius: 15%;padding-top: 5px;">
                                    1
                                </span>
                                <span style="width: 40px; height: 40px; background-color: #e6e9ec; display: inline-block; border-radius: 15%;padding-top: 5px;">
                                    2
                                </span>
                                <span style="width: 40px; height: 40px; background-color: #e6e9ec; display: inline-block; border-radius: 15%;padding-top: 5px;">
                                    3
                                </span>
                                <span style="width: 40px; height: 40px; background-color: #e6e9ec; display: inline-block; border-radius: 15%;padding-top: 5px;">
                                    &gt;
                                </span>
                            </div>
                            </div>
                            
                        </div>
                        

                        <!-- 게시글 영역 -->
                        
                    </div>
                    
                </div> 
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>