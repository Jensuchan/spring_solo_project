<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../layout/header.jsp"></jsp:include>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<div class="container-md">
	<br>
	<h2>회원 리스트</h2>
	<br>
	<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">이메일</th>
      <th scope="col">닉네임</th>
      <th scope="col">가입날짜</th>
	  <th scope="col">최근접속일</th>
      <th scope="col">권한</th>
    </tr>
  </thead>
  <tbody>
  	<c:forEach items="${list }" var="mvo" varStatus="i">
    <tr>
      <th scope="row">${i.count }</th>
      <td>${mvo.email }</td>
      <td>${mvo.nickName }</td>
      <td>${mvo.regAt}</td>
      <td>${mvo.lastLogin }</td>
      <c:choose>
      	<c:when test="${mvo.authList.size() > 1 }">
      		<td>관리자</td>
      	</c:when>
      	<c:otherwise>
      		<td>유저</td>
      	</c:otherwise>
      </c:choose>
    </tr>
    </c:forEach>
  </tbody>
</table>

	
	
	
	
</div>	
	
	
<jsp:include page="../layout/header.jsp"></jsp:include>