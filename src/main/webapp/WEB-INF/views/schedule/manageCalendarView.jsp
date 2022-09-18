<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css -->
<link href="${pageContext.request.contextPath}/resources/css/schedule.css" rel="stylesheet" type="text/css">

</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
	<div style="display:flex;">
	
	    <!-- sub menu -->
	    <div class="container-fluid su_content_body su_sub_menu_div" style="width: 15%;">
	        <nav class="menu-sidebar" style="width: 100%;">
	            <div class="insider">
	                <h4 style="color: black;">캘린더</h4>
	                
	                <div class="su_btn_center">
	                    <button type="button" id="enrollBtn" class="btn btn-lg su_btn_border" style="width: 80%;">일정 등록</button>
	                </div>
	                <br>
	
	
	                <!-- 서브메뉴 내 캘린더 -->
	                <ul class="accordion" id="accordionSidebar" >
	                    <li class="su_sub_menu_item">
	                        
	                        <!-- 변경 버튼 클릭 전 -->
	                        <span class="fas fa-pen pen_icon dis_bl" id="pen1"></span>
	
	                        <!-- 변경버튼 클릭 후 -->
	                        <div class="dis_no" id="nopen1">
	                            <!-- <span class="fas fa-xmark pen_icon" id="x1"></span> -->
	                            <span class="fas fa-check pen_icon" id="check1"></span>
	                        </div>
	                        
	                        <div class="collapsed su_sub_menu_list" id="mycalCol" style="width:70%;" data-toggle="collapse" data-target="#myCalendar" aria-expanded="true" aria-controls="collapseTwo">
	                            <span>&nbsp;내 캘린더</span>
	                        </div>
	
	                        <span style="display:none" id="calArr"></span>
	                    
	
	                        <div id="myCalendar" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
	                            <table id="tb_myCal">
	                                <!-- script에서 채워짐 -->
	                            </table>
	                            <a type="button" class="addCal" data-toggle="modal" data-target="#addMyCal">+ 내 캘린더 추가</a>
	                        </div>
	                    </li>
	                </ul>
	
	                <!-- 내 캘린더 추가 모달창 -->
	                <div class="modal fade" id="addMyCal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                    <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
	                        <!--Content-->
	                        <div class="modal-content modal_alert">
	            
	                            <!--Body-->
	                            <div class="modal-body text-center modal_alert_child">
	            
	                                <h5 class="mt-1 mb-2" style="color: black;">내 캘린더 추가</h5>
	                                <br>
	            
	                                <div class="md-form ml-0 mr-0">
	                                    <input type="text" id="myCalName" class="form-control form-control-sm validate ml-0">
	                                </div>
	            
	                                <div class="text-center mt-4">
	                                    <button type="button" id="insertMyCal" class="btn su_btn_all su_btn_medium">확인</button>
	                                    <button type="button" class="btn su_btn_border su_btn_medium" data-dismiss="modal">취소</button>
	                                </div>
	                                
	                            </div>
	            
	                        </div>
	                    </div>
	                </div>
	                
	                <!-- 내 캘린더 관련 script -->
	                <script>
	                	$(function(){
	                		calList();
	                		selectMycalList();
	                		
	                	})
	                	
	                	// 내 캘린더 리스트 출력 이벤트
	                	function selectMycalList(){
	                		$.ajax({
	                			url: "mclist.ca",
	                			data: { memNo: ${ loginUser.memNo } },
	                			success: function(list){
	                				
	                				let value = "";
	                				let str = "";
	                                
	                                for(let i = 0; i < list.length; i++){
		                                value += '<tr style="width: 100%;">'
		                                    		+ '<td width="20%;"><span class="myNo" style="color: white !important;">' + list[i].mycalNo + '</span></td>'
		                                    		+ '<td><input type="checkbox" name="mycalList" checked></td>'
		                                    		+ '<td width="90%;"> &nbsp;' + list[i].mycalName + '</td>'
			                                  
				                                    + '<td class="su_myCalBasic">'
				                                        + '<a type="button">'
				                                            + '<div class="calColor" id="colorBtn' + list[i].mycalNo + '" style="border: 1px solid ' + list[i].mycalColor + '; background: ' + list[i].mycalColor + ';" onclick="colorMycal(' + list[i].mycalNo + ');"></div>'
				                                        	+ '<input type="hidden" id="calColor' + list[i].mycalNo + '" value="' + list[i].mycalColor + '">'	
				                                        + '</a>'
				                                    + '</td>';
		
				                                    if(i == 0){
				                                    	value += '<td class="su_myCalX dis_no"></td>';
				                                    } else {
		                                    			value += '<td class="su_myCalX dis_no"><a type="button" onclick="deleteMycal(' + list[i].mycalNo + ');">x</a></td>';
				                                    }
		                                		+ '</tr>';
		                                		
		                                str += list[i].mycalNo + ",";
	                                }
		                                
		                           //value += '</table>';
		                           
		                           $("#tb_myCal").html(value);
		                           //console.log(str);
		                           str = str.substring(0, str.lastIndexOf(","));
		                           $("#calArr").text(str);
	                			}, error: function(){
	                				console.log("ajax 내 캘린더 조회 실패");
	                			}
	                		});
	                		
	                	}
	                	
	                	var checkCnt = "";
	            		
	            		// 내 캘린더 체크 리스트
	            		function calList(){
	            	        checkCnt = "";
	            	        $("input[name='mycalList']:checked").each(function(){
	            	        	
	            	        	//console.log($(this).parent().parent().children().eq(0).text());
	            	            checkCnt += ($(this).parent().parent().children().eq(0).text()) + ","; // 체크된 것만 게시글번호 뽑기 "2,3,4,"
	            	        });
	            	        
	            	        checkCnt = checkCnt.substring(0,checkCnt.lastIndexOf(",")); // 맨 뒤 콤마 삭제 "2,3,4"
	            	        //console.log(checkCnt);
	            	        $("#calArr").text(checkCnt);
	            		}
	            		
	            		$(document).on("change", "input[name='mycalList']", function(){
	            			calList();
	            			console.log($("#calArr").text());
	            		});
	            		
	                	// 선택된 캘린더 번호 출력 이벤트
	                	function selectMycalNo(){
	                		var result = "";
	                		$.ajax({
	                			url: "mcnolist.ca",
	                			async: false,
	                			data: { memNo: ${ loginUser.memNo } },
	                			success: function(list){
	                				for(let i = 0; i < list.length; i++){
	                					result += list[i].mycalNo + ',';
	                				}
	                				result = result.substring(0, result.lastIndexOf(","));
	                				$("#calArr").text(result);
	                			}, error: function(){
	                				console.log("ajax 내 캘린더 번호 조회 실패");
	                			}
	                		});
	                		return result;
	                	}
	                		
	               		// 내 캘린더 추가
	               		$("#insertMyCal").click(function(){
	               			$.ajax({
	               				url: "mcinsert.ca",
	               				data: { 
	               					memNo: ${ loginUser.memNo},
	               					mycalName: $("#myCalName").val()
	               				},
	               				success: function(result){
	               					if(result == "success"){
	               						alert("내 캘린더가 추가되었습니다.");
	               						$("#myCalName").val("");
	               						$("#addMyCal").modal('hide');
	               						selectMycalList();
	               					}
	               				}, error: function(){
	               					console.log("ajax 내 캘린더 추가 실패");
	               				}
	               			});
	               		});
	               		
	               		// 내 캘린더 삭제
	               		function deleteMycal(mcNo){
	               			// mcNo : 내 캘린더 번호
	               			$("#delete").modal("show");
	               			$("#realDelete").click(function(){
	               				console.log("j");
	               				$.ajax({
	               					url: "mcdelete.ca",
	               					data: {checkCnt: mcNo},
	               					success: function(result){
	               						if(result == "success"){
	               							alert("삭제되었습니다.");
	               							$("#delete").modal("hide");
	               							selectMycalList();
	               						}
	               					}, error: function(){
	               						console.log("ajax 내 캘린더 삭제 실패");
	               					}
	               				});
	               			});
	               		}
	               		
	               		// 캘린더 색상 변경
	               		function colorMycal(mcNo){
	               			let value = "";
	               			let id = "colorBtn" + mcNo;
	               			let c = "calColor" + mcNo;
	               			let color = $("#" + c).val();
	               			
	               			value += '<input type="color" id="colorArea" value="' + color + '">'
	    	                       + '<button type="button" class="btn btn-sm su_btn_border" id="chColorBtn" onclick="changeColor(' + mcNo + ');">변경</button>';
	    	                
	    	                $("#colorPal").html(value);
	    	                $("#colorPal").show();
	    	                $("#" + id).attr("onclick", "cancleColor(" + mcNo + ");");
	               		}
	               		
	               		function cancleColor(mcNo){
	               			$("#colorPal").hide();
	               			let id = "colorBtn" + mcNo;
	               		 	$("#" + id).attr("onclick", "colorMycal(" + mcNo + ");");
	               		}
	               		
	               		// 색상 기본값 설정하기
	               		function changeColor(mcNo){
	               			let c = $("#colorArea").val();
	               			let color = c;
	               			$.ajax({
	               				url: "mccolor.ca",
	               				data: {
	               					mycalNo: mcNo,
	               					mycalColor: c
	               				},
	               				success: function(result){
	               					if(result == "success"){
	               						selectMycalList();
	               						location.reload();	// 이벤트 색상 변경을 위해
	               					}
	               				}, error: function(){
	               					console.log("ajax 캘린더 색상 변경 실패");
	               				}
	               			});
	               		}
	               		
	               		// color HEX to rgb
                        function hexToRgb ( hexType ){ 
                            /* 맨 앞의 "#" 기호를 삭제하기. */ 
                            var hex = hexType.trim().replace( "#", "" ); 
                            
                            /* rgb로 각각 분리해서 배열에 담기. */ 
                            var rgb = ( 3 === hex.length ) ? 
                                hex.match( /[a-f\d]/gi ) : hex.match( /[a-f\d]{2}/gi );     
                            
                            rgb.forEach(function (str, x, arr){     
                                /* rgb 각각의 헥사값이 한자리일 경우, 두자리로 변경하기. */ 
                                if ( str.length == 1 ) str = str + str; 
                                
                                /* 10진수로 변환하기. */ 
                                arr[ x ] = parseInt( str, 16 ); 
                            }); 
                            
                            return "rgba(" + rgb.join(", ") + ", 0.5)"; 
                        };
                        
	                </script>
	                
	                
	                
	                <!-- 삭제 모달창 -->
	                <div class="modal" id="delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
	                    <!--Content-->
	                    <div class="modal-content modal_alert">
	                        
	                        <!--Body-->
	                        <div class="modal-body text-center modal_alert_child">
	                            <div style="margin-top: 1.5rem;">
	            
	                                <h5 class="mt-1 mb-2" style="color: black;">정말 삭제하시겠습니까?</h5>
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

                <script>
	                    $(document).ready(function(){
	                    	
	                    	// 일정 페이지로 이동 (현재 날짜 데이터를 갖고)
	                    	$("#enrollBtn").click(function(){
	                    		var now = new Date();
	                    		var month = now.getMonth() + 1;
	                    		var date = now.getDate();
	                    		var d = now.getFullYear();
	                    		d += "-";
	                    		
	                    		if(month < 10){
	                    			d += "0" + month;
	                    		} else{
	                    			d += month;
	                    		}
	                    		
	                    		d += "-";
	                    		
	                    		if(date < 10){
	                    			d += "0" + date;
	                    		} else{
	                    			d += date;
	                    		}
	                    		
	                    		
	                    		//console.log(d);
	                    		location.href="enrollForm.ca?day=" + d + "&memNo=" + ${ loginUser.memNo };
	                    	});
	                    	
	                    	
	                        // 내/관심 캘린더 수정, 취소버튼 클릭시 보여지는 부분
	                        $("#pen1").click(function(){
	                            $("#nopen1").show();
	                            $("#pen1").hide();
	                            $(".su_myCalBasic").hide();
	                            $(".su_myCalX").show();
	                        });
	
	                        $("#nopen1").click(function(){
	                            $("#pen1").show();
	                            $("#nopen1").hide();
	                            $(".su_myCalBasic").show();
	                            $(".su_myCalX").hide();
	                        });
	
	                        $("#pen2").click(function(){
	                            $("#nopen2").show();
	                            $("#pen2").hide();
	                            $(".su_attCalBasic").hide();
	                            $(".su_attCalX").show();
	                        });
	
	                        $("#nopen2").click(function(){
	                            $("#pen2").show();
	                            $("#nopen2").hide();
	                            $(".su_attCalBasic").show();
	                            $(".su_attCalX").hide();
	                        });
	
	                        $("#addAttCal").click(function(){
	                            $("#attCalList").show();
	                        })
	
	                        $("#xBtn").click(function(){
	                            $("#attCalList").hide();
	                        });
	
	                     	// 전사일정, 참석자 일정 체크박스 이벤트
		            		$("#cmpyBox").change(function(){
		            			
			            		if( $("#cmpyBox").is(":checked") ){
			            			$("#cmpy").text('Y');
			            		} else{
			            			$("#cmpy").text('N');
			            		}
			            		
			            		$("#calendar").reload();
		            		});
	                     	
		            		$("#atndBox").change(function(){
			            		if( $("#atndBox").is(":checked") ){
			            			$("#atnd").text('Y');
			            		} else{
			            			$("#atnd").text('N');
			            		}
		            			
		            		});
		            		
		            		
	
	                        
	                    });
	                </script>
	
	                <hr class="hr_line" style="margin-top: 3rem; margin-bottom: 2rem;">
	
	                <!-- 회사 캘린더 -->
	                <div class="su_sub_menu_item">
	                    <table>
	                        <tr style="width: 100%;">
	                            <td width="30%;"></td>
	                            <td><input type="checkbox" id="cmpyBox" checked></td>
	                            <td> &nbsp;전사 일정</td>
	                            <td width="10%"></td>
	                        </tr>
	                        <tr>
	                            <td></td>
	                            <td><input type="checkbox" id="atndBox" checked></td>
	                            <td> &nbsp;참석자 일정</td>
	                            <td></td>
	                        </tr>
	                    </table>
	                </div>
	                
	                <span style="display:none;" id="cmpy">Y</span>
	                <span style="display:none;" id="atnd">Y</span>
	                
	                <!-- 캘린더 관리 페이지로 이동 -->
	                <br>
	                    <a href="manage.ca" class="su_sub_menu_list" style="color: black;">
	                        <h6><span class="fas fa-fw fa-cog"></span> &nbsp;캘린더 관리</h6>
	                    </a>
	                    <!-- <a href=""><h6>항목</h6></a> -->
	                    <input type="hidden" id="checkCntVal" value="">
	
	
	                <br><br>
	
	                <!-- 색상 팔레트 -->
	                <div class="colorPal" id="colorPal">
	                    
	                </div>
	  
	            </div>
	                                
	        </nav>
	    </div>

    <!-- ============================================================================================================ -->
    
    <div class="su_contentArea" style="width: 85%;">
        <div class="su_content_header">
            <h2 class="su_sub_menu_name" style="color: black;">캘린더 관리</h2>

            <br><br><br>

            <h4 class="su_sub_menu_name">&nbsp;내 캘린더</h4>

            <hr class="hr_line">

            <div class="su_content_body">

                <br><br>

                <div style="text-align: center">
                    <input type="text" style="width: 300px;" name="suPhKeyword" placeholder="캘린더 이름">
                    <button type="button" class="su_btn_border btn-sm su_btn_search">검색</button>
                </div>

                

                <div class="selectOption su_btn_area" align="right">
                    <select style="width: 150px;">
                        <option value="">전체</option>
                        <option value="">공개</option>
                        <option value="">비공개</option>
                    </select>
                </div>

                <div class="main_width su_table_pad">
                    <table class="board-content table" id="suTable" align="center">
                        <thead>
                            <tr class="table_thead_border">
                                <th width="2%"><input type="checkbox" name="selectAll"></th>
                                <th>캘린더</th>
                                <th width="20%">공개 상태</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- 값은 다 DB와 연결될 것 -->
                            <tr>
                                <td><input type="checkbox" name="deleteList"></td>
                                <td>내 일정</td>
                                <td>
                                    <div class="selectOption" style="width: 60%; margin: auto;">
                                        <select style="width: 100%;">
                                            <option value="">공개</option>
                                            <option value="">비공개</option>
                                        </select>
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td><input type="checkbox" name="deleteList"></td>
                                <td>부서 일정</td>
                                <td>
                                    <div class="selectOption" style="width: 60%; margin: auto;">
                                        <select style="width: 100%;">
                                            <option value="">공개</option>
                                            <option value="">비공개</option>
                                        </select>
                                    </div>
                                </td>
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

                    <br><br>
                    
                </div>

                <div class="tableOption">
                    <div class="su_btn_area su_btn_two_area">
                        <button type="button" class="btn su_btn_all" id="delCalBtn" data-toggle="modal" data-target="#nocheck">삭제 &nbsp;<span class="fas fa-trash"></span></button>
                        <button type="button" class="btn su_btn_border" onclick="location.href='list.ca;'">캘린더로 돌아가기</button>
                    </div>
                </div>

                <!-- 삭제 모달창 -->
                <div class="modal" id="deleteCal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
                        <!--Content-->
                        <div class="modal-content modal_alert">
                            
                            <!--Body-->
                            <div class="modal-body text-center modal_alert_child">
                                <div style="margin-top: 1.5rem;">
                
                                    <h5 class="mt-1 mb-2" style="color: black;">정말 삭제하시겠습니까?</h5>
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
                                <div style="margin-top: 1.5rem;">
                
                                    <h5 class="mt-1 mb-2" style="color: black;">삭제할 캘린더를 선택해주세요.</h5>
                                    <br>                                
                                    <div class="text-center mt-4"> 
                                        <button type="button" class="btn su_btn_all su_btn_medium" data-dismiss="modal">확인</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 삭제 관련 script -->
	                <script>
	                    $(function(){
	                        // 켈린더 삭제
	                        let checkCnt = "";
	                        
	                        $("input[type=checkbox]").change(function(){
	                            checkCnt = "";
	                            $("input[name='deleteList']:checked").each(function(){
	                            	
	                            	console.log($(this).parent().parent().children(".no").text());
	                                //checkCnt += ($(this).parent().parent().children(".no").text()) + ","; // 체크된 것만 게시글번호 뽑기 "2,3,4,"
	                            });
	                            
	                            checkCnt = checkCnt.substring(0,checkCnt.lastIndexOf(",")); // 맨 뒤 콤마 삭제 "2,3,4"
                                
	                            
	                            // 선택된 체크박스 없이 삭제 버튼 누른 경우
	                            if(checkCnt == ''){
	                                $("#delCalBtn").attr("data-target", "#nocheck");
	                            }
	
	                            else {
	                                $("#delCalBtn").attr("data-target", "#deleteCal");
	                            }
	                        });
	
	                        // 모달에서 삭제 확인 클릭시 DB에서 삭제
	                        /*  $("#realDelete").click(function(){
	                            
	                             $.ajax({
	                                 url:"delete.pr", 
	                                 data:{"checkCnt":checkCnt},
	                                 success:function(result){
	                                     if(result == "success"){
	                                         location.reload();
	                                     } else{
	                                         alert("홍보물 삭제에 실패하였습니다.");
	                                     }
	                                 },
	                                 error:function(){
	                                     console.log("ajax 게시글 삭제 실패")
	                                 }
	                             });
	                         }); */
	
	                    })
	                </script>
                
                <!-- 페이징 영역 -->
                <!-- <div style="margin:30px 0 30px 0">
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
                    </div> -->

                </div>
            </div>
        </div>

    </div>



</div>		
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>