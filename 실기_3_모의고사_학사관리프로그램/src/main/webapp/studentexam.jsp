<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
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
	
	<center>
		<h5> 학생 성적 </h5>
	
		<table border = "1">
		<%
			Dao dao = new Dao();
			ArrayList<  Map< String , String > > list =  dao.getexamlist();
			double[] 누적총합계 = { 0 , 0, 0, 0, 0, 0 };
			double 점수존재하는학생수 = 0.0;
		%>
			
		<% for( Map<String , String > map : list  ){ 
			누적총합계[0] += Double.parseDouble( map.get("국어") ); 
			누적총합계[1] += Double.parseDouble( map.get("수학") ); 
			누적총합계[2] += Double.parseDouble( map.get("영어") ); 
			누적총합계[3] += Double.parseDouble( map.get("역사") ); 
			누적총합계[4] += Double.parseDouble( map.get("합계") ); 
			누적총합계[5] += Double.parseDouble( map.get("평균") ); 
			String 국어 = ""; if( !map.get("국어").equals("0") ) 국어= map.get("국어");
			String 수학 = ""; if( !map.get("수학").equals("0") ) 수학= map.get("수학");
			String 영어 = ""; if( !map.get("영어").equals("0") ) 영어= map.get("영어");
			String 역사 = ""; if( !map.get("역사").equals("0") ) 역사= map.get("역사");
			String 합계 = ""; if( !map.get("합계").equals("0") ) 합계= map.get("합계");
			String 평균 = ""; if( !map.get("평균").equals("0") ) { 평균= map.get("합계"); 점수존재하는학생수++;}
			String 순위 = ""; if( !map.get("평균").equals("0") ) 순위= map.get("순위");
		%>
			<tr>
				<td><%=map.get("학년") %></td>
				<td><%=map.get("반") %></td>
				<td><%=map.get("번호") %></td>
				<td><%=map.get("이름") %></td>
				<td><%=국어 %></td> <td><%=수학 %></td> <td><%=영어 %></td>
				<td><%=역사 %></td> <td><%=합계 %></td> <td><%=평균 %></td> <td><%=순위 %></td>
			</tr>
		<%} %>
		<tr>
			<td colspan="4"> 총합 </td> 
			<td> <%= 누적총합계[0]%></td>
			<td> <%= 누적총합계[1]%></td>
			<td> <%= 누적총합계[2]%></td>
			<td> <%= 누적총합계[3]%></td>
			<td> <%= 누적총합계[4]%></td>
			<td> <%= 누적총합계[5]%></td>
			<td></td>
		</tr>
		<tr>
			<td colspan="4"> 평균 </td> 
			<td> <%= 누적총합계[0]/점수존재하는학생수 %></td>
			<td> <%= 누적총합계[1]/점수존재하는학생수 %></td>
			<td> <%= 누적총합계[2]/점수존재하는학생수 %></td>
			<td> <%= 누적총합계[3]/점수존재하는학생수 %></td>
			<td> <%= 누적총합계[4]/점수존재하는학생수 %></td>
			<td> <%= 누적총합계[5]/점수존재하는학생수 %></td>
			<td></td>
		</tr>
		</table>
	
	</center>
	
	
	
	
	<%@include file="footer.jsp" %>
</body>
</html>