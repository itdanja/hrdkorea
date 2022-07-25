<%@page import="DTO.Dto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp" %>
	<%
		Dao dao = new Dao();  ArrayList<Dto> list = dao.getlist();
	%>
	<center>
		<h5>학생목록</h5>
		<table  border = "1">
			<tr><td>학번</td> <td>이름</td> <td>학년</td> <td>반</td>
				<td>번호</td> <td>성별</td> <td>전화번호</td> <td>주소</td>
			</tr>
			<%
				for( Dto dto : list  ){
					String 학년 = dto.getSno().substring(0,1); 
					String 반  = dto.getSno().substring(1,3);
					String 번호 = dto.getSno().substring(3,5);
					String 성별 = dto.getSgender().equals("M") ? "남" : "여" ; // 조건 ? 참 : 거짓 
			%>
				<tr>
					<td><%=dto.getSno() %></td> 
					<td><%=dto.getSname() %></td>
					<td><%=학년 %></td>  <td><%=반 %></td>
					<td><%=번호 %></td>  <td><%=성별 %></td>
					<td><%=dto.getSphone() %></td> 
					<td><%=dto.getSaddress() %></td>
				</tr>	
			<%	
				}
			%>
		</table>
	</center>
		
	
	
<%@include file="footer.jsp" %>
</body>
</html>