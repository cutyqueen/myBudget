<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-lg navbar-light">
    <div class="container-xl">

        <div class="collapse navbar-collapse" id="navbar-menu">
            <div class="navbar-nav">

                <a class="nav-link"
                   href="<%= request.getContextPath() %>/board/main">
                    <span class="nav-link-title">
                        대시보드
                    </span>
                </a>

                <div class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle"
                       href="#navbar-trx"
                       data-bs-toggle="dropdown"
                       data-bs-auto-close="outside"
                       role="button"
                       aria-expanded="false">

                        <span class="nav-link-title">
                            거래 관리
                        </span>
                    </a>

                    <div class="dropdown-menu">
                        <a class="dropdown-item"
						   href="<%= request.getContextPath() %>/trx/list">
						    거래 내역
						</a>
						
						<a class="dropdown-item"
						   href="<%= request.getContextPath() %>/trx/income">
						    수입 등록
						</a>
						
						<a class="dropdown-item"
						   href="<%= request.getContextPath() %>/trx/expense">
						    지출 등록
						</a>
						
						<a class="dropdown-item"
						   href="<%= request.getContextPath() %>/trx/transfer">
						    이체 등록
						</a>
                    </div>
                </div>

                <div class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle"
                       href="#navbar-acc"
                       data-bs-toggle="dropdown"
                       data-bs-auto-close="outside"
                       role="button"
                       aria-expanded="false">

                        <span class="nav-link-title">
                            자산 관리
                        </span>
                    </a>

                    <div class="dropdown-menu">
                        <a class="nav-link"
						   href="<%= request.getContextPath() %>/acc/list">
						    계좌 관리
						</a>

                        <a class="dropdown-item"
                           href="<%= request.getContextPath() %>/report/balance">
                            자산 · 부채 현황
                        </a>
                    </div>
                </div>

                <div class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle"
                       href="#navbar-report"
                       data-bs-toggle="dropdown"
                       data-bs-auto-close="outside"
                       role="button"
                       aria-expanded="false">

                        <span class="nav-link-title">
                            보고서
                        </span>
                    </a>

                    <div class="dropdown-menu">
                        <a class="dropdown-item"
						   href="<%= request.getContextPath() %>/report/monthly">
						    월간 보고서
						</a>

                        <a class="dropdown-item"
                           href="<%= request.getContextPath() %>/report/yearly">
                            연간 보고서
                        </a>

                        <a class="dropdown-item"
                           href="<%= request.getContextPath() %>/report/balance">
                            잔고 보고서
                        </a>
                    </div>
                </div>

                <div class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle"
                       href="#navbar-setting"
                       data-bs-toggle="dropdown"
                       data-bs-auto-close="outside"
                       role="button"
                       aria-expanded="false">

                        <span class="nav-link-title">
                            설정
                        </span>
                    </a>
                    <div class="dropdown-menu">
                     <a class="dropdown-item"
						   href="<%= request.getContextPath() %>/user/cate">
						    카테고리 관리
						</a>
                        <a class="dropdown-item"
                           href="<%= request.getContextPath() %>/user/profile">
                            내 정보
                        </a>
                    </div>
                </div>

            </div>
        </div>

    </div>
</nav>