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
	
	<div>
	    
	    <div class="su_contentArea">
	        <div class="su_content_header">
	            <h2 class="su_sub_menu_name" style="display: inline; color: black;">상담 내역 수정</h2>
	            
	            <button class="btn su_btn_border" type="button" style="display: inline; float:right;" onclick="location.href='detail.cn?cNo=${c.cnslnNo}';">일정으로</button>
	            <hr class="hr_line_top">
	
	
	            <form id="updateForm" action="update.tcn" method="post" enctype="multipart/form-data">
	            <!-- =================================================================================== -->
	            	<input type="hidden" name="cnslnReal" value="${ loginUser.memNo }">
	            	<input type="hidden" name="cnslnNo" value="${ c.cnslnNo }">
	            	<input type="hidden" name="cnslnWriter" value="${c.cnslnWriter }">
	            	<input type="hidden" name="cnslnStartDate" value="${ c.cnslnStartDate }">
	            	<input type="hidden" name="cnslnEndDate" value="${ c.cnslnEndDate }" >
	            	<input type="hidden" name="cnslnChargeNo" value="${ c.cnslnChargeNo }">
	            	<input type="hidden" name="cnslnChargeList" value="${ c.cnslnChargeList }">
	            	<input type="hidden" name="cnslnPhone" value="${ c.cnslnPhone }">
	            	<input type="hidden" name="studentNo" value="${ c.studentNo }">
	            	<input type="hidden" name="cnslnEc" value="${ c.cnslnEc }">
	            	

	                <div class="su_content_body">
	
	                    <table id="eventForm">
	                        <tr>
	                            <td><span>&nbsp;제목</span></td>
	                            <td>
	                            &ensp; &ensp;<input type="text" name="cnslnTitle" id="cnslnTitle" value="${ c.cnslnTitle }"
	                            placeholder="제목 입력" style="width:300px;" readonly>
	                            </td>
	                        </tr>
	
	                        <tr>
                                <td style="vertical-align: top; width: 10%;">
                                    <span style="display: inline-block; margin-top: 10px;">&nbsp;상담 주제</span>
                                </td>
                                <td style="width: 85%;">
                                &ensp;&ensp;&ensp;<textarea id="cnslnTopic" name="cnslnTopic" readonly>${ c.cnslnTopic }</textarea>
                                </td>
                            </tr>
	
	                    </table>
	
	
	                    <br>
	                    <!-- 서머노트로 내용 작성 -->
	                    <div class="summerArea">
	                    	<span class="fas fa-star-of-life fontRed">&nbsp;</span>
                            <span style="font-size: 19px;">상담 내용</span>
                            <br><br>
                            <textarea id="summernote" name="cnslnContent">${ c.cnslnContent }</textarea>
                        </div>
	
	                    <script>
	                        $('#summernote').summernote({
	                        //   tabsize: 2,
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
	
	
	                    <br><br>
	
	                    <div class="su_btn_two_center">
	                        <button type="button" class="btn su_btn_two su_btn_all" id="submitBtn" data-toggle="modal" data-target="#noContent">수정</button>
	                        <button type="button" class="btn su_btn_two su_btn_border">취소</button>
	                    </div>
	
	                    <!-- 필수사항 입력 안했을 때 모달창 -->
	                    <div class="modal" id="noContent" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                        <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
	                            <!--Content-->
	                            <div class="modal-content modal_alert">
	                                
	                                <!--Body-->
	                                <div class="modal-body text-center modal_alert_child">
	                                    <div style="margin-top: 1.5rem;">
	                    
	                                        <h5 class="mt-1 mb-2" style="color: black;">필수 사항을 입력해주세요.</h5>
	                                        <br>                                
	                                        <div class="text-center mt-4"> 
	                                            <button type="button" class="btn su_btn_all su_btn_medium" data-dismiss="modal">확인</button>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	
	
	
	                    <script>
	                        $(document).ready(function(){
	                            $("#submitBtn").click(function(){
	                            	console.log($("#summernote").val());
	                                // 필수사항의 value가 비어있으면 모달창
	                                if( $("#summernote").val() != null ){
	                                    $("#submitBtn").removeAttr("data-target");
	                                    $("#updateForm").submit();
	                                   //console.log($("textarea[name=promoContent").val());
	                                }
	                            });
	
	                        })
	                    </script>
	                        
	    
	                    </div>
	                </form>
	            </div>
	        </div>
	
	    </div>
	
	
	
	</div> 
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>