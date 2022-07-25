<%@page import="DTO.ExamDto"%>
<%@page import="DAO.Dao"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
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
	
	<center>
		<h5> 학생 성적 </h5>
	
		<table border = "1" width="600px">
		<%
			Dao dao = new Dao();
			ArrayList<  ExamDto > list =  dao.getexamlist();
			double[] 누적총합계 = { 0 , 0, 0, 0, 0, 0 };
			double[] 누적평균 = { 0 , 0, 0, 0, 0, 0 };
			double 점수존재하는학생수 = 0.0;
		%>
			<tr>
				<td>학년</td><td>반</td><td>번호</td><td>이름</td>
				<td>국어</td><td>수학</td><td>영어</td><td>역사</td>
				<td>합계</td><td>평균</td><td>순위</td>
			</tr>
		<% for( ExamDto dto : list  ){
			누적총합계[0] += dto.get국어();
			누적총합계[1] += dto.get수학();
			누적총합계[2] += dto.get영어();
			누적총합계[3] += dto.get역사();
			누적총합계[4] += dto.get합계();
			누적총합계[5] += dto.get평균();
			if( dto.get국어() == 0 ){ 
			
		%>
			<tr>
				<td><%=dto.get학년() %></td>
				<td><%=dto.get반() %></td>
				<td><%=dto.get번호() %></td>
				<td><%=dto.get이름() %></td>
				<td></td><td></td><td></td><td></td><td></td><td></td><td></td>
			</tr>
			<%	
				continue;
				
			}else{
				점수존재하는학생수++;
		%>
			<tr>
				<td><%=dto.get학년() %></td>
				<td><%=dto.get반() %></td>
				<td><%=dto.get번호() %></td>
				<td><%=dto.get이름() %></td>
				<td><%=dto.get국어() %></td> <td><%=dto.get수학() %></td> <td><%=dto.get영어() %></td>
				<td><%=dto.get역사() %></td> <td><%=dto.get합계() %></td> <td><%=dto.get평균() %></td> <td><%=dto.get순위() %></td>
			</tr>
		<%}} %>
		<tr>
			<td colspan="4"> 총합 </td> 
			<% 
				DecimalFormat df = new DecimalFormat("#.#");
				for( int i = 0 ; i<6 ; i++){ 
			%>
					<td> <%= df.format( 누적총합계[i] ) %></td>
				<%} %>
			<td></td>
		</tr>
		<tr>
			<td colspan="4"> 평균 </td> 
			<%
				df = new DecimalFormat("#.#");
				for( int i = 0 ; i<6 ; i++){
					누적평균[i] = 누적총합계[i] / 점수존재하는학생수;
				%>
					<td> <%=df.format(누적평균[i]) %></td>
				<%
					
				}
			%>
			<td></td>
		</tr>
		</table>
	
	</center>
	
	
	
	
	<%@include file="footer.jsp" %>
</body>
</html>