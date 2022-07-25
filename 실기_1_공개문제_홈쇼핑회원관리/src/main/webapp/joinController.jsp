

<%@page import="DAO.MemberDao"%>
<%@page import="DTO.MemberDTO"%>
<%

	request.setCharacterEncoding("utf-8"); // 한글변수 요청시 사용

	// join페이지에서 변수 요청하여 dto 생성자로 dto 객체 만들기
	MemberDTO memberDTO = new MemberDTO(
		
			request.getParameter("custno") , 
			request.getParameter("custname") , 
			request.getParameter("phone") , 
			request.getParameter("address") , 
			request.getParameter("joindate") , 
			request.getParameter("grade") , 
			request.getParameter("city")
			
			);
	
	// db 저장 
	MemberDao memberDao = new MemberDao(); // db 객체 
	memberDao.join(memberDTO); // db 객체내 메소드 실행 
	// join 이동
	response.sendRedirect("join.jsp");



%>