<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<c:set value="${BoardDTO.bvo }" var="detail"></c:set>
	<form action="#" method="post" enctype="multipart/form-data">
		<table class="table table-hover">
			<tr>
				<th>#</th>
				<td><input type="text" name="bno" value="${detail.bno }"
					readonly="readonly"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" value="${detail.title }">
				</td>
			</tr>
			<tr>
				<th>작성지</th>
				<td><input type="text" name="writer" value="${detail.writer }"
					readonly="readonly"></td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${detail.registerDate }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="5" cols="50" name="content"
						value="${detail.content }"></textarea></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${detail.read_count }</td>
			</tr>
		</table>
		<c:set value="${BoardDTO.flist }" var="flist"></c:set>
		<div>
			<ul>
				<c:forEach items="${flist }" var="fvo">
					<li><c:choose>
							<c:when test="${fvo.file_type>0 }">
								<div>
									<img alt="그림없음."
										src="/upload/${fn:replace(fvo.save_dir,'\\','/') }/${fvo.uuid}_th_${fvo.file_name}">
								</div>
							</c:when>
							<c:otherwise>
								<div>
									<!-- file 아이콘 같은 모양 값으로 넣을 수 있음 -->
								</div>
							</c:otherwise>
						</c:choose>
						<div>${fvo.file_name }</div>
						<button type="button" class="file-x" data-uuid="${fvo.uuid }">X</button>
					</li>
				</c:forEach>
			</ul>
		</div>
		<!-- 파일 수정 라인 -->
		file <input type="file" id="file" name="files" multiple="multiple" style="display:none">
			<button type="button" id="trigger">FileUpload</button><br>
			<div id="fileZone">
				
			</div>
		<button type="submit" id="regBtn">수정</button>
	</form>
	<a href="/board/list"><button type="button">취소</button></a>
	<script type="text/javascript">
	const bnoVal = `<c:out value="${detail.bno}" />`;
	console.log(bnoVal);
	</script>
	<script type="text/javascript" src="/resources/js/boardModify.js"></script>
	<script type="text/javascript" src="/resources/js/boardRegister.js"></script>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>