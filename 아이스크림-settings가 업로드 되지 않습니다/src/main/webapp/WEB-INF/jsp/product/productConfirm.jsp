<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 완료</title>
</head>
<body>
	<div>ID : ${id}</div>
	<div>Name : ${name}</div>
	<div>Price : ${price}</div>
	<div>Type : ${type}</div>
	<div>Manufacturer : ${manufacturer}</div>
	<br/>
	<div>상품이 등록되었습니다. 감사합니다.</div>
	<a href="productList.do?">돌아가기</a>
</body>
</html>