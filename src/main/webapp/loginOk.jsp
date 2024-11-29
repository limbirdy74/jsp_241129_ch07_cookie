<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 확인</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");  // utf-8 로 입력 받는 값들을 모두 인코딩. 무조건 할 것
		
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		
		// 회원아이디가 tiger이고, 비밀번호가 12345일 경우에만 로그인 성공. DB가 없어서 이렇게 테스트
		if (mid.equals("tiger") && (mpw.equals("12345"))) {
			session.setAttribute("sessionId", mid);  // 세션 속성 생성
			session.setAttribute("validMem", "yes");  // 세션 속성 생성
			session.setAttribute("sessionPw", mpw);  // 세션 속성 생성
			
			// 세선은 서버메모리에 쿠키는 클라이언트 브라우저에
			
			Cookie cookie1 = new Cookie("cookieId", mid); // 쿠키1 생성. 인수를 넣어주어야만 하는 생성자. 안넣으면 오류남
			Cookie cookie2 = new Cookie("log_in", "yes"); 
			// 만들기만 한것. 밑에 보내기
			response.addCookie(cookie1); // 생성된 쿠키를 클라이언트 웹브라우저로 보내기
			response.addCookie(cookie2);
			
			out.println("로그인 성공하셨습니다");
		} else {
			response.sendRedirect("loginFail.jsp"); // 로그인 실패 시 강제로 login 페이지로 이동
		}
		
	%>
	
	<a href="myinfo.jsp">내 정보보기 페이지로 가기</a>
	
</body>
</html>