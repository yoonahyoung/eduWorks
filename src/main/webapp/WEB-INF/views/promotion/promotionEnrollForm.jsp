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
	            <h2 class="su_sub_menu_name" style="display: inline; color: black;">홍보물 등록</h2>
	            
	            <button class="btn su_btn_border" type="button" style="display: inline; float:right;" onclick="location.href='list.pr';">목록으로</button>
	            <hr class="hr_line_top">
	
	
	            <form id="insertForm" action="insert.pr" method="post" enctype="multipart/form-data">
	            	<input type="hidden" name="promoWriter" value="${ loginUser.memNo }">
	                <div class="su_content_body">
	
	                    <table id="eventForm">
	                        <tr>
	                            <td width="30px;"><span class="fas fa-star-of-life fontRed">&nbsp;</span></td>
	                            <td><span>&nbsp;제목</span></td>
	                            <td>
	                            &ensp; &ensp;<input type="text" name="promoTitle" id="promoTitle" placeholder="제목 입력" style="width:300px;" required>
	                            </td>
	                        </tr>
	
	                        <tr>
	                            <td width="5%;"><span class="fas fa-star-of-life fontRed">&nbsp;</span></td>
	                            <td><span>&nbsp;종류</span></td>
	                            <td>
	                                <select style="margin-left: 20px;" name="promoCateNo" id="promoCateNo">
	                                    <option value="1" selected>배너</option>
	                                    <option value="2">블로그</option>
	                                    <option value="3">포스터</option>
	                                    <option value="4">SNS</option>
	                                </select>
	                            </td>
	                        </tr>
	
	                        <tr>
	                            <td></td>
	                            <td><span> 파일 첨부</span></td>
	                            <td><input type="file" id="promoFile" name="upfile" style="margin-left: 20px;"></td>
	                        </tr>
	
	                    </table>
	
	                    <div class="form-group">
	                        <div class="su_dropBox">
	                            <span>&ensp;드래그로 파일을 추가해주세요.</span>
	                        </div>
	                    </div>
	
	                    <br>
	                    <!-- 서머노트로 내용 작성 -->
	                    <div class="summerArea">
	                        <textarea id="summernote" name="promoContent"></textarea>
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
	                        <button type="button" class="btn su_btn_two su_btn_all" id="submitBtn" data-toggle="modal" data-target="#noContent">등록</button>
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
	                                // 필수사항의 value가 비어있으면 모달창
	                                if( !( !$("#promoTitle").val() || !$("#summernote").val() ) ){
	                                    $("#submitBtn").removeAttr("data-target");
	                                    $("#insertForm").submit();
	                                   console.log($("textarea[name=promoContent").val());
	                                }
	                            });
	
	                            // 파일 첨부 div 선택
	                            $(".form-group").click(function(){
	                                $("#promoFile").click();
	                            });
	                            
	                            const $drop = document.querySelector(".su_dropBox");
	                            const $title = document.querySelector(".su_dropBox span");
	                            
	                         	// 드래그한 파일 객체가 해당 영역에 놓였을 때
	                            $drop.ondrop = (e) => {
	                            e.preventDefault();
	                            $drop.className = "su_dropBox";
	                            
	                         	// 파일 리스트
	                            const files = [...e.dataTransfer?.files];
	                        
	                            console.log(files);
	                        
	                            $title.innerHTML = files.map(v => v.name).join("<br>");
	                            }
	                        
	                            // ondragover 이벤트가 없으면 onDrop 이벤트가 실핻되지 않습니다.
	                            $drop.ondragover = (e) => {
	                            e.preventDefault();
	                            }
	                        
	                            // 드래그한 파일이 최초로 진입했을 때
	                            $drop.ondragenter = (e) => {
	                            e.preventDefault();
	                            
	                            $drop.classList.add("active");
	                            }
	                        
	                            // 드래그한 파일이 영역을 벗어났을 때
	                            $drop.ondragleave = (e) => {
	                            e.preventDefault();
	                            
	                            $drop.classList.remove("active");
	                            }
	                            
	                            $("#promoFile").change(function(){
	                            	// 파일 선택됐을 때
	                            	
	                                if($("#promoFile").val() != ""){
	                                	var arr = $("#promoFile").val().split('\\');
	                                	//console.log(arr.length);
	                                	//console.log(arr[arr.length - 1]);
	                                	
	                                	$(".su_dropBox").html("<span>&ensp; " + arr[arr.length - 1] + " </span>");
	                                } else{
	                                	$(".su_dropBox").html("<span>&ensp;파일을 선택해주세요.</span>");
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