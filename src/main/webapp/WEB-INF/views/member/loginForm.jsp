<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/loginForm.css" rel="stylesheet" type="text/css">
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
	
	 <div class="outer">
        <div class="wrap">
            <h1>EDUWORKS</h1>
            <h2>More Exactly | More Early | More Easy</h2>

            <div class="loginForm">
                <form action="login.me" method="post">
                    <input type="text" name="userId" id="userId" placeholder="아이디를 입력해주세요." required > <br>
                    <input type="password" name="userPwd" id="userPwd" placeholder="비밀번호를 입력해주세요." required>
                    <br>
                    <button type="submit">로그인</button>
                </form>
            </div>
        </div>
    </div>
	
	
	
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>