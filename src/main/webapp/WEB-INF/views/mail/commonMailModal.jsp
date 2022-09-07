<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css  -->
<link href="${pageContext.request.contextPath}/resources/css/mail.css" rel="stylesheet" type="text/css">

</head>
<body>
	
		<!-- 태그 추가(addTags Model) 모달-->

       <div class="modal" id="addTags">
        <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title"><b>태그 추가</b></h4>
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

                    <div class="tag-color">
                        <div>태그 색상</div>
                    
                        <div id="select-tag" style="text-align: center;">
                            <i class="fas fa-bookmark fa-lg" style="color: red;"></i>
                            <i class="fas fa-bookmark fa-lg" style="color: orange;"></i>
                            <i class="fas fa-bookmark fa-lg" style="color: gold;"></i>
                            <i class="fas fa-bookmark fa-lg" style="color: green"></i>
                            <i class="fas fa-bookmark fa-lg" style="color: blue;"></i> <br>
                            <i class="fas fa-bookmark fa-lg" style="color: purple;"></i> 
                            <i class="fas fa-bookmark fa-lg" style="color: violet;"></i>
                            <i class="fas fa-bookmark fa-lg" style="color: gray;"></i>
                            <i class="fas fa-bookmark fa-lg" style="color: pink;"></i>
                            <i class="fas fa-bookmark fa-lg" style="color: yellowgreen;"></i>
                        </div>
                    </div>

                </div>
                

                <div>
                <button type="submit" class="mailBtn" style="background-color:slategray; color:white; border:none;">추가</button>
                <button type="button" data-dismiss="modal" class="mailBtn" >취소</button>
                </div>

            </div>

        </form>
            
        </div>
        </div>
    </div>
		
		
	    <!-- 태그 수정(updateTags Model) 모달-->
    <div class="modal" id="updateTags">
        <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title"><b>태그 수정</b></h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <!-- 해당 버튼 클릭시 모달과 연결해제 -->
            </div>
    
            <!-- Modal body -->
        <form action="" method="post">
            <div class="modal-body" align="center">
            
            <form action="" method="post">
                <input type="hidden" name="" value="">
                
                <div class="setup-tag">

                    <div>태그 이름</div>
                    <input type="text" name="" value="" style="width:100%;">
                    <br>

                    <div class="tag-color">
                        <div>태그 색상</div>
                    
                        <div id="select-tag" style="text-align: center;">
                            <i class="fas fa-bookmark fa-lg" style="color: red;"></i>
                            <i class="fas fa-bookmark fa-lg" style="color: orange;"></i>
                            <i class="fas fa-bookmark fa-lg" style="color: gold;"></i>
                            <i class="fas fa-bookmark fa-lg" style="color: green"></i>
                            <i class="fas fa-bookmark fa-lg" style="color: blue;"></i> <br>
                            <i class="fas fa-bookmark fa-lg" style="color: purple;"></i> 
                            <i class="fas fa-bookmark fa-lg" style="color: violet;"></i>
                            <i class="fas fa-bookmark fa-lg" style="color: gray;"></i>
                            <i class="fas fa-bookmark fa-lg" style="color: pink;"></i>
                            <i class="fas fa-bookmark fa-lg" style="color: yellowgreen;"></i>
                        </div>
                    </div>

                </div>
                

                <div>
                <button type="submit" class="mailBtn" style="background-color:slategray; color:white; border:none;">확인</button>
                <button type="button" data-dismiss="modal" class="mailBtn" >취소</button>
                </div>

            </div>

        </form>

        </div>
        </div>
    </div>

</body>
</html>