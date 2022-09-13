<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/loginForm.css" rel="stylesheet" type="text/css">

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style>


</style>
</head>
<body>

	<c:if test="${ not empty alertMsg }">
		<script>
             Swal.fire({
                 icon: 'fail',
                 title: '로그인 실패',
                 text: "${alertMsg}",
                 allowOutsideClick: false,
                 showConfirmButton: true,
                 showCancelButton: false,
                 closeOnConfirm: true,
                 closeOnCancel: true,
                 confirmButtonText: 'OK',
                 confirmButtonColor: 'slategray',
                 cancelButtonText: 'Cancel',
                 imageUrl: null,
                 imageSize: null,
                 timer: null,
                 customClass: '',
                 html: false,
                 animation: true,
                 allowEscapeKey: true,
                 inputType: 'text',
                 inputPlaceholder: '',
                 inputValue: '',
                 showLoaderOnConfirm: false
       		  });
		</script>
		<c:remove var="alertMsg" scope="session" /> <!-- 일회성 메시지의 역할을 하기 위해 지워주기 -->
	</c:if>
	
	
	 <div class="outer">
        <div class="wrap">
            <h1>EDUWORKS</h1>
            <h2>More Exactly | More Early | More Easy</h2>

            <div class="loginForm">
                <form action="login.me" method="post">
                    <input type="text" name="memId" id="memId" placeholder="아이디를 입력해주세요." required > <br>
                    <input type="password" name="memPwd" id="memPwd" placeholder="비밀번호를 입력해주세요." required>
                    <br>
                    <button type="submit">로그인</button>
                </form>
            </div>
        </div>
    </div>
	

	
	


</body>
</html>