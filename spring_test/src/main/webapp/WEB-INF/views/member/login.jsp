<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../layout/header.jsp"></jsp:include>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<div class="container-md">
	<br>
	<h2>로그인</h2>
	<br>
	<form action="/member/login" method="post" id="form">
		<div class="mb-3" style="display: flex; text-align: center">
			<label for="email" class="form-label">아이디</label>
			<br>
			<input type="email" name="email" class="form-control" id="email" placeholder="이메일" style="width: 200px">
		</div>
		<div class="mb-3" style="display: flex">
			<label for="pwd" class="form-label">비밀번호</label>
			<input type="password" name="pwd" class="form-control" id="pwd" placeholder="비밀번호" style="width: 150px">
		</div>
		<button type="submit" class="btn btn-primary" id="submitBtn">로그인</button>
		<a href="/board/index"><button type="button" class="btn btn-dark">돌아가기</button></a>
	</form>
</div>

<script type="text/javascript">
	const modify_msg = `<c:out value="${modify_msg }" />`;
	console.log(modify_msg);
	if(modify_msg == '1'){
		alert('회원정보가 수정되었습니다. 다시 로그인해주세요.');
	}
	
	const fail_msg = `<c:out value="${fail_msg }" />`;
	if(fail_msg == '1'){
		alert('아이디나 비밀번호가 잘못되었습니다. 다시 시도해주세요.');
	}
	
	const delete_msg = `<c:out value="${delete_msg }" />`;
	if(delete_msg == '1'){
		alert('회원탈퇴가 정상적으로 진행되었습니다.');
	}
</script>


<jsp:include page="../layout/footer.jsp"></jsp:include>