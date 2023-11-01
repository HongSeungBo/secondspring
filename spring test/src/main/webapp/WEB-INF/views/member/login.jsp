<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>
<h3> 로 그 인 </h3>
<form action="/member/login" method="post">
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
</table>
	<button type="submit">로그인</button>
</form>
<a href="/member/signUp"><button>회원가입</button></a><br>
<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>