<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Index</title>
</head>
<body>
<jsp:include page="./layout/header.jsp"></jsp:include>
<c:if test="${ses.id ne null }">
	<h1>
		${ses.id } 님 안녕하세요.
	</h1>
	${ses.id } 님 이메일 : ${ses.email } <br>
	${ses.id } 님 가입 일자 : ${ses.reg_date }
</c:if>
<c:if test="${ses.id eq null }">
	<h1>Hello World</h1>
</c:if>

<P> My Spring Project </P>

<script type="text/javascript">
const no = `<c:out value="${no}" />`;
const logout = `<c:out value="${logout}" />`;
if(no==1){
	alert("로그인 실패");
}
if(logout==1){
	alert("로그아웃 성공")
}
</script>
<jsp:include page="./layout/footer.jsp"></jsp:include>
</body>
</html>
