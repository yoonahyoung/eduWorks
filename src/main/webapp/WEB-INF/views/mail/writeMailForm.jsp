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

	<!-- 공통요소 사이드 메뉴바(메일만 해당) -->
	<jsp:include page="commonMailMenu.jsp" />

	<!-- 메인 콘텐츠 영역 -->
	<div class="main-content">
		<form method="post" action="insertMail.ma" id="mailForm" enctype="multipart/form-data">

			<div class="second-title">
				<div style="font-weight: bold;">메일 작성</div>
				<button type="button" class="reply-btn" onclick="return sendMail()">
					<i class="fas fa-location-arrow"></i>&nbsp;&nbsp;전송
				</button>
				<button type="button" class="sub-btn" data-toggle="modal" id="preview"
						data-target="#mail-preview">
					<i class="fas fa-desktop"></i>&nbsp;&nbsp;미리보기
				</button>
				<!-- 
				<button type="button" class="sub-btn" id="propertyMail">
					<i class="far fa-save"></i>&nbsp;&nbsp;임시저장
				</button>
				 -->
				<button type="button" class="sub-btn" onclick="history.go(-1);">
					<i class="fas fa-undo"></i>&nbsp;&nbsp;취소
				</button>
			</div>
			<hr style="margin: 20px 0px 10px 0px;">

			<script>
				
				
				// 메일 '전송'시 실행하는 함수
				function sendMail() {
					if ($("#receive").val() == "") {
						// 받는 사람 주소 없는 경우
						alert("받는 사람 주소를 입력해 주세요.");
					} else {
						if ($("#title").val() == "") {
							// 메일 제목이 없는 경우
							let answer = confirm("제목이 지정되지 않았습니다. 제목 없이 메일을 보내시겠습니까?");
							if (answer) {
								$("#mailForm").submit(); // 메일 전송
							} else {
								$("#title").focus();
								return false; // 메일 전송 안됨
							}
						}
						// 제목이 입력된 경우
						// 메일 전송
						$("#mailForm").submit();
					}
				}
				
				// 메일 '임시저장'시 실행하는 함수
				/*
				$(function(){
					$("#propertyMail").click(function(){
						$.ajax({
							url :"insertTemporaryMail.ma",
							data : {
								memNo : ${loginUser.memNo},
								receiverMem : $("#receive").val(),
								ccMem : $("#cc").val(),
								mailType : $("#mailType").val(),
								mailTitle : $("#title").val(),
								upfile : $("#upfile").val(),
								mailContent : $("#summernote").val()
							},
							success : function(result){
								console.log("임시저장 성공");
							},
							error : function(){
								console.log("임시저장 실패");
							}
						})
					})
				})
				*/
				
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
								onclick="publicAdd();" data-toggle="modal"
								data-target="#findAdd">주소록에서 찾기
							</button>
						</td>
					</tr>
					<tr>
						<th>참조</th>
						<td colspan="2">
							<input type="text" name="ccMem" id="cc" class="input-mail" id="cc">
						</td>
					</tr>
					<tr>
						<th><span>제목</span> <span class="send-check"> 
							<input type="checkbox" name="mailType" id="mailType" value="1">
							<label for="mailType">&nbsp;&nbsp;중요!</label>
							</span>
						</th>
						<td colspan="2">
							<input type="text" name="mailTitle" class="input-mail" id="title">
						</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td colspan="2">
							<button id="btn-upload" type="button">파일 추가</button> 
							<input type="file" name="upfile" class="input-mail" id="upfile" onchange="addFile();" multiple>
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
	
	<!-- =================== 메일 미리보기 모달 ======================= -->
	<div class="modal" id="mail-preview">
		<div class="modal-dialog modal-lg">
			<div class="modal-content" style="height: 830px">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">
						<b>미리보기</b>
					</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					
				</div>

				<!-- Modal body -->
				<form action="updateIndivAdd.ad" method="post">

					<div class="modal-body" align="center">

					<div class="form-group">
						<div class="send-title">
							<span>받는사람 <span class="border-line">:</span></span>
						</div>
						<div class="receive-person"></div>
					</div>
					
					<div class="form-group">
						<div class="send-title">
							<span>참조 <span class="border-line">:</span></span>
						</div>
						<div class="cc-person"></div>
					</div>
					
					<div class="form-group">
						<div class="send-title">
							<span>제목 <span class="border-line">:</span></span>
						</div>
						<div class="title"></div>
					</div>
					
					<div class="form-group">
						<div class="send-title">
							<span>첨부파일 <span class="border-line">:</span></span>
						</div>
						<div class="file-name"></div>
					</div>
					
					<div>
						<p id="preview-form" readonly>

						</p>
					</div>

						<div style="margin-top: 10px;">
							<!-- 
							<button type="submit" class="addBtn"
								style="background-color: slategray; color: white; border: none;">전송</button>
							 -->
							<button type="button" data-dismiss="modal" class="class addBtn">닫기</button>
						</div>

					</div>
				</form>

			</div>
		</div>
	</div>


	<!-- =================== 주소록에서 찾기 모달 ======================= -->

	<div class="modal" id="findAdd">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content" style="height: 800px">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">
						<b>주소록에서 찾기</b>
					</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<!-- 해당 버튼 클릭시 모달과 연결해제 -->
				</div>

				<!-- Modal body -->

					<div class="modal-body" align="center">

						<input type="hidden" name="memNo" value="${loginUser.memNo }">

						<div class="address-tag">

							<span onclick="publicAdd();">공용 주소록</span> 
							<span onclick="indivAdd();">개인 주소록</span>

						</div>
						<div class="add-choice">
							<div class="add-title">
								
							</div>
							<div class="add-person">
								<div>
									<input type="text" name="" placeholder="이름, 이메일, 회사 입력해서 찾기">
								</div>

								<div id="table-container">
									<table id="add-table" class="addArea">

										<thead>
											<tr>
												<th class="checkbox">
												<input type="checkbox" name="addNo" onclick="allCheck(this);">
												</th>
												<th><span>이름</span></th>
												<th><span>부서</span></th>
												<th><span>직위</span></th>
												<th><span>이메일</span></th>
											</tr>
										</thead>

										<tbody>

										</tbody>
									</table>
								</div>
							</div>
						</div>

						<div>
							<button type="button" class="addBtn" onclick="addMail();" data-dismiss="modal"
								style="background-color: slategray; color: white; border: none;">추가</button>
							<button type="button" data-dismiss="modal" class="addBtn">취소</button>
						</div>

					</div>

			</div>
		</div>
	</div>
		
	<script>
	
		  // '전체클릭'버튼 클릭시 실행하는 함수
		  function allCheck(allCheck){
			 
			 let checkboxes = document.getElementsByName("addNo");
			  
	         checkboxes.forEach((checkbox)=>{
	      	   
	            checkbox.checked = allCheck.checked; // 전체 클릭 클릭시 => 항목 전체 선택 실행
	  	            
	         });
	      }
		  
			
		 // 주소록에서 이메일 추가시 실행하는 함수
		function addMail(){
			 
			checkCnt = "";

			$("input[name='addNo']:checked").each(function(){
				checkCnt += ( $(this).parent().siblings(".email").text() ) + ",";
			});
			
			checkCnt = checkCnt.substring(0,checkCnt.lastIndexOf(",")); // 맨 뒤 콤마 삭제 "2,3,4"
			
			$("#receive").val(checkCnt);
			
		}
		
		$(document).on("change", "input[name=addNo]", function(){
			addMail();
			console.log( $("#receive").val() );
			
		})
			
		// '주소록 찾기' 클릭시 실행하는 함수(전사 주소록)
		function publicAdd() {
			$.ajax({
				url : "publicMailAddress.ad",
				success : function(address) {

					let value = "";
					for (let i = 0; i < address.length; i++) {
						value += "<tr>" 
									+ "<td class='checkbox'>"
									// + "<input type='checkbox' name='addNo' onchange=" + "addMail" + "('" + address[i].memEmail + "');" + ">"
									+ "<input type='checkbox' name='addNo' >"
									+ "</td>" 
									+ "<td>" + address[i].memName + "</td>" 
									+ "<td>" + address[i].deptCode + "</td>" 
									+ "<td>" + address[i].jobCode + "</td>" 
									+ "<td class='email'>" + address[i].memEmail + "</td>" 
							  + "</tr>";
					}

					let category = "<p>전사 주소록</p>";

					$(".add-title").html(category);
					$(".addArea tbody").html(value);

				},
				error : function() {
					console.log("주소록 찾기 실패");
				}
			})
		}

		// '주소록 찾기' 클릭시 실행하는 함수(개인 기본 주소록)
		function indivAdd() {
			$.ajax({
				url : "indivMailAddress.ad",
				data : {
					memNo : ${loginUser.memNo}
				},
				success : function(address){
					
					let value = "";
					if(address.iAdd.length == 0){
						value += "<tr>"
									+ "<td>" + "</td>" 
									+ "<td>" + "</td>"
									+ "<td>" + "</td>"
									+ "<td>" + "</td>" 
									+ "<td style='width:100%;'>" +"</td>"
							  + "</tr>";
					} else {
						
						for (let i = 0; i < address.iAdd.length; i++) {
							value += "<tr>" + "<td class='checkbox'>"
										+ "<input type='checkbox' name='addNo'>" + "</td>" 
										+ "<td>" + address.iAdd[i].addName + "</td>" 
										+ "<td>" + address.iAdd[i].addDept + "</td>" 
										+ "<td>" + address.iAdd[i].addJob + "</td>" 
										+ "<td style='width:100%;'>" + address.iAdd[i].addEmail + "</td>" 
								  + "</tr>";
						}
					}
					
					let category = "";
					for(let i = 0; i < address.c.length; i++){
						category += "<p onclick='indivCategory(" + address.c[i].addNo + ");'>" 
										+ address.c[i].addName
								 + "</p>";
					}
					
					$(".add-title").html(category);
					$(".addArea tbody").html(value);
				},
				error : function(){
					console.log("개인 주소록 찾기 실패");
				}
			})

		}

		// '주소록 찾기' 클릭시 실행하는 함수(개인 카테고리 주소록)
		function indivCategory(num){
			
		 	$.ajax({
		 		url : "indivMailAddressGroup.ad",
		 		data : {
		 			memNo : ${loginUser.memNo},
		 			addNo : num
		 		},
		 		success : function(address){
		 			
					let value = "";
					
					if(address.iAdd.length == 0){
						value += "<tr>"
									+ "<td>" +"</td>" 
									+ "<td>" + "</td>"
									+ "<td>" +"</td>"
									+ "<td>" + "</td>" 
									+ "<td style='width:100%;'>" +"</td>"
							  + "</tr>";
					} else {
						
						for (let i = 0; i < address.iAdd.length; i++) {
							value += "<tr>" + "<td class='checkbox'>"
										+ "<input type='checkbox' name='addCheck'>" + "</td>" 
										+ "<td>" + address.iAdd[i].addName + "</td>" 
										+ "<td>" + address.iAdd[i].addDept + "</td>" 
										+ "<td>" + address.iAdd[i].addJob + "</td>" 
										+ "<td style='width:100%;'>" + address.iAdd[i].addEmail + "</td>" 
								  + "</tr>";
						}
					}
	
					let category = "";
					for(let i = 0; i < address.c.length; i++){
						category += "<p onclick='indivCategory(" + address.c[i].addNo + ");'>" 
										+ address.c[i].addName
								 + "</p>";
					}
					
					$(".add-title").html(category);
					$(".addArea tbody").html(value);

		 		},
		 		error : function(){
		 			console.log("개인 주소록 그룹 찾기 실패");
		 		}
		 	})
			
		}

		// 메일 '미리보기'클릭시 실행하는 함수
		$("#preview").click(
				function() {

					let file = $('#upfile')[0].files.length;

					$(".receive-person").html($("#receive").val());
					$(".cc-person").html($("#cc").val());
					$(".title").html($("#title").val());
					$("#preview-form").html($("#summernote").val());
					if (file > 0) {
						// 첨부파일이 있는 경우
						$(".file-name").html(
								"<i class='icon fas fa-paperclip'></i>일반 첨부파일 "
										+ file + "개");
					} else {
						// 첨부파일이 없는 경우
						$(".file-name").html("첨부파일이 없습니다.");
					}

				})
	</script>
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>