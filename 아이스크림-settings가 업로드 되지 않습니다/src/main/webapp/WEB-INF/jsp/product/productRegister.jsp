<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
</head>
<body>
<body>
	<div>[상품 등록 페이지]</div><br/>
	<!-- ProductController.java에서 넘겨준 인자와 매치되는 이름 productInfo -->
	<!-- path에 들어가 있는 이름들이 ProductVO.java의 변수들과 같아야만 한다. 그래야 자동 매칭된다. 매칭해주는것=springMVC -->
	<form:form commandName="productInfo">
		<div><spring:message code="product.id" /> : <form:input path="id" /></div>
		<br>
		<div><spring:message code="product.name" /> : <form:input path="name" /></div>
		<br>
		<div><spring:message code="product.price" /> : <form:input path="price" /></div>
		<br>
		<div><spring:message code="product.type" /> : <form:input path="type" /></div>
		<br>
		<div><spring:message code="product.manufacturer" /> : <form:input path="manufacturer" /></div>
		<br>
		<div><input type="submit" value="<spring:message code="product.submit" />"></div>
	</form:form><br/>
	<a href='<c:url value="/index.jsp"/>'>돌아가기</a>
</body>
</html>