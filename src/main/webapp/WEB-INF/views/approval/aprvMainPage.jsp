<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script> -->
    <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script> -->
    <script src="https://kit.fontawesome.com/d9c0959348.js" crossorigin="anonymous"></script>




    <!-- 노션에서 가져온 템플릿 -->
    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
   
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/sumin.css" rel="stylesheet" type="text/css">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/brands.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.om/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css">
<style>
.j-info-icon{
margin:0px 0px 5px 5px; 
color:rgba(128, 128, 128, 0.432); border:0px; 
background:white;
}

.draft-table-head{
  font-weight:500;

}
.j-theme-head-wrapper{
  display:flex;
  justify-content:between; 
  margin:20px 30px;
}
.table td{
  text-align: center;
}

</style>
</head>
<jsp:include page="../common/header.jsp" />
<body>
<!--Begin of Main Content -->
	<!-- Begin Page Content -->
	<div class="container-fluid">
		<nav class="menu-sidebar">
			<div class="insider">
				<h2>전자결재</h2>
				<div>
					<button type="button" class="aprvNew j_btn-lg btn-light" id="modal_btn" data-toggle="modal" data-target="#chooseFormType"
						>새 결재 진행
						<!-- <a data-toggle="modal" data-target="#chooseFormType"> -->
<!--  onclick="location.href='맵핑'" -->						
						 <i class="fas fa-pencil-alt mt-0" style="margin-left:5px;""></i> 
						</button>
						<!-- 결재양식 선택 모달창(enrollFormType)-->
	
<div class="modal_wrap" class="modal hidden">
       <div class="modal" id="chooseFormType">
        <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title"><b>결재하기</b></h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <!-- 해당 버튼 클릭시 모달과 연결해제 -->
            </div>
    
            <!-- Modal body -->
        <form action="" method="post">
            <div class="modal-body" align="center">
            
            
                <input type="hidden" name="" value="">
                
                <div class="setup-tag">

                    <div>태그 이름</div>
                    <input type="text" name="" style="width:100%;">
                    <br>

                    <div class="modalContent">
                        모달창내용
                    </div>

                </div>
                

                <div>
                <button type="submit" class="mailBtn" style="background-color:slategray; color:white; border:none;">추가</button>
                <button type="button" data-dismiss="modal" class="modal_close" >취소</button>
                </div>

            </div>

        </form>
            
        </div>
        </div>
    </div>
</div>    
    <!--모달창 끝  -->
    
   

    
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
	</div> 	 
	 	  <hr>
    <div style="display:flex; ">
    <div class="home">
    <h3>전자결재 홈</h3>  
    </div>
    <div class="home">
    <button type="button" class="btn btn-light" style="margin-left:20px;">새 결재 진행  <i class="fas fa-pencil-alt mt-0" style="margin-left:5px;""></i></button>
</div>
</div>

<hr>
<P style="margin:80px 400px;">
결재할 문서가 없습니다.</p>


<hr>
        <div>
          <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2">
            <i class="fas fa-pencil-alt mt-0"></i>
          </button>
          <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2">
            <i class="far fa-trash-alt mt-0"></i>
          </button>
       
        </div>

   <!-- 기안진행문서 제목파트 -->
    <div class="j-theme-head-wrapper">
    <h5 style="text-align:left;" class="draft-table-head">기안 진행 문서</h5>
    <button type="button" class="j-info-icon">
        <i class="fas fa-info-circle"></i>
      </button>
    </div>
<!-- 기안진행문서 테이블 시작 -->
  <div>
    <div class="px-4">
  
                <div class="table-wrapper">
                  <!--Table-->
                  <table class="table table-hover mb-0">
            
                    <!--Table head-->
                    <thead>
                      <tr>
                        <th>
                          <input class="form-check-input" type="checkbox" id="checkbox">
                          <label class="form-check-label" for="checkbox" class="mr-2 label-table"></label>
                        </th>
                        <th class="th-lg">
                          <a>기안일
                            <i class="fas fa-sort ml-1"></i>
                          </a>
                        </th>
                        <th class="th-lg">
                          <a href="">결재양식
                            <i class="fas fa-sort ml-1"></i>
                          </a>
                        </th>
                        <th class="th-lg">
                          <a href="">제목
                            <i class="fas fa-sort ml-1"></i>
                          </a>
                        </th>
                        <th class="th-lg">
                          <a href="">첨부
                          </a>
                        </th>
                        <th class="th-lg">
                          <a href="">결재상태
                            <i class="fas fa-sort ml-1"></i>
                          </a>
                        </th>
                        <!-- <th class="th-lg">
                          <a href="">Username
                            <i class="fas fa-sort ml-1"></i>
                          </a>
                        </th> -->
                      </tr>
                    </thead>
                    <!--Table head-->
            
                    <!--Table body-->
                    <tbody>
                      <tr>
                        <th scope="row">
                          <input class="form-check-input" type="checkbox" id="checkbox1">
                          <label class="form-check-label" for="checkbox1" class="label-table"></label>
                        </th>
                        <td>2022-08-19</td>
                        <td>지출결의서</td>
                        <td>2022년 8월 운영부 지출결의서</td>
                        <td>
                          <i class="fas fa-paperclip"></i>
                      </td>
                        <td>진행중</td>
                      </tr>
                      <tr>
                        <th scope="row">
                          <input class="form-check-input" type="checkbox" id="checkbox2">
                          <label class="form-check-label" for="checkbox2" class="label-table"></label>
                        </th>
                        <td>2022-08-10</td>
                        <td>기안신청서</td>
                        <td>SNS 사용후기 이벤트 진행의 건</td>
                        <td>  <i class="fas fa-paperclip"></i></td>
                        <td>진행중</td>
                      </tr>
                      <tr>
                        <th scope="row">
                          <input class="form-check-input" type="checkbox" id="checkbox3">
                          <label class="form-check-label" for="checkbox3" class="label-table"></label>
                        </th>
                        <td>2022-08-04</td>
                        <td>기안신청서</td>
                        <td>SNS 사용후기 이벤트 진행의 건</td>
                        <td></td>
                        <td>진행중</td>
                      </tr>
                      <tr>
                        <th scope="row">
                          <input class="form-check-input" type="checkbox" id="checkbox4">
                          <label class="form-check-label" for="checkbox4" class="label-table"></label>
                        </th>
                        <td>2022-07-10</td>
                        <td>연차신청서</td>
                        <td>7월 연차신청서</td>
                        <td></td>
                        <td>진행중</td>
                      </tr>
                 
                    </tbody>
                    <!--Table body-->
                  </table>
                  <!--Table-->
                </div>
  
    </div>
  
  </div>
  <!-- 기안진행문서 테이블 끝  -->

  <br><br>


 <!-- 기안완료문서 제목파트 -->
 <div class="j-theme-head-wrapper">
  <h5 style="text-align:left;" class="draft-table-head" style="margin-right:20px;">완료 문서</h5>
  <button type="button" class="j-info-icon">
      <i class="fas fa-info-circle"></i>
    </button>
  </div>
  <!-- 기안완료문서 테이블 시작 -->
  <div>
    <div class="px-4">
  
                <div class="table-wrapper">
                  <!--Table-->
                  <table class="table table-hover mb-0">
            
                    <!--Table head-->
                    <thead>
                      <tr>
                        <th>
                          <input class="form-check-input" type="checkbox" id="checkbox">
                          <label class="form-check-label" for="checkbox" class="mr-2 label-table"></label>
                        </th>
                        <th class="th-lg">
                          <a>기안일
                            <i class="fas fa-sort ml-1"></i>
                          </a>
                        </th>
                        <th class="th-lg">
                          <a href="">결재양식
                            <i class="fas fa-sort ml-1"></i>
                          </a>
                        </th>
                        <th class="th-lg">
                          <a href="">제목
                            <i class="fas fa-sort ml-1"></i>
                          </a>
                        </th>
                        <th class="th-lg" style="text-align:center">
                          <a href="">첨부
                          </a>
                        </th>
                        <th class="th-lg">
                          <a href="">문서번호
                            <i class="fas fa-sort ml-1"></i>
                          </a>
                        </th>
                        <th class="th-lg">
                          <a href="">결재상태
                            <i class="fas fa-sort ml-1"></i>
                          </a>
                        </th>
                        <!-- <th class="th-lg">
                          <a href="">Username
                            <i class="fas fa-sort ml-1"></i>
                          </a>
                        </th> -->
                      </tr>
                    </thead>
                    <!--Table head-->
            
                    <!--Table body-->
                    <tbody>
                      <tr>
                        <th scope="row">
                          <input class="form-check-input" type="checkbox" id="checkbox1">
                          <label class="form-check-label" for="checkbox1" class="label-table"></label>
                        </th>
                        <td>2022-08-19</td>
                        <td>지출결의서</td>
                        <td>2022년 8월 운영부 지출결의서</td>
                        <td>
                          <i class="fas fa-paperclip"></i>
                      </td>
                      <td>edu-2022-0215</td>
                        <td>완료</td>
                      </tr>
                      <tr>
                        <th scope="row">
                          <input class="form-check-input" type="checkbox" id="checkbox2">
                          <label class="form-check-label" for="checkbox2" class="label-table"></label>
                        </th>
                        <td>2022-07-22</td>
                        <td>기안신청서</td>
                        <td>고객사 SNS 사용후기 이벤트 진행의 건 </td>
                        <td> <i class="fas fa-paperclip"></i></td>
                        <td>edu-2022-0215</td>
                        <td>완료</td>
                      </tr>
                      <tr>
                        <th scope="row">
                          <input class="form-check-input" type="checkbox" id="checkbox3">
                          <label class="form-check-label" for="checkbox3" class="label-table"></label>
                        </th>
                        <td>2022-07-10</td>
                        <td>연차신청서</td>
                        <td>7월 연차신청서</td>
                        <td></td>
                        <td>edu-2022-0215</td>
                        <td>완료</td>
                      </tr>
                      <tr>
                        <th scope="row">
                          <input class="form-check-input" type="checkbox" id="checkbox4">
                          <label class="form-check-label" for="checkbox4" class="label-table"></label>
                        </th>
                        <td>2022-07-08</td>
                        <td>지출결의서</td>
                        <td>2022년 8월 운영부 지출결의서</td>
                        <td></td>
                        <td>edu-2022-0215</td>
                        <td>완료</td>
                      </tr>
                     
                    </tbody>
                    <!--Table body-->
                  </table>
                  <!--Table-->
                </div>
  
    </div>
  
  </div>
  <!-- 기안완료문서 테이블 끝  -->
</body>
</html>