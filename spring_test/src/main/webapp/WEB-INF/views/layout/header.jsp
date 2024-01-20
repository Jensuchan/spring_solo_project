<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <%@ page
language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Jensu's Spring Solo Project</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
            crossorigin="anonymous"
        />
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
            crossorigin="anonymous"
        ></script>
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0"
        />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&family=Roboto:wght@400;500;700&display=swap"
            rel="stylesheet"
        />
        <link rel="stylesheet" href="../../../resources/css/main.css" />
    </head>
    <body>
        <nav class="navbar navbar-expand-lg">
            <div class="container">
                <a class="navbar-brand" href="/">
                    <span class="icon material-symbols-outlined">
                        psychiatry
                    </span>
                    <span class="label">SPRING</span>
                </a>
                <!-- <button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button> -->
                <div
                    class="collapse navbar-collapse"
                    id="navbarSupportedContent"
                >
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-links" aria-current="page" href="/"
                                >Home</a
                            >
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/board/list"
                                >게시판 보기</a
                            >
                        </li>

                        <!-- 현재 인증한 사용자의 정보를 가져와서 해당 권한이 있는지 확인 -->
                        <!-- 현재 사용자의 정보는 principal  -->
                        <!-- anyMatch() : stream 매칭 메서드(최소한 1개의 요소가 주어진 조건에 맞는지 조사) -->

                        <sec:authorize access="isAuthenticated()">
                            <sec:authentication
                                property="principal.mvo.email"
                                var="authEmail"
                            />
                            <sec:authentication
                                property="principal.mvo.nickName"
                                var="authNick"
                            />
                            <sec:authentication
                                property="principal.mvo.authList"
                                var="auths"
                            />

                            <li class="nav-item">
                                <a class="nav-link" href="/board/register"
                                    >게시판글쓰기</a
                                >
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/member/detail"
                                    >내정보보기</a
                                >
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/member/logout"
                                    >로그아웃</a
                                >
                            </li>
                            <a href="/member/logout"
                                ><button
                                    type="button"
                                    hidden
                                    id="trigger"
                                ></button
                            ></a>
                        </sec:authorize>
                        <sec:authorize access="isAnonymous()">
                            <li class="nav-item">
                                <a class="nav-link" href="/member/register"
                                    >회원가입</a
                                >
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/member/login"
                                    >로그인</a
                                >
                            </li>
                        </sec:authorize>
                    </ul>
                </div>
            </div>
        </nav>
    </body>
</html>
