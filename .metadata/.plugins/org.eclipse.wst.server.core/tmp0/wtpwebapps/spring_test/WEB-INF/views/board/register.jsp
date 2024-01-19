<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<jsp:include page="../layout/header.jsp"></jsp:include>


<div class="container">
	<h1>게시물 등록하기</h1><br>
	<sec:authentication property="principal.mvo.email" var="authEmail"/>
	<sec:authentication property="principal.mvo.nickName" var="authNick"/>
	<form action="/board/register" method="post" enctype="multipart/form-data">
		<div class="mb-3">
			<label for="title" class="form-label">제목</label>
			<input type="text" name="title" class="form-control" id="title" placeholder="제목">
		</div>
		<div class="mb-3">
			<label for="writer" class="form-label">작성자</label>
			<input type="text" name="writer" class="form-control" id="writer" value="${authNick }" readonly="readonly" style="font-weight: bold">
		</div>
		<div class="mb-3">
			<label for="content" class="form-label">내용</label>
 			<textarea class="form-control" name="content" id="content" rows="3" placeholder="내용"></textarea>
		</div>
		<div class="mb-3">
			<input type="file" name="files" class="form-control" id="files" multiple style="display: none"> <br>
			<button type="button" class="btn btn-warning" id="trigger">사진등록</button>
		</div> 
		<!-- 파일 목록 표시라인 -->
 		<div class="mb-3" id="fileZone"></div> 
		<br>
		<button type="submit" class="btn btn-primary" id="regBtn">등록</button>
		<a href="/"><button type="button" class="btn btn-dark">취소</button></a>
	</form>

</div>

<script src="../resources/js/boardRegister.js"></script>

<jsp:include page="../layout/footer.jsp"></jsp:include>