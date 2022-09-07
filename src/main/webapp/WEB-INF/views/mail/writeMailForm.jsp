<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- css -->
	<link href="${pageContext.request.contextPath}/resources/css/insertMailForm.css" rel="stylesheet" type="text/css">
	
	
</head>
<body>
	
	<!-- 은영 -->
	<jsp:include page="../common/header.jsp" />
	
	<!-- 공통요소 모달 -->
	<jsp:include page="commonMailModal.jsp" />
	
	           <!--Begin of Main Content -->
                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <nav class="menu-sidebar">
                        <div class="insider">
                            <h2>메일</h2>
                            <div>
                                <button type="button" class="writeForm key_btn-lg" onclick="location.href='writeMailForm.ma'">메일 작성</button>
                                <button type="button" class="writeForm key_btn-lg" onclick="">나에게 작성</button>
                            </div>
                        </div>
                        
                        <div class="insider">
                            <h4>태그</h4>
                             <!-- 태그 추가시 생성 -->

                             <!-- 반복문 사용 -->
                             <div class="tag-title">
                                <a href=""><h6><i class="fas fa-bookmark" style="color:red;"></i>&nbsp;&nbsp;중요자료</h6> </a>
                                    <a class="tag-modify" href="#" id="dotDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" 
                                    aria-expanded="false">
                                    <i class="fas fa-ellipsis-v"></i>
                                    </a>
                                <div class="dropdown-list dropdown-menu shadow" aria-labelledby="dotDropdown" style="margin-left:-180px; margin-top: -10px;">
                                    <!-- 작성자에게만 보임 -->
                                    <a class="dropdown-item d-flex align-items-center" href="#" data-toggle="modal" data-target="#updateTags">
                                        <span class="font-weight-bold">수정하기</span>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" onclick="deleteTags();">
                                        <span class="font-weight-bold">삭제하기</span>
                                    </a>
                                </div>
                            </div>
                            
                             <!-- 반복문 사용 -->
                             <div class="tag-title">
                                <a href=""><h6><i class="fas fa-bookmark" style="color:gold;"></i>&nbsp;&nbsp;회의자료</h6> </a>
                                    <a class="tag-modify" href="#" id="dotDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" 
                                    aria-expanded="false">
                                    <i class="fas fa-ellipsis-v"></i>
                                    </a>
                                <div class="dropdown-list dropdown-menu shadow" aria-labelledby="dotDropdown" style="margin-left:-180px; margin-top: -10px;">
                                    <!-- 작성자에게만 보임 -->
                                    <a class="dropdown-item d-flex align-items-center" href="#" data-toggle="modal" data-target="#updateTags">
                                        <span class="font-weight-bold">수정하기</span>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" onclick="deleteTags();">
                                        <span class="font-weight-bold">삭제하기</span>
                                    </a>
                                </div>
                            </div>
                            
                            <div id="plus-tag" data-toggle="modal" data-target="#addTags">+ 태그추가</div>
                        </div>

                        <div class="insider">
                            <h4>메일함</h4>
                            <a href=""><h6>보낸메일</h6></a>
                            <a href=""><h6>받은메일</h6></a>
                            <a href=""><h6>내게쓴메일</h6></a>
                            <a href=""><h6>임시보관함</h6></a>
                            <a href="" style="display:inline-block;"><h6>휴지통</h6></a>
                            <button type="button" id="empty" onclick="emptyMail();">비우기</button>
                        </div>     
                        
                        <div class="insider">
                            <h4>빠른 검색</h4>
                            <a href=""><h6>중요메일함</h6></a>
                            <a href=""><h6>읽은메일함</h6></a>
                            <a href=""><h6>안읽은메일함</h6></a>
                            <a href=""><h6>스팸메일함</h6></a>
                        </div>   
                        
                        <div class="insider">
                            <a class="setup"><i class="fas fa-cog" style="color:gray; margin-right:10px"></i>메일 환경설정</a> 
                        </div>
                    </nav>
                     
                    <script>

                        // '태그 삭제'클릭시 실행하는 함수
                        function deleteTags(){
                            confirm("태그를 삭제하시겠습니까?");

                            // if(ok){
                            //     태그 삭제;
                            // }

                        }

                        // '비우기' 클릭시 실행하는 함수
                        function emptyMail(){
                            confirm("휴지통을 비우시면 지워진 메일(중요메일 포함)들은 복구할 수 없습니다.\n\n휴지통을 비우시겠습니까?");

                            // if(true){
                            //     휴지통 비우기
                            // }
                        }

                    </script>

                    <!-- CONTENT영역 여기 작성해 주세요!! -->
                    
               
              <div class="main-content">
                 <form method="post" action="insert.mail">
               
                        <div class="second-title">
                            <div style="font-weight: bold;">메일 작성</div>
                            <button type="submit" class="reply-btn"><i class="fas fa-location-arrow"></i>&nbsp;&nbsp;전송</button>
                            <button type="button" class="sub-btn" onclick="preView();"><i class="fas fa-desktop"></i>&nbsp;&nbsp;미리보기</button>
                            <button type="button" class="sub-btn"><i class="far fa-save"></i>&nbsp;&nbsp;임시저장</button>
                            <button type="button" class="sub-btn"><i class="fas fa-undo"></i>&nbsp;&nbsp;취소</button>
                        </div>
                        <hr style="margin:20px 0px 10px 0px;">

                        <script>

                           let openWin;

                           function preView(){

                            window.name="insertMail";

                            openWin = window.open("mailPreView.html",
                                "mailPreView", "width=1000, height=1000, resizalbe=no");

                           }

                        //    function setChildText(){

                        //     let p = document.getElementById("pInput").value;
                        //     console.log(p);   

                        //     openWin.document.getElementById("cInput").value = document.getElementById("pInput").value;
                        //     }
                        
                        // $(function() {
                            //     selectPreView();
                            // })
                            
                            //   function selectPreView(){
                                //     let receive;
                                //     $("#receive").change(function(){
                                    //         receive = $(this).val();
                                    //     })
                                    
                                    
                                    //     let $cc = $("#cc").val();
                                    //     let $title = $("#title").val();
                                    
                                    //     console.log(receive);
                                    //     console.log($cc);
                                    //     console.log($title);
                                    //   }
                                    
                          $(function() {
                            
                            let content = $('input[name=contents]').val();
                            console.log(content);

                            let title = $('input[name=title]').val();
                            console.log(title);

                            var summernoteContent = $('#summernote').summernote('code');        //썸머노트(설명)
                            console.log("summernoteContent : " + summernoteContent);

                            $('#summernote').summernote('code', '');
                            

                            let $receive = "";
                            let $cc = "";
                            let $title = "";
                            let $file = "";                            

                            $("#receive").change(function() {
                                $receive = $(this).val();
                                console.log( $receive );
                            })

                            $("#cc").change(function(){
                                $cc = $(this).val();
                                console.log( $cc );
                            })

                            // $("#title").change(function() {
                            //     $title = $(this).val();
                            //     console.log( $title );
                            // })

                            $("#file").change(function() {
                                $file = $(this).val();
                            })
                            
                        });

                        </script>

                        <div class="send-form" id="mailForm">

                            
                                <table>

                                    <tr>
                                        <th>받는사람</th>
                                        <td style="width:75%;"><input type="text" name="" class="input-mail" id="receive">
                                        </td>
                                        <td><button type="button" class="address-btn" data-toggle="modal" data-target="#findAdd">주소록에서 찾기</button></td>
                                    </tr>
                                    <tr>
                                        <th>참조</th>
                                        <td colspan="2"> <input type="text" name="" class="input-mail" id="cc"> </td>
                                    </tr>
                                    <tr>
                                        <th><span>제목</span>
                                            <span class="send-check">
                                                <input type="checkbox" name="mailTitle"><label for="mailTitle">&nbsp;&nbsp;중요!</label>
                                            </span>
                                        </th>
                                        <td colspan="2"><input type="text" name="title" class="input-mail" id="title"></td>
                                    </tr>
                                    <tr>
                                        <th>첨부파일</th>
                                        <td colspan="2"> <input type="file" name="" id="file" class="input-mail" > </td>
                                    </tr>
                                    <tr>
                                        <th colspan="3">
                                            <div class="dropBox">
                                                <span>드래그로 파일을 추가해주세요.</span>
                                            </div>
                                        </th>
                                    </tr>

                                </table>

                                <div>
                                    <textarea id="summernote" name="contents"></textarea>
                                </div>

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
                        
                            // ---------------- 첨부 파일 ---------------------
                            $(function() {
                                $(".dropBox").click(function() {
                                     $("input type=[file]").click();
                                })
                            })

                            const $drop = document.querySelector(".dropBox");
                            const $title = document.querySelector(".dropBox span");
                        
                            // 드래그한 파일 객체가 해당 영역에 놓였을 때
                            $drop.ondrop = (e) => {
                            e.preventDefault();
                            $drop.className = "dropBox";
                            
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
                          </script>
                      </form>
                    </div>

                </div>
                

	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>