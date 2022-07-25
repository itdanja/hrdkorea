<%@page import="DTO.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		
		.t1{ border: 1px solid black;}
		.t1 td { 
			border: 1px solid black;  /*테두리*/
			text-align: center;		/*텍스트정렬*/
			padding: 5px 15px;		/*안쪽여백*/
		}
	
	</style>
	
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<%@include file = "header.jsp" %>
	
	<%
		MemberDao memberDao = new MemberDao();
		ArrayList<MemberDTO> list = memberDao.getmemberlist();
	%>
	<center>
		<h2>회원목록조회/수정</h2>
		<table class="t1">
			<tr>
				<td> 회원번호 </td>
				<td> 회원성명 </td>
				<td> 전화번호 </td>
				<td> 주소 </td>
				<td> 가입일자 </td>
				<td> 고객등급 </td>
				<td> 거주지역 </td>
			</tr>
			<%
				// 리스트만큼 반복처리
				for( MemberDTO dto : list ){
					// 등급 표시 바꾸기 
					if( dto.getGrade().equals("A") ){ dto.setGrade("VIP"); }
					else if (dto.getGrade().equals("B") ){ dto.setGrade("일반"); }
					else{ dto.setGrade("직원"); }
			%>
				<tr>
					<td> 
						<a href="update.jsp?custno=<%=dto.getCustno()%>">
						 <%=dto.getCustno() %> 
						 </a> 
					</td>
					<td> <%=dto.getCustname() %> </td>
					<td> <%=dto.getPhone() %> </td>
					<td> <%=dto.getAddress() %> </td>
					<td> <%=dto.getJoindate().split(" ")[0] %> </td> 
					<!-- 날짜중 공백기준으로 분리후 앞부분만 가져오기 -->
					<td> <%=dto.getGrade() %> </td>
					<td> <%=dto.getCity() %> </td>
				</tr>
			<%
				}
			%>
		</table>
		
	</center>
	
	
	<%@include file = "footer.jsp" %>

</body>
</html>