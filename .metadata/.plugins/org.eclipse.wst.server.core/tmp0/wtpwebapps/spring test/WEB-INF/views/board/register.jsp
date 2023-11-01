<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<h2>게시글 등록</h2>
	<!-- mapping 상태는 get / post가 별도의 mapping을 가짐 -->
	<form action="/board/register" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th>title</th>
				<td>
					<input type="text" name="title">
				</td>
			</tr>
			<tr>
				<th>writer</th>
				<td>
					<input type="text" name="writer" value="${ses.id }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>content</th>
				<td>
					<textarea rows="5" cols="50" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<th>file</th>
				<td>
					<input type="file" id="file" name="files" multiple="multiple" style="display:none">
				</td>
			</tr>
		</table>
			<button type="button" id="trigger">FileUpload</button><br>
			<div id="fileZone">
				
			</div>
			<button type="submit" id="regBtn">등록</button>
	</form>
	<br><br>
	<a href="/">
		<button type="button">취소</button>
	</a>
	<a href="/board/list">
		<button type="button">리스트로 이동</button>
	</a>
	<script type="text/javascript" src="/resources/js/boardRegister.js"></script>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>