<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>로그인 | myBudget</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/@tabler/[email protected]/dist/css/tabler.min.css">
</head>

<body class="d-flex flex-column">

<div class="page page-center">

    <div class="container container-tight py-4">

        <div class="text-center mb-4">
            <a href="<%= request.getContextPath() %>/board/main"
               class="navbar-brand navbar-brand-autodark">

                <span class="fs-1 fw-bold text-primary">
                    myBudget
                </span>

            </a>

            <div class="text-secondary mt-2">
                나의 소비와 자산을 한눈에 관리하세요.
            </div>
        </div>

        <form class="card card-md"
              action="<%= request.getContextPath() %>/user/login"
              method="post">

            <div class="card-body">

                <h2 class="card-title text-center mb-4">
                    로그인
                </h2>

                <% if (request.getAttribute("errorMessage") != null) { %>
                    <div class="alert alert-danger" role="alert">
                        <%= request.getAttribute("errorMessage") %>
                    </div>
                <% } %>

                <div class="mb-3">
                    <label class="form-label" for="loginId">
                        아이디
                    </label>

                    <input type="text"
                           class="form-control"
                           id="loginId"
                           name="loginId"
                           placeholder="아이디를 입력하세요"
                           autocomplete="username"
                           required>
                </div>

                <div class="mb-2">
                    <label class="form-label" for="password">
                        비밀번호
                    </label>

                    <input type="password"
                           class="form-control"
                           id="password"
                           name="password"
                           placeholder="비밀번호를 입력하세요"
                           autocomplete="current-password"
                           required>
                </div>

                <div class="form-footer">
                    <button type="submit"
                            class="btn btn-primary w-100">
                        로그인
                    </button>
                </div>

            </div>
        </form>

        <div class="text-center text-secondary mt-3">
            아직 회원이 아니신가요?

            <a href="<%= request.getContextPath() %>/user/join"
               tabindex="-1">
                회원가입
            </a>
        </div>

        <div class="alert alert-secondary mt-4 mb-0">
            <strong>임시 테스트 계정</strong><br>
            아이디: admin<br>
            비밀번호: 1234
        </div>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/@tabler/[email protected]/dist/js/tabler.min.js"></script>

</body>
</html>