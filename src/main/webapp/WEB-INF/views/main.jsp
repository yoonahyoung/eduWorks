<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="common/header.jsp" />
	
	<div id="go-dashboard-10" class="go-dashboard go_dashboard_3_3">
		<div>
			<div class="gadget_design_wrap"><div class="profile">
				<span class="photo"><img src="/resources/images/photo_profile_small.jpg" title="김상후 대표이사" alt=""></span>
					<span class="info">
					<span class="name" title="김상후">김상후</span>
					<span class="position">대표이사</span>
					<span class="part">다우그룹</span>
				</span>
			</div>
			<ul class="type_simple_list today_list">
				<li class="summary-mail">
					<a href="/app/mail?work=quick&amp;folder=today" data-bypass="true">
						<span class="type">
							<span class="ic_dashboard2 ic_type_mail" title="mail"></span>
						</span>
						<span class="txt">오늘 온 메일</span>
						<span class="badge badge_zero">0</span>
					</a>
				</li>
				<li class="summary-calendar">
					<a href="/app/calendar/daily/2022-09-21" data-bypass="true">
						<span class="type">
							<span class="ic_dashboard2 ic_type_cal" title="calendar"></span>
						</span>
						<span class="txt">오늘의 일정</span>
						<span class="badge badge_zero">0</span>
					</a>
				</li>
			</ul>
			</div>
			<div></div>
			<div></div>
			<div></div>
			<div></div>
		</div>
		<div>
			<div>
				<div></div>
				<div></div>
				<div></div>
				<div></div>
				<div></div>
			</div>
			<div>
				<div></div>
				<div></div>
				<div></div>
				<div></div>
			</div>
		</div>
	</div>

	<jsp:include page="common/footer.jsp" />

</body>
</html>