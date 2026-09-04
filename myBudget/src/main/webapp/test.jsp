<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>myBudget - 템플릿 테스트</title>

    <!-- Tabler 무료 CSS 불러오기 -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/@tabler/[email protected]/dist/css/tabler.min.css">
</head>

<body>

<div class="page">

    <!-- 상단 메뉴 -->
    <header class="navbar navbar-expand-md navbar-light d-print-none">
        <div class="container-xl">

            <a class="navbar-brand" href="#">
                myBudget
            </a>

            <div class="navbar-nav flex-row order-md-last">
                <span class="nav-link">홍길동님</span>
                <a class="nav-link" href="#">로그아웃</a>
            </div>

        </div>
    </header>

    <div class="page-wrapper">

        <!-- 페이지 제목 영역 -->
        <div class="page-header d-print-none">
            <div class="container-xl">
                <div class="row g-2 align-items-center">

                    <div class="col">
                        <h2 class="page-title">
                            나의 가계부 대시보드
                        </h2>
                        <div class="text-secondary mt-1">
                            2026년 9월 재무 현황
                        </div>
                    </div>

                    <div class="col-auto ms-auto">
                        <a href="#" class="btn btn-primary">
                            + 거래 등록
                        </a>
                    </div>

                </div>
            </div>
        </div>

        <!-- 본문 -->
        <div class="page-body">
            <div class="container-xl">

                <div class="row row-deck row-cards">

                    <!-- 수입 카드 -->
                    <div class="col-sm-6 col-lg-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="subheader">이번 달 수입</div>
                                <div class="h1 mb-3 text-success">
                                    2,800,000원
                                </div>
                                <div class="text-secondary">
                                    전월 대비 +5.2%
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 지출 카드 -->
                    <div class="col-sm-6 col-lg-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="subheader">이번 달 지출</div>
                                <div class="h1 mb-3 text-danger">
                                    1,430,000원
                                </div>
                                <div class="text-secondary">
                                    전월 대비 -3.8%
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 순수입 카드 -->
                    <div class="col-sm-6 col-lg-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="subheader">이번 달 순수입</div>
                                <div class="h1 mb-3 text-primary">
                                    1,370,000원
                                </div>
                                <div class="text-secondary">
                                    수입 - 지출
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 순자산 카드 -->
                    <div class="col-sm-6 col-lg-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="subheader">현재 순자산</div>
                                <div class="h1 mb-3 text-indigo">
                                    12,450,000원
                                </div>
                                <div class="text-secondary">
                                    총자산 - 총부채
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 최근 거래 내역 -->
                    <div class="col-lg-8">
                        <div class="card">

                            <div class="card-header">
                                <h3 class="card-title">최근 거래 내역</h3>

                                <div class="card-actions">
                                    <a href="#" class="btn btn-outline-primary btn-sm">
                                        전체 보기
                                    </a>
                                </div>
                            </div>

                            <div class="table-responsive">
                                <table class="table table-vcenter card-table">
                                    <thead>
                                        <tr>
                                            <th>날짜</th>
                                            <th>구분</th>
                                            <th>카테고리</th>
                                            <th>내용</th>
                                            <th class="text-end">금액</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <tr>
                                            <td>2026.09.01</td>
                                            <td>
                                                <span class="badge bg-green-lt">수입</span>
                                            </td>
                                            <td>근로소득</td>
                                            <td>9월 급여</td>
                                            <td class="text-end text-success">
                                                +2,800,000원
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>2026.09.02</td>
                                            <td>
                                                <span class="badge bg-red-lt">지출</span>
                                            </td>
                                            <td>식비</td>
                                            <td>점심 식사</td>
                                            <td class="text-end text-danger">
                                                -12,000원
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>2026.09.03</td>
                                            <td>
                                                <span class="badge bg-blue-lt">이체</span>
                                            </td>
                                            <td>저축</td>
                                            <td>적금 이체</td>
                                            <td class="text-end text-primary">
                                                500,000원
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>

                    <!-- 계좌별 잔액 -->
                    <div class="col-lg-4">
                        <div class="card">

                            <div class="card-header">
                                <h3 class="card-title">계좌별 잔액</h3>
                            </div>

                            <div class="list-group list-group-flush">

                                <div class="list-group-item">
                                    <div class="row align-items-center">
                                        <div class="col">
                                            <strong>카카오뱅크 입출금</strong>
                                            <div class="text-secondary">현금·예금</div>
                                        </div>
                                        <div class="col-auto">
                                            <strong>3,450,000원</strong>
                                        </div>
                                    </div>
                                </div>

                                <div class="list-group-item">
                                    <div class="row align-items-center">
                                        <div class="col">
                                            <strong>국민은행 적금</strong>
                                            <div class="text-secondary">저축·투자</div>
                                        </div>
                                        <div class="col-auto">
                                            <strong>7,000,000원</strong>
                                        </div>
                                    </div>
                                </div>

                                <div class="list-group-item">
                                    <div class="row align-items-center">
                                        <div class="col">
                                            <strong>현대카드</strong>
                                            <div class="text-secondary">신용카드 부채</div>
                                        </div>
                                        <div class="col-auto text-danger">
                                            <strong>1,250,000원</strong>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </div>
</div>

<!-- Tabler 무료 JavaScript 불러오기 -->
<script src="https://cdn.jsdelivr.net/npm/@tabler/[email protected]/dist/js/tabler.min.js"></script>

</body>
</html>