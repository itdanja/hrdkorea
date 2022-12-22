<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 검색 결과</title>
</head>
<body>
	<br />[상품 검색 결과 페이지]
	<a href="productList.do?">돌아가기</a>
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
			<c:forEach items="${searchingList}" var="searchinfo">
				<tr>
					<td><a href="javascript:getProductInfo('${searchinfo.id}')">${searchinfo.id}</a></td>
					<td>${searchinfo.name}</td>
					<td>${searchinfo.price}</td>
					<td>${searchinfo.type}</td>
					<td>${searchinfo.manufacturer}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>