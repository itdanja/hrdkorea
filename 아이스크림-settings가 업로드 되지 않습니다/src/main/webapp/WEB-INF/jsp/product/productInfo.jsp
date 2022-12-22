<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 정보</title>
<script type="text/javascript">
	function getProductUpdate(id) {
		location.href = "productUpdate.do?pkid=" + id;
	}
	function getProductDel(id) {
		location.href = "productDelete.do?pkid=" + id;
	}
</script>
</head>
<body>
	<div>상품 상세 정보 보기 페이지입니다.</div><br/>
	<div>
		<spring:message code="product.id" /> : <input type="text" value="${productinfo.id}" disabled="disabled" />
	</div>
	<br>
	<div>
		<spring:message code="product.name" /> : <input type="text" value="${productinfo.name}" disabled="disabled" />
	</div>
	<br>
	<div>
		<spring:message code="product.price" /> : <input type="text" value="${productinfo.price}" disabled="disabled" />
	</div>
	<br>
	<div>
		<spring:message code="product.type" /> : <input type="text" value="${productinfo.type}" disabled="disabled" />
	</div>
	<br>
	<div>
		<spring:message code="product.manufacturer" /> : <input type="text" value="${productinfo.manufacturer}" disabled="disabled" />
	</div>
	<br>
	<a href="javascript:getProductUpdate('${productinfo.id}')">수정</a>
	<a href="javascript:getProductDel('${productinfo.id}')">삭제</a>
</body>
</html>