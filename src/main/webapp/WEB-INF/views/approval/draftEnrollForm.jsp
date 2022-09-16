<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기안신청서</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
.aprvNew j_btn-lg btn-light{
background-color:white;}
.wrapper h1,h2,tr,td{
color:black;}

</style>
</head>

<jsp:include page="../common/header.jsp" />


	

<!-- css  -->
<link href="${pageContext.request.contextPath}/resources/css/approval.css" rel="stylesheet" type="text/css">



 
    <!-- 폰트어썸 -->
  <script src="https://kit.fontawesome.com/d9c0959348.js" crossorigin="anonymous"></script>

 

<body>
<!--Begin of Main Content -->
	<!-- Begin Page Content -->
	<div class="container-fluid">
		<nav class="menu-sidebar">
			<div class="insider">
				<h2>전자결재</h2>
				<div>
					<button type="button" class="aprvNew j_btn-lg btn-light" id="modal_btn" data-toggle="modal" data-target="#chooseFormType">
					새 결재 진행
					 <i class="fas fa-pencil-alt mt-0" style="margin-left:5px;""></i> 
					</button>
						
				<!-- 결재양식 선택 모달창(enrollFormType)-->
	
<div class="modal_wrap" class="modal hidden">
       <div class="modal" id="chooseFormType">
        <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title" style="font-weight:300"><b>결재하기</b></h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <!-- 해당 버튼 클릭시 모달과 연결해제 -->
            </div>
    
            <!-- Modal body -->
        <form action="" method="post">
            <div class="modal-body" align="center">
            
            
                <input type="hidden" name="" value="">
                
                <div class="setup-tag">

                    <div>검색</div>
                    <input type="text" name="" style="width:100%;">
                    <br>

                    <div class="modalContent">
                        모달창내용
                    </div>

                </div>
                

                <div style="margin:20px;">
                <button type="submit" class="addBtn btn" style="background-color:slategray; color:white; border:none; margin-right:20px;">추가</button>
                <button type="button" data-dismiss="modal" class="modal_close btn" >취소</button>
                </div>

            </div>

        </form>
            
        </div>
        </div>
    </div>
</div>    
    <!--모달창 끝  -->
    
   <!-- 연습모달 -->

    
    <!--js  -->
    <script>
 
  
    
   </script> 
				</div>
			</div>

				<div class="insider">
	               
	                
	                </button>
	                <h4>결재하기</h4>
	                <a href=""><h6>문서</h6></a>
	                <a href=""><h6>결재 대기 문서</h6></a>
	                <a href=""><h6>결재 예정 문서</h6></a>
	            </div>
	            
	            <div class="insider">
	                <h4>개인문서함</h4>
	                <a href=""><h6>기안 문서함</h6></a>
	                <a href=""><h6>임시 저장함</h6></a>
	                <a href=""><h6>결재 문서함</h6></a>
	            </div>
	 	 </nav>

<!-- main content area -->
	<div class="main-content">
		<form method="post" action="insertLeave.ap" enctype="multipart/form-data">
		 <div id="upper-btns">

        <button type="button" class="btn-sm" id="btn_w">결재요청</button>
        <button type="button"  class="btn-sm" id="btn_w" >임시저장</button>
        <button type="button"  class="btn-sm" id="btn_w" >취소</button>
        <button type="button"  class="btn-sm" id="btn_w" >결재정보</button>
    </div>
<div class="wrapper">

                                <h1>기안신청서</h1>
                                <!--  style="font-size:25px;" -->

                    <div class="top-part" class="boxone">
                        <!-- 문서정보부분 -->
                        <div class="top" id="left-top">
                        <table class="table_m">
                                <tr>
                                    <th>기안자</th>
                                    <td>%김지연%</td>
                                </tr>
                                <tr>
                                    <th>소속</th>
                                    <td>%영업팀%</td>
                                </tr>
                                <tr>
                                    <th>기안일</th>
                                    <td>%2022-09-06(화)%</td>
                                </tr>
                                <tr>
                                    <th>문서번호</th>
                                    <td>%</td>
                                </tr>
                        </table>
                        </div>


                        <!-- 결재선 부분 -->
                        <div class="top" id="right-top">
                            <table class="table_m">
                                <tr>
                                    <th rowspan="3">신청</th>
                                    <td>%부장%</td>
                                </tr>
                                <tr>
                                    <td>
                                        <br>
                                        %(도장이미지)%
                                        <br>
                                    <br>
                                    
                                     %김지연%   
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td>
                                     %날짜구간%
                                    </td>
                                </tr>
                            </table>

                        </div>
                    </div>
                    <!-- top part 끝 -->

                    <br>
                    <br>

                    <!-- 중간 메인테이블 -->
                    <div class="middle-part1" class="boxone">
                        <table class="table_m" id="main-table">
                            <tr>
                                <th height="15%">제목</th>
                                <td>%제목입니다%</td>
                            </tr>

                          

                            <tr>
                             <th width="15%" height="15%">시행일자</th>
                             <td width="80px;">
                                <input type=date>
                                &nbsp; ~ &nbsp;
                                <input type=date>
                                &nbsp;&nbsp;
                                선택일수 : <input type="text" name="" id="" style="width:40px"> 
                            </td>
                             
                            
                            </tr>
                            
                              <tr>
                                <th height="15%">협조부서</th>
                                <td>%협조부서입니다%</td>
                            </tr>

                          
                             

                           

                        </table>
                        
                      <!-- 서머노트로 내용 작성 -->
                      <div>
                        <div class="summerArea">
                            <textarea id="summernote" name="boardContent" style=" margin-left:auto;
                              margin-right:auto;"></textarea>
                        </div>
						</div>
                        <script>
                            $('#summernote').summernote({
                            //   tabsize: 2,
                           	  width:600,
                              height: 550, // 기본 길이
                              minHeight: 550,
                              maxHeight:700, // 최대 길이
                             
                              toolbar: [
                                    // 글꼴 설정
                                    ['fontname', ['fontname']],
                                    // 글자 크기 설정
                                    ['fontsize', ['fontsize']],
                                    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
                                    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                                    // 글자색
                                    ['color', ['forecolor','color']],
                                    // 표만들기
                                    ['table', ['table']],
                                    // 글머리 기호, 번호매기기, 문단정렬
                                    ['para', ['ul', 'ol', 'paragraph']],
                                    // 줄간격
                                    ['height', ['height']],
                                    // 그림첨부, 링크만들기, 동영상첨부
                                    // ['insert',['picture','link','video']],
                                    // 코드보기, 확대해서보기, 도움말
                                    ['view', ['codeview','fullscreen', 'help']]
                                  ],
                                  // 추가한 글꼴
                                fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
                                 // 추가한 폰트사이즈
                                fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
                            });
						</script>   

                    </div>

                    <!-- 파일 및 관련문서 첨부 -->

                    <br>
                    <div class="boxone"  style="margin:40px 80px;">
                        <table id="file-attach-box">
                            <tr  style="border-top:none;">
                                <td>파일첨부</td>
                                <td>
                                    <div>
                                        <span><i class="fas fa-paperclip"></i>이 곳에 파일을 드래그 하세요. 또는 <a  href="">파일선택</a></span>
                                </div></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="margin-top:20px;">관련 문서</td>
                                <td><button type="button" class="btn-sm" id="btn_w">문서검색</button></td>
                            </tr>
                        </table>
                      
                    </div>
</div>
</form>
</div>
</body>
</html>