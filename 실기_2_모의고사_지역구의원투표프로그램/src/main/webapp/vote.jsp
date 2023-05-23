<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp" %>
		<center>
			<h3> 투표하기 </h3>
			<form name="voteForm" method="post" action="/HRD_3/vote">
				<table border="1" style="border-collapse: collapse;" width="500px;">
					<tr>
						<th>주민번호</th> <td> <input type="text" name="v_jumin"> 예 : 8906153154726 </td>
					</tr>
					<tr>
						<th>성명</th> <td> <input type="text" name="v_name"> </td>
					</tr>
					<tr>
						<th>투표번호</th>
						<td>
						<select name="m_no">
							<option></option>
							<option value="1">[1]김후보</option>
							<option value="2">[2]이후보</option>
							<option value="3">[3]박후보</option>
							<option value="4">[4]조후보</option>
							<option value="5">[5]최후보</option>
						</select>		
						</td>
					</tr>
					<tr>
						<th>투표시간</th>
						<td>
						<input type="text" name="v_time" placeholder="예)0930">
						</td>
					</tr>
					<tr>
						<th>투표장소</th>
						<td>
						<input type="text" name="v_area" placeholder="예)제1투표장">
						</td>
					</tr>
					<tr>
						<th>유권자확인</th>
						<td>
						<input style="float:none;" type="radio" name="v_confirm" value="Y">확인 
						<input style="float:none;" type="radio" name="v_confirm" value="N">미확인
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:center">
							<input type="button" value="투표하기" onclick="vote()" />
							<input type="button" value="다시쓰기" onclick="voteReset()" />
						</td>
					</tr>
				</table>
			</form>
		</center>
	
	<%@ include file="footer.jsp" %>
	<script type="text/javascript" src="index.js"></script>
</body>
</html>