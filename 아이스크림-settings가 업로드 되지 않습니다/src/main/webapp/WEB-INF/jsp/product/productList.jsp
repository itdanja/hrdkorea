<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록 보기</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script language="javascript" type="text/javascript">
	function getProductInfo(id) {
		//받아온 id로 조합해서 productInfo로 넘겨줌
		location.href = "productInfo.do?pkid=" + id;
	}

	$(document).on('click', '#btnSearch', function(e) {
		e.preventDefault();
		var url = "${path}/BAS-2016316016-TotalLab/searchProduct.do";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		location.href = url;
		console.log(url);
	});
</script>
</head>
<body>
	<br />[상품 목록 보기 페이지]
	<a href='<c:url value="/index.jsp"/>'>돌아가기</a>
	<br /> 환영합니다!
	<br />
	<br />
	<table border="1">
		<thead>
			<tr>
				<th width="80"><spring:message code="product.id"></spring:message></th>
				<th width="300"><spring:message code="product.name"></spring:message></th>
				<th width="80"><spring:message code="product.price"></spring:message></th>
				<th width="110"><spring:message code="product.type"></spring:message></th>
				<th width="150"><spring:message code="product.manufacturer"></spring:message></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${productlist}" var="proinfo">
				<tr>
					<!-- id 값에 링크를 걸기 - id를 누르면 상세 정보가 나오도록, javascript 사용하여 다이나믹하게 -->
					<!-- proinfo.id에 링크를 걸거고 누르면 javascript인 getProductInfo 메소드가 실행될 것이며 proinfo.id를 인자로 넘길 것이다 -->
					<td><a href="javascript:getProductInfo('${proinfo.id}')">${proinfo.id}</a></td>
					<td>${proinfo.name}</td>
					<td>${proinfo.price}</td>
					<td>${proinfo.type}</td>
					<td>${proinfo.manufacturer}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 검색 기능 -->
	<div class="form-group row justify-content-center">
		<select class="form-control form-control-sm" name="searchType"
			id="searchType">
			<option value="id">아이디</option>
			<option value="name">제품명</option>
			<option value="price">가격</option>
			<option value="type">제형</option>
			<option value="manufacturer">제조사</option>
		</select> <input type="text" class="form-control form-control-sm"
			name="keyword" id="keyword">
		<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
	</div>


</body>
</html>