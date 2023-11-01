<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>
<h3> 회 원 가 입 </h3>
<form action="/member/signUp" method="post">
<table>
	<tr>
		<th>ID</th>
		<td>
			<input type="text" name="id" placeholder="아이디">
		</td>
	</tr>
	<tr>
		<th>PW</th>
		<td>
			<input type="password" name="pw" placeholder="비밀번호">
		</td>
	</tr>
	<tr>
		<th>Name</th>
		<td>
			<input type="text" name="name" placeholder="이름">
		</td>
	</tr>
	<tr>
		<th>Email</th>
		<td>
			<input type="text" name="email" placeholder="이메일">
		</td>
	</tr>
	<tr>
		<th>Home</th>
		<td>
			<input type="text" name="home" placeholder="주소">
		</td>
	</tr>
	<tr>
		<th>Age</th>
		<td>
			<input type="text" name="age" placeholder="나이">
		</td>
	</tr>
</table>
<button type="submit">회원가입</button>
<a href="/"><button type="button">취소</button></a>
</form>

<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>