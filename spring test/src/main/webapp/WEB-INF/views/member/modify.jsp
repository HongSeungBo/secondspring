<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>

<form action="/member/modify" method="post">
	<table class="table table-hover">
		<tr>
			<th>아이디</th>
			<td>${ses.id }
			<input type="hidden" name="id" value="${ses.id }">
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="text" name="pw"  placeholder="비밀번호 새로 입력">
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>
				<input type="text" name="name" value="${ses.name }" readonly="readonly">
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
				<input type="text" name="email" value="${ses.email }">
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<input type="text" name="home" value="${ses.home }">
			</td>
		</tr>
		<tr>
			<th>나이</th>
			<td>
				<input type="text" name="age" value="${ses.age }" readonly="readonly">
			</td>
		</tr>
	</table>
	<button type="submit">수정</button>
	<a href="/"><button type="button">취소</button></a>
</form>

<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>