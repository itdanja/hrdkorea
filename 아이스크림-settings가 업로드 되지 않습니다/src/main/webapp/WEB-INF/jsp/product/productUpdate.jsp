<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보 수정</title>
</head>
<body>
	<div>상품 정보 수정 페이지입니다.</div>
	<br />
	<form:form commandName="productInfo">
		<div>
			<spring:message code="product.id" /> : <form:input path="id" readOnly="true" />
		</div>
		<br>
		<div>
			<spring:message code="product.name" /> : <form:input path="name" />
		</div>
		<br>
		<div>
			<spring:message code="product.price" /> : <form:input path="price" />
		</div>
		<br>
		<div>
			<spring:message code="product.type" /> : <form:input path="type" />
		</div>
		<br>
		<div>
			<spring:message code="product.manufacturer" /> : <form:input path="manufacturer" />
		</div>
		<br>
		<div>
			<input type="submit" value="<spring:message code="product.submit" />">
		</div>
	</form:form>
</body>
</html>