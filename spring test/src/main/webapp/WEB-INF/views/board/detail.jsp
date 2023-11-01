<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>
<c:set value="${BoardDTO.bvo }" var="detail"></c:set>
	<table class="table table-hover">
		<tr>
			<th>#</th>
			<td>${detail.bno }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${detail.title }</td>
		</tr>
		<tr>
			<th>작성지</th>
			<td>${detail.writer }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${detail.registerDate }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${detail.content }</td>
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
					<div>
						<div>${fvo.uuid }${fvo.file_name }</div>
						${fvo.reg_date } <span>${fvo.file_size } Byte</span>
					</div></li>
			</c:forEach>
		</ul>
	</div>
	<a href="/board/modify?bno=${detail.bno }"><button type="button">수정</button></a>
	<a href="/board/remove?bno=${detail.bno }"><button type="button">삭제</button></a>
	<a href="/board/list">리스트로 이동</a>
	
	<!-- comment line -->
	<div>
		<!-- 댓글 작성 라인 -->
		<div>
			<span id="cmtWriter">${ses.id }</span>
			<input type="text" id="cmtText" placeholder="댓등 입력">
			<button type="button" id="cmtPostBtn">댓글등록</button>
		</div>
		
		<!-- 댓글 표시 라인 -->
		<div>
			<ul id="cmtListArea">
				<li>
					<div>
						<div>Writer</div>
						Content
					</div>
					<span>Reg_Date</span>
				</li>
			</ul>
		</div>
	</div>
	<script type="text/javascript">
	const bnoVal = `<c:out value="${detail.bno}" />`;
	const writerVal = `<c:out value="${ses.id}" />`;
	console.log(bnoVal);
	</script>
	<script type="text/javascript" src="/resources/js/boardComment.js"></script>
	<script type="text/javascript">
		getCommentList(bnoVal);	
	</script>
	
	<jsp:include page="../layout/footer.jsp"></jsp:include>
	
</body>
</html>