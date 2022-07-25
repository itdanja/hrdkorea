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
		function examinput() {
			if( document.exam.sno.value =="" ){
				alert("학생번호가 입력되지 않았습니다.");
				document.exam.sno.focus();
				return false;
			}
			if( document.exam.ekor.value =="" ){
				alert("국어점수 입력되지 않았습니다.");
				document.exam.ekor.focus();
				return false;
			}
			if( document.exam.emath.value =="" ){
				alert("수학점수 입력되지 않았습니다.");
				document.exam.emath.focus();
				return false;
			}
			if( document.exam.eeng.value =="" ){
				alert("영어점수 입력되지 않았습니다.");
				document.exam.eeng.focus();
				return false;
			}
			if( document.exam.ehist.value =="" ){
				alert("역사점수 입력되지 않았습니다.");
				document.exam.ehist.focus();
				return false;
			}
			alert("학생 성적이 모두 입력되었습니다.");
			document.exam.submit();
		}
	</script>

	<%@include file="header.jsp" %>
	<center>
		<h5> 성적입력 </h5>
		<form name='exam' action="examinputcontroller.jsp" method="post">
			<table border = '1'>
				<tr> <td> 학번 </td> <td> <input type="text" name="sno"> </td> </tr>
				<tr> <td> 국어점수 </td> <td> <input type="text" name="ekor"> </td> </tr>
				<tr> <td> 수학점수 </td> <td> <input type="text" name="emath"> </td> </tr>
				<tr> <td> 영어점수 </td> <td> <input type="text" name="eeng"> </td> </tr>
				<tr> <td> 역사점수 </td> <td> <input type="text" name="ehist"> </td> </tr>
				<tr> <td colspan ="2"> 
					<center>
					<button type="button" onclick="examinput();">등록하기</button> 
					</center>
					</td> 
				</tr>
			</table>
		</form>
	</center>
	
	<%@include file="footer.jsp" %>

</body>
</html>