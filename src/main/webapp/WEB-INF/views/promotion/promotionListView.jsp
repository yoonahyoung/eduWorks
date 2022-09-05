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

	<jsp:include page="../common/header.jsp">
	
	<div style="display: flex" class="su_content_body">

	    <div class="container-fluid su_contentArea">
	        <div class="su_content_header">
	            <h2 class="su_sub_menu_name">홍보물 관리</h2>
	
	            <br><br><br><br><br>
	
	            <div style="text-align: center;">
	                <input type="text" style="width: 300px;" name="suKeyword" placeholder="제목 입력">
	                <button type="button" class="su_btn_border btn-sm su_btn_search">검색</button>
	            </div>
	
	            <div class="su_content_body">
	
	                <div class="selectOption su_btn_area" align="right">
	                    <select style="width: 150px;">
	                        <option value="">전체</option>
	                        <option value="">배너</option>
	                        <option value="">블로그</option>
	                        <option value="">포스터</option>
	                        <option value="">SNS</option>
	                    </select>
	                </div>
	
	                <div class="main_width su_table_pad">
	                    <table class="board-content table su_table_hover" id="suTable" align="center">
	                        <thead>
	                            <tr class="table_thead_border">
	                                <th width="5%;"><input type="checkbox" name="selectAll"></th>
	                                <th width="5%;">번호</th>
	                                <th width="15%;">종류</th>
	                                <th>제목</th>
	                                <th width="15%;">작성자</th>
	                                <th width="15%;">등록일</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                            <!-- 값은 다 DB와 연결될 것 -->
	                            <tr>
	                                <td width="5%"><input type="checkbox" name="deleteList"></td>
	                                <td>3</td>
	                                <td>SNS</td>
	                                <td>9월 할인 이벤트</td>
	                                <td>한유리 대리</td>
	                                <td>2022-08-19</td>
	                            </tr>
	                            <tr>
	                                <td width="5%"><input type="checkbox" name="deleteList"></td>
	                                <td>3</td>
	                                <td>SNS</td>
	                                <td>9월 할인 이벤트</td>
	                                <td>한유리 대리</td>
	                                <td>2022-08-19</td>
	                            </tr><tr>
	                                <td width="5%"><input type="checkbox" name="deleteList"></td>
	                                <td>3</td>
	                                <td>SNS</td>
	                                <td>9월 할인 이벤트</td>
	                                <td>한유리 대리</td>
	                                <td>2022-08-19</td>
	                            </tr>
	                            
	
	
	
	                        </tbody>
	                    </table>
	
	                    <script>
	
	                        $(document).ready(function(){
	                            $("input[name='selectAll']").click(function(){
	                                // 전체 선택 체크박스 체크시 두개의 체크박스가 체크되고
	                                if( $("input[name='selectAll']").is(":checked") ){
	                                    $("input[name='deleteList']").prop("checked", true);
	                                } else{	// 전체 선택 체크박스 해제시 두개의 체크박스 체크가 해제된다.
	                                    $("input[name='deleteList']").prop("checked", false);
	                                }
	                            });
	                            
	                            $("input[name='deleteList']").click(function(){
	                                var count = $("input[name='deleteList']").length;
	                                var checked = $("input[name='deleteList']:checked").length;
	                                
	                                // 체크한 체크박스의 개수와 전체 체크박스 개수가 같으면 전체 선택 체크박스가 체크된다.
	                                if(count != checked){
	                                    $("input[name='selectAll']").prop("checked", false);
	                                } else{
	                                    $("input[name='selectAll']").prop("checked", true);
	                                }
	                                
	                            });
	                        });
	                    
	                    </script>
	
	
	
	                    <br><br><br>
	                    
	                </div>
	
	                <div class="su_btn_two_area">
	                    <button type="button" class="btn su_btn_all" id="delPromoBtn" data-toggle="modal" data-target="#nocheck">삭제 &nbsp;<span class="fas fa-trash"></span></button>
	                    <button type="button" class="btn su_btn_all">글쓰기</button>
	                </div>
	                
	                 <!-- 삭제 모달창 -->
	                 <div class="modal" id="deletePromo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                    <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
	                        <!--Content-->
	                        <div class="modal-content modal_alert">
	                            
	                            <!--Body-->
	                            <div class="modal-body text-center modal_alert_child">
	                                <div>
	                
	                                    <h5 class="mt-1 mb-2">정말 삭제하시겠습니까?</h5>
	                                    <br>                                
	                                    <div class="text-center mt-4"> 
	                                        <button type="button" id="realDelete" class="btn su_btn_all su_btn_medium">확인</button>
	                                        <button type="button" id="next" class="btn su_btn_border su_btn_medium" data-dismiss="modal">취소</button>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	
	                <!-- ==================================== 삭제 완료 후 alert창 출력하기==================================================== -->
	                
	                <!-- 체크 안했을 때 -->
	                <div class="modal" id="nocheck" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                    <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
	                        <!--Content-->
	                        <div class="modal-content modal_alert">
	                            
	                            <!--Body-->
	                            <div class="modal-body text-center modal_alert_child">
	                                <div>
	                
	                                    <h5 class="mt-1 mb-2">삭제할 게시글을 선택해주세요.</h5>
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
	                    $(function(){
	                        // 홍보물 삭제
	                        var checkCnt = "";
	                        
	                        $("input:checkbox").change(function(){
	                            checkCnt = "";
	                            $("input:checkbox[name=deleteList]:checked").each(function(){
	                                checkCnt += ($(this).val()) + ","; // 체크된 것만 게시글번호 뽑기 "2,3,4,"
	                            })
	                            
	                            checkCnt = checkCnt.substring(0,checkCnt.lastIndexOf(",")); // 맨 뒤 콤마 삭제 "2,3,4"
	                            console.log(checkCnt);
	                            
	                            // 선택된 체크박스 없이 삭제 버튼 누른 경우
	                            if(checkCnt == ''){
	                                $("#delPromoBtn").attr("data-target", "#nocheck");
	                            }
	
	                            else {
	                                $("#delPromoBtn").attr("data-target", "#deletePromo");
	                            }
	                        });
	
	                        // 모달에서 삭제 확인 클릭시 DB에서 삭제
	                        // $("#realDelete").click(function(){
	                            
	                        //     $.ajax({
	                        //         url:, 
	                        //         data:{"checkCnt":checkCnt},
	                        //         success:function(result){
	                        //             if(result > 0){
	                        //                 location.reload();
	                        //             } else{
	                        //                 alert("회원 삭제에 실패하였습니다.");
	                        //             }
	                        //         },
	                        //         error:function(){
	                        //             console.log("ajax 게시글 삭제 실패")
	                        //         }
	                        //     });
	                        // });
	
	                    })
	                </script>
	
	                <br><br>
	
	                
	                <!-- 페이징 영역 -->
	                <div style="margin:30px 0 30px 0">
	                    <nav aria-label="Page navigation example">
	                        <ul class="pagination justify-content-center">
	                            <li class="page-item">
	                                <a class="page-link su_page_btn su_prenext" href="#" aria-label="Previous">
	                                <span aria-hidden="true">&laquo;</span>
	                                </a>
	                            </li>
	                            <li class="page-item"><a class="page-link su_page_btn" href="#">1</a></li>
	                            <li class="page-item"><a class="page-link su_page_btn" href="#">2</a></li>
	                            <li class="page-item"><a class="page-link su_page_btn" href="#">3</a></li>
	                            <li class="page-item">
	                                <a class="page-link su_page_btn su_prenext" href="#" aria-label="Next">
	                                <span aria-hidden="true">&raquo;</span>
	                                </a>
	                            </li>
	                        </ul>
	                    </nav>
	                </div>
	
	            </div>
	        </div>
	    </div>
	
	</div>
	
	

</body>
</html>