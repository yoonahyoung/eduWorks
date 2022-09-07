<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/sumin.css" rel="stylesheet" type="text/css">
<style type="text/css">
	.checks {position: relative;}

        .checks input[type="checkbox"] {  
        position: absolute;
        width: 1px;
        height: 1px;
        padding: 0;
        margin: -1px;
        overflow: hidden;
        clip:rect(0,0,0,0);
        border: 0
        }
        .checks input[type="checkbox"] + label {
        display: inline-block;
        position: relative;
        cursor: pointer;
        
        }
        .checks input[type="checkbox"] + label:before {  
        content: ' ';
        display: inline-block;
        width: 21px; 
        height: 21px;  
        line-height: 21px; 
        margin: -2px 8px 0 0;
        text-align: center; 
        vertical-align: middle;
        background: #fafafa;
        border: 1px solid #cacece;
        border-radius : 3px;
        box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);
        }
        .checks input[type="checkbox"] + label:active:before,
        .checks input[type="checkbox"]:checked + label:active:before {
        box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1);
        }

        .checks input[type="checkbox"]:checked + label:before {  
        content: '\2714';  
        color: #99a1a7;
        text-shadow: 1px 1px #fff;
        background: #e9ecee;
        border-color: #adb8c0;
        box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05), inset 15px 10px -12px rgba(255,255,255,0.1);
        }

        .checks input[type="text"]{
            background: #fafafa;
            border: 1px solid #cacece;
            border-radius : 5px;
            box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);
        }

        #searchbtn{
            
            color: white;
            background-color: #5e7e9b;
            height: 38px;
            width: 50px;
            border: 1px solid #cacece;
            border-radius : 5px;
            box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);
        }
        
        #outbtn{
            
            color: white;
            background-color: #5e7e9b;
            height: 38px;
            width: 50px;
            border: 1px solid #cacece;
            border-radius : 5px;
            box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);
        }
        

        td, th{
            border: 1px solid #858796;
            border-left: none; 
            border-right: none;
            border-top: none; 
            padding: 0 0 5px 0;
        }
</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp" />
		<!--Begin of Main Content -->
                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <nav class="menu-sidebar">
                        <div class="insider">
                            <h4>강사관리</h4>
                            <a href=""><h6>강사조회</h6></a>
                            <a href=""><h6>강사등록</h6></a>
                            
                        </div>
                        
                        <div class="insider">
                            <h4>직원관리</h4>
                            <a href=""><h6>직원조회</h6></a>
                            <a href=""><h6>직원등록</h6></a>
                            <a href=""><h6>신입 OJT</h6></a>
                        </div>
                        <div class="insider">
                            <h4>근태관리</h4>
                            <a href=""><h6>부서별 근태조회</h6></a>
                            <a href=""><h6>조정신청관리</h6></a>
                            <a href=""><h6>연차관리</h6></a>
                        </div>                        
                    </nav>
                   
                    <div class="container-fluid su_contentArea" style="padding-left: 10px;">
                        <div class="su_content_header" style="margin-left: 10px;">
                            <h3 class="su_sub_menu_name">강사조회</h3>
                            <hr class="hr_line" style="border: 0px; height: 3px; width: 1000px; background-color: #5e7e9b;">
                            <br>
                            <div style="width: 1000px; height: 60px;" class="checks" align="right" >
                                <div style="float: right;  height: 70px;">
                                    <button id="searchbtn" style="line-height: 0px; width: 70px;" class="btn su_btn_two su_btn_all">검색</button>
                                 </div>
                                <div style="height: 70px; float: right; padding-top: 3px;">
                                    <input type="checkbox" id="check1" checked> 
                                    <label for="check1" >재직</label>
                                    &nbsp;
                                    <input type="checkbox" id="check2" checked> 
                                    <label for="check2" >퇴사</label>
                                    &nbsp;&nbsp;
                                    <input type="text" style="line-height: 30px; width: 200px;" id="searchclick" placeholder="   검색">
                                    <label for="searchclick"></label>
                                </div>
                            </div>
                            <div style="clear: both; width: 650px; margin-left: 150px;" class="checks">
                                <table width="100%" style="border-collapse: separate; border-spacing: 0 10px; ">
                                    <tr>
                                        <th>
                                            <input type="checkbox" id="c1"> 
                                            <label for="c1" class="tblabel"></label>
                                        </th>
                                        <th>강사명</th>
                                        <th>부서</th>
                                        <th>직급</th>
                                        <th>입사일/퇴사일</th>
                                        <th>상태</th>
                                    </tr>
                                    <tr>
                                        <th>
                                            <input type="checkbox" id="c2"> 
                                            <label for="c2" class="tblabel"></label>
                                        </th>
                                        <td align="center">xxx</td>
                                        <td align="center">xx</td>
                                        <td align="center">xx</td>
                                        <td align="center">2022.09.01</td>
                                        <td align="center">재직</td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <input type="checkbox" id="c3"> 
                                            <label for="c3" class="tblabel"></label>
                                        </th>
                                        <td align="center">xxx</td>
                                        <td align="center">xx</td>
                                        <td align="center">xx</td>
                                        <td align="center">2022.09.01</td>
                                        <td align="center">재직</td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <input type="checkbox" id="c4"> 
                                            <label for="c4" class="tblabel"></label>
                                        </th>
                                        <td align="center">xxx</td>
                                        <td align="center">xx</td>
                                        <td align="center">xx</td>
                                        <td align="center">2022.09.01</td>
                                        <td align="center">재직</td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <input type="checkbox" id="c5"> 
                                            <label for="c5" class="tblabel"></label>
                                        </th>
                                        <td align="center">xxx</td>
                                        <td align="center">xx</td>
                                        <td align="center">xx</td>
                                        <td align="center">2022.09.01</td>
                                        <td align="center">재직</td>
                                    </tr>
                                </table>
                            </div>
                            
                            <div style="width: 650px; margin-left: 140px;">
                                <button id="outbtn" style="line-height: 0px; width: 90px;" class="btn su_btn_two su_btn_all">퇴직처리</button>
                            </div>
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
                        

                        <!-- 게시글 영역 -->
                        
                    </div>
                    
                </div> 
	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>