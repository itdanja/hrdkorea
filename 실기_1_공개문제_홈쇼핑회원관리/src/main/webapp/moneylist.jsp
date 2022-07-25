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
		ArrayList<MemberDTO> list = memberDao.getmoneylist();
	%>
	<center>
		<h2>회원매출조회</h2>
		<table class="t1">
			<tr>
				<td> 회원번호 </td>
				<td> 회원성명 </td>
				<td> 고객등급 </td>
				<td> 매출 </td>
			</tr>
			<%
				for( MemberDTO dto : list ){
					// 등급 표시 바꾸기 
					if( dto.getGrade().equals("A") ){ dto.setGrade("VIP"); }
					else if (dto.getGrade().equals("B") ){ dto.setGrade("일반"); }
					else{ dto.setGrade("직원"); }
			%>
			
				<tr>
					<td> <%=dto.getCustno() %> </td>
					<td> <%=dto.getCustname() %></td>
					<td> <%=dto.getGrade() %></td>
					<td> <%=dto.getMoney() %></td>
				</tr>
			<%		
				}
			
			%>
		</table>
		
	</center>
	
	
	<%@include file = "footer.jsp" %>

</body>
</html>