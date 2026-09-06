<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>가계부</title>
    
    <!-- MatDash CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.min.css" />
    
    <style>
        /* 사이드바 영역 확보 */
        .left-sidebar {
            width: 150px;
        }
        
        .body-wrapper {
            margin-left: 150px;
        }
        
        @media (max-width: 992px) {
            .body-wrapper {
                margin-left: 0;
            }
        }
    </style>
</head>
<body>
    <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="false" data-theme="light" data-sidebar-position="fixed" data-header-position="fixed">
        
        <!-- 헤더 -->
        <header class="topbar" data-navbarbg="false">
            <nav class="navbar-top navbar-expand-lg">
                <div class="navbar-collapse justify-content-between">
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/">
                        <img src="${pageContext.request.contextPath}/assets/images/logos/dark-logo.svg" alt="가계부" />
                    </a>
                    
                    <div class="d-flex align-items-center">
                        <span class="me-3">
                            ${sessionScope.loginUser}님 환영합니다
                        </span>
                        <a href="${pageContext.request.contextPath}/user/logout" class="btn btn-outline-danger btn-sm">
                            로그아웃
                        </a>
                    </div>
                </div>
            </nav>
        </header>
        
        <!-- 사이드바 -->
        <aside class="left-sidebar with-vertical">
            <div class="left-sidebar" data-sidebarbg="dark">
                <nav class="sidebar-nav">
                    <ul class="sidebar-menu">
                        <li class="sidebar-item">
                            <a href="${pageContext.request.contextPath}/trx/list" class="sidebar-link">
                                <span>거래내역</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a href="${pageContext.request.contextPath}/trx/income" class="sidebar-link">
                                <span>수입 등록</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a href="${pageContext.request.contextPath}/trx/expense" class="sidebar-link">
                                <span>지출 등록</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a href="${pageContext.request.contextPath}/set" class="sidebar-link">
                                <span>가계부 설정</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </aside>
        
        <div class="body-wrapper">
            <div class="app-container container-fluid">
                <div class="card">
                    <div class="card-body">