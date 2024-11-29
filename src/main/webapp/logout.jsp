<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
	<%
		
		Cookie[] cookies = request.getCookies();  // 서버로 온 쿠키객체를 선언. 각각 유효시간을 0으로 설정함으로 삭제
		for (int i=0;i<cookies.length;i++) {
			
			if (cookies[i].getName().equals("cookieId")) {
				cookies[i].setMaxAge(0); // 쿠키의 유효시간을 0으로 셋팅->해당 쿠키 객체 삭제
				response.addCookie(cookies[i]);  // 유효시간을 0으로 셋팅한 쿠키 객체를 클라이언트에게 재전송
			}
		}
		
		session.invalidate(); // 모든 세션의 속성을 삭제 -> 완전 로그아웃
	%>
	<a href="myinfo.jsp">내 정보 바로가기</a><br><br>
	<a href="logout2.jsp">모든 쿠키 삭제</a>
</body>
</html>