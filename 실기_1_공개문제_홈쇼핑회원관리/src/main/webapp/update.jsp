<%@page import="DTO.MemberDTO"%>
<%@page import="DAO.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<script type="text/javascript">
	
		function joinchk() {
			
			// 회원성명
			if( document.join.custname.value == ""){
				// 문서.폼이름.input이름.값 이 공백이면 
				alert("회원성명를 입력해주세요"); // 알림
				document.join.custname.focus(); // 포커스[커서]
				return false; // 폼 전송 불가 
			}
			// 회원전화
			if( document.join.phone.value == ""){
				alert("회원전화를 입력해주세요"); // 알림
				document.join.phone.focus(); // 포커스[커서]
				return false; // 폼 전송 불가 
			}
			// 회원주소
			if( document.join.address.value == ""){
				alert("회원주소를 입력해주세요"); // 알림
				document.join.address.focus(); // 포커스[커서]
				return false; // 폼 전송 불가 
			}
			// 가입일자
			if( document.join.joindate.value == ""){
				alert("가입일자를 입력해주세요"); // 알림
				document.join.joindate.focus(); // 포커스[커서]
				return false; // 폼 전송 불가 
			}
			// 고객등급
			if( document.join.grade.value == ""){
				alert("고객등급를 입력해주세요"); // 알림
				document.join.grade.focus(); // 포커스[커서]
				return false; // 폼 전송 불가 
			}
			// 도시코드
			if( document.join.city.value == ""){
				alert("도시코드을 입력해주세요"); // 알림
				document.join.city.focus(); // 포커스[커서]
				return false; // 폼 전송 불가 
			}
			// 모두 다 입력했으면 
			alert("회원수정이 완료되었습니다.");
			document.join.submit(); // 폼 전송 
			
		}
		
	
	</script>


	<%@include file = "header.jsp" %>
	
	<%
		MemberDao memberDao = new MemberDao();	// db 객체 선언 
		String custno = request.getParameter("custno");
		MemberDTO dto = memberDao.getmember(custno);
	
	%>
	
	<center>
		<h2> 홈쇼핑 회원 정보 수정</h2>
		<form action="updateController.jsp" method="post" name="join">
		
			<table>
				<tr>
					<td> 회원번호(자동발생) </td>
					<td> <input type="text" name="custno" value="<%= dto.getCustno()%>">
				</tr>
				
				<tr>
					<td> 회원성명 </td>
					<td> <input type="text" name="custname" value="<%= dto.getCustname()%>">
				</tr>
				
				<tr>
					<td> 회원전화 </td>
					<td> <input type="text" name="phone" value="<%= dto.getPhone()%>">
				</tr>
				
				
				<tr>
					<td> 회원주소 </td>
					<td> <input type="text" name="address" value="<%= dto.getAddress()%>">
				</tr>
				
				<tr>
					<td> 가입일자 </td>
					<td> <input type="text" name="joindate" value="<%= dto.getJoindate().split(" ")[0]%>">
				</tr>
				
				<tr>
					<td> 고객등급[ A:VIP , B:일반 , C:직원] </td>
					<td> <input type="text" name="grade" value="<%= dto.getGrade()%>">
				</tr>
				
				<tr>
					<td> 도시코드 </td>
					<td> <input type="text" name="city" value="<%= dto.getCity()%>">
				</tr>				
				<tr>
					<td colspan="2">
						<center>
							<input type="button" value="등록" onclick="joinchk();">
							<a href="memberlist.jsp"><button type="button">조회</button></a> 
						</center>
					</td>
				</tr>
				
			</table>
		
		</form>
	
	</center>
	
		<%@include file = "footer.jsp" %>
	

</body>
</html>