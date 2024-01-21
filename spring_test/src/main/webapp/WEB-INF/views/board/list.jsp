<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<jsp:include page="../layout/header.jsp"></jsp:include>




<div class="container">
	<h1>전체게시판</h1>
	<sec:authentication property="principal.mvo.email" var="authEmail" />
	<sec:authentication property="principal.mvo.nickName" var="authNick" />
	<section class="bbs-wrap">
		<div class="search-box">
		<form action="#" method="get">
			<div class="input-group mb-3">
				<select class="form-select" name="type" id="inputGroupSelect01">
					<option ${ph.pgvo.type == null ? 'selected': '' }>검색조건</option>
					<option value="t" ${ph.pgvo.type eq 't' ? 'selected': '' }>제목</option>
					<option value="w" ${ph.pgvo.type eq 'w' ? 'selected': '' }>작성자</option>
					<option value="c" ${ph.pgvo.type eq 'c' ? 'selected': '' }>내용</option>
					<option value="tw" ${ph.pgvo.type eq 'tw' ? 'selected': '' }>제목+작성자</option>
					<option value="tc" ${ph.pgvo.type eq 'tc' ? 'selected': '' }>제목+내용</option>
					<option value="wc" ${ph.pgvo.type eq 'wc' ? 'selected': '' }>작성자+내용</option>
					<option value="twc" ${ph.pgvo.type eq 'twc' ? 'selected': '' }>전체</option>
				</select>
				<input type="hidden" name="pageNo" value="1">
				<input type="hidden" name="qty" value="${ph.pgvo.qty }">
				<input class="form-control me-2" name="keyword" value="${ph.pgvo.keyword }" type="search" placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-dark" type="submit">Search</button>
				<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">${ph.totalCount }
	   			<span class="visually-hidden">unread messages</span></span>
			</div>
		</form>
		</div>

		<div class="bbs-list">
			<table class="table table-striped table-custom table-primary">
				<colgroup>
					<col width="5%" />
					<col width="*" />
					<col width="10%" />
					<col width="10%" />
					<col width="15%" />
					<col width="10%" />
				</colgroup>
				<thead >
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>파일수</th>
						<th>등록일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach	items="${list }" var="bvo">
					<tr>
						<td>${bvo.bno }</td>
						<td><a href="/board/detail?bno=${bvo.bno }">${bvo.title } 
							<span class="comment">
								<span class="icon material-symbols-outlined">comment</span>
								<span class="value">${bvo.cmtQty}</span>
							</span></a>
						</td>
						<td>${bvo.writer }</td>
						<td>
							<span class="attachment">
								<span class="icon material-symbols-outlined">attach_file</span>
								<span class="value">${bvo.hasFile }</span>
							</span>
						</td>
						<td>${bvo.regAt }</td>
						<td>${bvo.readCount }</td>
					</tr>
				</c:forEach>
			</tbody>
			</table>
		</div>

		<div class="pagination-wrap">
			<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
			<!-- 이전 -->
				<li class="page-item ${ph.prev eq false ? 'disabled' : '' }">
				<a class="page-link" href="/board/list?pageNo=${ph.startPage-1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
				</a>
				</li>
				
				<!-- 페이지 번호 -->
				<c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i">
					<li class="page-item"><a class="page-link" href="/board/list?pageNo=${i }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">${i }</a></li>    
				</c:forEach>
				
				<!-- 다음 -->
				<li class="page-item ${ph.next eq false ? 'disabled' : ''}">
				<a class="page-link" href="/board/list?pageNo=${ph.endPage+1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}" aria-label="Next">
					<span aria-hidden="true">&raquo;</span>
				</a>
				</li>
				<li class="page-item"><a class="page-link" href="/board/list">처음으로</a></li>
			</ul>
			</nav>
		</div>
	</section>
</div>


<jsp:include page="../layout/footer.jsp"></jsp:include>