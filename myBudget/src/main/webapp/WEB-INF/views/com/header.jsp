<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>${pageTitle != null ? pageTitle : 'myBudget'}</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/@tabler/[email protected]/dist/css/tabler.min.css">
</head>

<body>

<div class="page">

    <header class="navbar navbar-expand-md navbar-light d-print-none">
        <div class="container-xl">

            <button class="navbar-toggler"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#navbar-menu">
                <span class="navbar-toggler-icon"></span>
            </button>

            <a class="navbar-brand" href="<%= request.getContextPath() %>/board/main">
                myBudget
            </a>

            <div class="navbar-nav flex-row order-md-last">

                <div class="nav-item">
                    <span class="nav-link">
					    <span class="avatar avatar-sm me-2 bg-primary-lt">
					        MB
					    </span>
					    ${sessionScope.loginUser}님
					</span>
                </div>

                <div class="nav-item">
                    <a class="nav-link"
					   href="<%= request.getContextPath() %>/user/logout">
					    로그아웃
					</a>
                </div>

            </div>

        </div>
    </header>