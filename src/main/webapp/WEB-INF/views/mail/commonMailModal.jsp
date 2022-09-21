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
        <div class="modal-dialog modal-dialog-centered" style="width:400px;">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
            <h4 class="modal-title"><b>태그 추가</b></h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <!-- 해당 버튼 클릭시 모달과 연결해제 -->
            </div>
    
        <!-- Modal body -->
        <form action="insertMailTag.ma" method="post">
            <div class="modal-body" align="center">
            	
            	<input type="hidden" name="memNo" value="${loginUser.memNo }">
                <input type="hidden" name="tagColor">
                
                <div class="setup-tag">

                    <div>태그 이름</div>
                    <input type="text" name="" style="width:100%;">
                    <br>

                    <div class="tag-color">
                        <div>태그 색상</div>
                    
                        <div id="select-tag" style="text-align: center;">

                            <a class="bgcolor1 tagColor" color="bgcolor1" onclick="choiceTag(1);">bgcolor1</a>
							<a class="bgcolor2 tagColor" color="bgcolor2" onclick="choiceTag(2);">bgcolor2</a>
							<a class="bgcolor3 tagColor" color="bgcolor3" onclick="choiceTag(3);">bgcolor3</a>
							<a class="bgcolor4 tagColor" color="bgcolor4" onclick="choiceTag(4);">bgcolor4</a>
							<a class="bgcolor5 tagColor" color="bgcolor5" onclick="choiceTag(5);">bgcolor5</a> <br>
							<a class="bgcolor6 tagColor" color="bgcolor6" onclick="choiceTag(6);">bgcolor6</a>
							<a class="bgcolor7 tagColor" color="bgcolor7" onclick="choiceTag(7);">bgcolor7</a>
							<a class="bgcolor8 tagColor" color="bgcolor8" onclick="choiceTag(8);">bgcolor8</a>
							<a class="bgcolor9 tagColor" color="bgcolor9" onclick="choiceTag(9);">bgcolor9</a>
							<a class="bgcolor10 tagColor" color="bgcolor10" onclick="choiceTag(10);">bgcolor10</a>

                        </div>
                    </div>

                </div>
                

                <div class="tagBtn">
                <button type="submit" class="mailBtn addTag">추가</button>
                <button type="button" data-dismiss="modal" class="mailBtn" >취소</button>
                </div>

            </div>

        </form>
            
        </div>
        </div>
    </div>
    
    <script>
    	
    	// 태그 선택시 클래스명 지정하는 함수
    	function choiceTag(num){
    		
    		// 선택한 색상에 클래스 추가
    		$(".bgcolor" + num).addClass("active");
    		
    		// 선택한 색상 외 클래스 제거
    		$(".tagColor").not($(".bgcolor" + num)).removeClass("active");
    		
    		// 선택한 색상 배경색 추출
    		let color = $(".bgcolor" + num).css("background-color");

    		// tagColor value값에 넣기
    		$("input[name=tagColor]").val(color);
      		
    	}

    </script>
		
		
	    <!-- 태그 수정(updateTags Model) 모달-->
    <div class="modal" id="updateTags">
        <div class="modal-dialog modal-dialog-centered" style="width:400px;">
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

                            <a class="bgcolor1 tagColor" color="bgcolor1">bgcolor1</a>
							<a class="bgcolor2 tagColor" color="bgcolor2">bgcolor2</a>
							<a class="bgcolor3 tagColor" color="bgcolor3">bgcolor3</a>
							<a class="bgcolor4 tagColor" color="bgcolor4">bgcolor4</a>
							<a class="bgcolor5 tagColor" color="bgcolor5">bgcolor5</a> <br>
							<a class="bgcolor6 tagColor" color="bgcolor6">bgcolor6</a>
							<a class="bgcolor7 tagColor" color="bgcolor7">bgcolor7</a>
							<a class="bgcolor8 tagColor" color="bgcolor8">bgcolor8</a>
							<a class="bgcolor9 tagColor" color="bgcolor9">bgcolor9</a>
							<a class="bgcolor10 tagColor" color="bgcolor10">bgcolor10</a>

                        </div>
                    </div>

                </div>

                <div class="tagBtn">
                <button type="submit" class="mailBtn addTag">확인</button>
                <button type="button" data-dismiss="modal" class="mailBtn" >취소</button>
                </div>

            </div>

        </form>

        </div>
        </div>
    </div>

</body>
</html>