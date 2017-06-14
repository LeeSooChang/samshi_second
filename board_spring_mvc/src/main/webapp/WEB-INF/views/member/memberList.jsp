<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table align="center">
		<c:forEach var="member" items= "${ mlist}">
		<tr><td>이 름</td><td> ${member.name } </td></tr>
		<tr><td>아이디</td><td> ${ member.id }</td></tr>
		<tr><td>이메일</td><td> ${member.email } </td></tr>
		<tr><td>주소</td><td> ${member.address } </td></tr>
			</c:forEach>
	</table>
</body>
</html>