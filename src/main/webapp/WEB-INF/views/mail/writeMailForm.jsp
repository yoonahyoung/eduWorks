<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 은영 -->
	<jsp:include page="../common/header.jsp" />

	<!-- 공통요소 모달 -->
	<jsp:include page="commonMailModal.jsp" />

	<!-- 공통요소 사이드 메뉴바(메일만 해당) -->
	<jsp:include page="commonMailMenu.jsp" />

	<!-- 메인 콘텐츠 영역 -->
	<div class="main-content">
		<form method="post" action="insertMail.ma" enctype="multipart/form-data">

			<div class="second-title">
				<div style="font-weight: bold;">메일 작성</div>
				<button type="submit" class="reply-btn" id="sendMail">
					<i class="fas fa-location-arrow"></i>&nbsp;&nbsp;전송
				</button>
				<button type="button" class="sub-btn" onclick="preView();">
					<i class="fas fa-desktop"></i>&nbsp;&nbsp;미리보기
				</button>
				<button type="button" class="sub-btn" id="propertyMail">
					<i class="far fa-save"></i>&nbsp;&nbsp;임시저장
				</button>
				<button type="button" class="sub-btn">
					<i class="fas fa-undo"></i>&nbsp;&nbsp;취소
				</button>
			</div>
			<hr style="margin: 20px 0px 10px 0px;">

			<script>
			
				let openWin;

				function preView() {

					window.name = "insertMail";

					openWin = window.open("mailPreView.html", "mailPreView",
							"width=1000, height=1000, resizalbe=no");

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

					var summernoteContent = $('#summernote').summernote('code'); //썸머노트(설명)
					console.log("summernoteContent : " + summernoteContent);

					$('#summernote').summernote('code', '');

					let $receive = "";
					let $cc = "";
					let $title = "";
					let $file = "";

					$("#receive").change(function() {
						$receive = $(this).val();
						console.log($receive);
					})

					$("#cc").change(function() {
						$cc = $(this).val();
						console.log($cc);
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
				<!-- 보내는 사람 -->
				<input type="hidden" name="memNo" value="${loginUser.memNo }">

				<table>

					<tr>
						<th>받는사람</th>
						<td style="width: 75%;"><input type="text" name="receiverMem"
							class="input-mail" id="receive"></td>
						<td><button type="button" class="address-btn"
								data-toggle="modal" data-target="#findAdd">주소록에서 찾기</button></td>
					</tr>
					<tr>
						<th>참조</th>
						<td colspan="2"><input type="text" name="ccMem"
							class="input-mail" id="cc"></td>
					</tr>
					<tr>
						<th><span>제목</span> <span class="send-check"> <input
								type="checkbox" name="mailType" id="mailType" value="1"><label
								for="mailType">&nbsp;&nbsp;중요!</label>
						</span></th>
						<td colspan="2"><input type="text" name="mailTitle"
							class="input-mail" id="title"></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td colspan="2">
							<button id="btn-upload" type="button">파일 추가</button> 
							<input type="file" name="upfile" class="input-mail" id="upfile"
							onchange="addFile();" multiple>
						</td>
					</tr>

				</table>

				<div class="dropBox file-list">
					<span class="fileMsg">※ 첨부파일은 최대 5개까지 가능합니다.</span>
				</div>

				<div>
					<textarea id="summernote" name="mailContent"></textarea>
				</div>

			</div>

			<script>
			
			
				// 메일 제목 글자수 초과인 경우 
				$(function(){
					$("#title").keyup(function(e){
						let title = $(this).val();
						if(title.length > 50){
							alert("최대 50자까지 입력 가능합니다.");
							$(this).val(title.substring(0,100));
							
							console.log(title.length);
						}
					})
				})

				// '파일 추가' 누를 때 실행하는 함수
				$(function() {
					$('#btn-upload').click(function(e) {
						e.preventDefault();
						$('#upfile').click();
					});
				});

				// 서머노트 에디터
				$('#summernote')
						.summernote(
								{
									//   tabsize: 2,
									height : 550, // 기본 길이
									minHeight : 550,
									maxHeight : 700, // 최대 길이
									toolbar : [
											// 글꼴 설정
											[ 'fontname', [ 'fontname' ] ],
											// 글자 크기 설정
											[ 'fontsize', [ 'fontsize' ] ],
											// 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
											[
													'style',
													[ 'bold', 'italic',
															'underline',
															'strikethrough',
															'clear' ] ],
											// 글자색
											[ 'color', [ 'forecolor', 'color' ] ],
											// 표만들기
											[ 'table', [ 'table' ] ],
											// 글머리 기호, 번호매기기, 문단정렬
											[ 'para',
													[ 'ul', 'ol', 'paragraph' ] ],
											// 줄간격
											[ 'height', [ 'height' ] ],
											// 그림첨부, 링크만들기, 동영상첨부
											// ['insert',['picture','link','video']],
											// 코드보기, 확대해서보기, 도움말
											[
													'view',
													[ 'codeview', 'fullscreen',
															'help' ] ] ],
									// 추가한 글꼴
									fontNames : [ 'Arial', 'Arial Black',
											'Comic Sans MS', 'Courier New',
											'맑은 고딕', '궁서', '굴림체', '굴림', '돋음체',
											'바탕체' ],
									// 추가한 폰트사이즈
									fontSizes : [ '8', '9', '10', '11', '12',
											'14', '16', '18', '20', '22', '24',
											'28', '30', '36', '50', '72' ]
								});

				// ---------------- 첨부 파일 ---------------------

				var fileNo = 0; // 첨부파일 번호
				var filesArr = new Array(); // 다중 첨부파일 들어갈 파일 배열

				/* 첨부파일 추가 */
				function addFile() {
					
					// 안내문 삭제
					$(".fileMsg").remove();
					
					var maxFileCnt = 5; // 첨부파일 최대 개수
					var attFileCnt = document.querySelectorAll('.filebox').length; // 기존 추가된 첨부파일 개수
					var remainFileCnt = maxFileCnt - attFileCnt; // 추가로 첨부가능한 개수
					var files = $('#upfile')[0].files; // 현재 선택된 첨부파일 리스트 FileList

					// 첨부파일 개수 확인
					if (files.length > remainFileCnt) {
						alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.");
						
						fileDataTransfer();
					}else{
						// 파일 배열에 담기
						let currFileArr = Array.from(files); // FileList => Array로 변환
						filesArr = filesArr.concat(currFileArr); // 추가한 fileList에 또 추가할 수 있도록 설정
						
						fileDataTransfer();
					    
					}
					console.log(filesArr);
					renderingFileDiv(); // 추가 및 삭제할 때 마다 호출해서 index번호 초기화
					
				}
				
				/* 첨부파일 목록 html */
				function renderingFileDiv(){
					
					let htmlData = '';
					for(let i=0; i<filesArr.length; i++){
						// i => 삭제할 파일 인덱스 번호
						
						// 목록 추가
						htmlData += '<div id="file' + i + '" class="filebox">';
						htmlData += '   <span class="name">'+ filesArr[i].name + '</span>';
						htmlData += '   <a class="delete" onclick="deleteFile('+ i + 
									');"><i class="far fa-minus-square"></i></a>';
						htmlData += '</div>';
					}
					
					$(".file-list").html(htmlData); // change가 발생할 때마다 목록 초기화한 뒤 넣어짐

				}

				/* 첨부파일 삭제 */
				function deleteFile(fileNo) { // 매개변수 : 첨부된 파일 번호(fileNo, i)
				
					console.log(fileNo);
					
					// class="fileMsg"에 있는 문구 삭제
					document.querySelector("#file" + fileNo).remove();
					
				    filesArr.splice(fileNo, 1);	// 해당되는 index의 파일을 배열에서 제거(1 : 한개만 삭제하겠다 라는 의미)
					
				    fileDataTransfer();

				    renderingFileDiv();
				}
				
				
				/* 첨부파일 담는 배열 */
				function fileDataTransfer(){
					
					const dataTransfer = new DataTransfer();

				    filesArr.forEach(function(file){ 
				    //남은 배열을 dataTransfer로 처리(Array -> FileList)
				    	dataTransfer.items.add(file); 
				    });
				    
				    $('#upfile')[0].files = dataTransfer.files;	//제거 처리된 FileList를 돌려줌
				}
				
			</script>
		</form>
	</div>
</div>
	<jsp:include page="../common/footer.jsp" />

</body>
</html>