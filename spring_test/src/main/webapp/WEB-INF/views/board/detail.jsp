<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<jsp:include page="../layout/header.jsp"></jsp:include>

<c:set value="${bdto.bvo }" var="bvo"></c:set>
<div class="container">
	<h1>상세게시판</h1>
	<sec:authentication property="principal.mvo.email" var="authEmail"/>
	<sec:authentication property="principal.mvo.nickName" var="authNick"/>
	<section class="bbs-wrap">
		<div class="bbs-info">
			<p>게시물번호 : ${bvo.bno}</p>
			<h2>${bvo.title }</h2>
			<ul>
				<li>작성자 : ${bvo.writer }</li>
				<li>등록일 : ${bvo.regAt }</li>
			</ul>
		</div>
		<div class="bbs-content">
			<div>
				${bvo.content }
			</div>
			<div class="attachments">
				<h4>첨부파일</h4>
			<c:set value="${bdto.flist }" var="flist"></c:set>
			<ul class="list-group">
			<c:forEach items="${flist }" var="fvo">
	 			 <li class="list-group-item">
	 			 	<c:choose>
	 			 		<c:when test="${fvo.fileType == 1 }">
	 			 			<div>
	 			 				<img alt="" src="/upload/${fvo.saveDir }/${fvo.uuid}_th_${fvo.fileName}">
	 			 			</div>
							<div class="fw-bold">${fvo.fileName }</div>
	 			 		<span class="badge rounded-pill text-bg-light">${fvo.fileSize }Byte</span>
	 			 		</c:when>
	 			 		<c:otherwise>
							<!-- 일반 파일 표시할 아이콘 -->
							<span class="fw-bold"><a href="/upload/${fvo.saveDir }/${fvo.uuid}_${fvo.fileName}" download="다운로드_테스트">
									${fvo.fileName}
								</a></span>
	 			 		<span class="badge rounded-pill text-bg-light">${fvo.fileSize }Byte</span>
	 			 		</c:otherwise>
	 			 	</c:choose>
	 			 	<!-- <div class="ms-2 me-auto">
	 			 		<div class="fw-bold">${fvo.fileName }</div>
	 			 		<span class="badge rounded-pill text-bg-secondary">${fvo.fileSize }Byte</span>
	 			 	</div> -->
	 			 </li>
			</c:forEach>
  		</ul>
			</div>
		</div>
		<div class="bbs-btn-list">
			<c:choose>
			<c:when test="${bvo.writer == authNick }">
				<a href="/board/modify?bno=${bvo.bno }"><button type="button" class="btn btn-primary">수정</button></a>
				<a id="delA"><button type="button" class="btn btn-danger delA">삭제</button></a>
			</c:when>
		</c:choose>
				<a href="/board/list"><button type="button" class="btn btn-dark">돌아가기</button></a>
		</div>
		<div class="bbs-reply">
			<h3>댓글</h3>
			<div class="reply-write">
				<div class="input-group mb-3">
					<span class="input-group-text" id="cmtWriter">${authNick }</span>
					<input type="text" class="form-control" id="cmtText" >
					<button type="button" class="btn btn-success" id="cmtPostBtn">등록</button>
				</div>
			</div>
			<ul class="list-group list-group-flush" id="cmtListArea">
			  <li class="list-group-item">
				  <div class="mb-3">
					<div class="reply-info">
						<span class="fw-bold">Writer</div>
						  <span class="badge rounded-pill text-bg-warning">modAt</span>
					</div>
					<p>Content</p>
				  </div>
			  </li>
			</ul>
				<!-- 댓글 더보기 버튼 -->
			<div>
				<button type="button" id="moreBtn" data-page="1" class="btn btn-outline-dark" style="visibility:hidden">더보기+</button>
			</div>
		</div>
	</section>

	<div class="modal" id="myModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">작성자</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="input-group mb-3">
					<input type="text" class="form-control" id="cmtTextMod">
				<button type="button" class="btn btn-warning" id="cmtModBtn">수정</button>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			</div>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
	const bnoVal = `<c:out value="${bvo.bno }" />`;
	const authEmail = `<c:out value="${authEmail }" />`;
	const authNick = `<c:out value="${authNick }" />`;
</script>

<script type="text/javascript">
	document.addEventListener('click', (e) =>{
		if(e.target.classList.contains('delA')){
			if(confirm('삭제하시겠습니까?')){
				document.getElementById('delA').setAttribute('href', '/board/remove?bno='+bnoVal);
			}
		}
	});
</script>

<script src="../resources/js/boardComment.js"></script>
<script type="text/javascript">
	spreadCommentList(bnoVal);
</script>


<jsp:include page="../layout/footer.jsp"></jsp:include>