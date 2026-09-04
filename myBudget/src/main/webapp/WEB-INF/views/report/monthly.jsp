<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    request.setAttribute("pageTitle", "월간 보고서 | myBudget");
%>

<jsp:include page="/WEB-INF/views/com/header.jsp" />
<jsp:include page="/WEB-INF/views/com/sidebar.jsp" />

<div class="page-wrapper">

    <div class="page-header d-print-none">
        <div class="container-xl">

            <div class="row g-2 align-items-center">

                <div class="col">
                    <h2 class="page-title">월간 보고서</h2>

                    <div class="text-secondary mt-1">
                        한 달 동안의 수입, 지출, 순수입 및 소비 흐름을 확인합니다.
                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="page-body">
        <div class="container-xl">

            <!-- 조회 조건 -->
            <form class="card mb-3"
                  method="get"
                  action="<%= request.getContextPath() %>/report/monthly">

                <div class="card-body">
                    <div class="row align-items-end">

                        <div class="col-md-3">
                            <label class="form-label" for="year">
                                연도
                            </label>

                            <select class="form-select"
                                    id="year"
                                    name="year">
                                <option value="2026">2026년</option>
                                <option value="2025">2025년</option>
                                <option value="2024">2024년</option>
                            </select>
                        </div>

                        <div class="col-md-3">
                            <label class="form-label" for="month">
                                월
                            </label>

                            <select class="form-select"
                                    id="month"
                                    name="month">
                                <option value="1">1월</option>
                                <option value="2">2월</option>
                                <option value="3">3월</option>
                                <option value="4">4월</option>
                                <option value="5">5월</option>
                                <option value="6">6월</option>
                                <option value="7">7월</option>
                                <option value="8">8월</option>
                                <option value="9" selected>9월</option>
                                <option value="10">10월</option>
                                <option value="11">11월</option>
                                <option value="12">12월</option>
                            </select>
                        </div>

                        <div class="col-md-2">
                            <button type="submit"
                                    class="btn btn-primary w-100">
                                조회
                            </button>
                        </div>

                    </div>
                </div>
            </form>

            <!-- 월간 요약 카드 -->
            <div class="row row-deck row-cards mb-3">

                <div class="col-sm-6 col-lg-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="subheader">이번 달 총수입</div>

                            <div class="h1 mb-3 text-success">
                                2,815,000원
                            </div>

                            <div class="text-secondary">
                                전월 대비 +5.2%
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-lg-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="subheader">이번 달 총지출</div>

                            <div class="h1 mb-3 text-danger">
                                1,687,000원
                            </div>

                            <div class="text-secondary">
                                전월 대비 -3.8%
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-lg-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="subheader">이번 달 순수입</div>

                            <div class="h1 mb-3 text-primary">
                                1,128,000원
                            </div>

                            <div class="text-secondary">
                                수입 - 지출
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-lg-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="subheader">수입 대비 지출 비율</div>

                            <div class="h1 mb-3 text-orange">
                                59.9%
                            </div>

                            <div class="text-secondary">
                                지출 ÷ 수입 × 100
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <div class="row row-cards">

                <!-- 수입/지출 비교 -->
                <div class="col-lg-8">
                    <div class="card">

                        <div class="card-header">
                            <h3 class="card-title">
                                수입 · 지출 비교
                            </h3>
                        </div>

                        <div class="card-body">
                            <div id="income-expense-chart"
                                 style="height: 280px;">
                            </div>
                        </div>

                    </div>
                </div>

                <!-- 지출 구성 비율 -->
                <div class="col-lg-4">
                    <div class="card">

                        <div class="card-header">
                            <h3 class="card-title">
                                지출 구성 비율
                            </h3>
                        </div>

                        <div class="card-body">
                            <div id="expense-category-chart"
                                 style="height: 280px;">
                            </div>
                        </div>

                    </div>
                </div>

                <!-- 수입 카테고리 -->
                <div class="col-lg-6">
                    <div class="card">

                        <div class="card-header">
                            <h3 class="card-title">분류별 수입</h3>
                        </div>

                        <div class="table-responsive">
                            <table class="table table-vcenter card-table">

                                <thead>
                                    <tr>
                                        <th>대분류</th>
                                        <th class="text-end">금액</th>
                                        <th class="text-end">비율</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <tr>
                                        <td>근로소득</td>
                                        <td class="text-end text-success">
                                            2,800,000원
                                        </td>
                                        <td class="text-end">99.5%</td>
                                    </tr>

                                    <tr>
                                        <td>금융소득</td>
                                        <td class="text-end text-success">
                                            15,000원
                                        </td>
                                        <td class="text-end">0.5%</td>
                                    </tr>

                                    <tr class="fw-bold">
                                        <td>합계</td>
                                        <td class="text-end text-success">
                                            2,815,000원
                                        </td>
                                        <td class="text-end">100%</td>
                                    </tr>
                                </tbody>

                            </table>
                        </div>

                    </div>
                </div>

                <!-- 지출 카테고리 -->
                <div class="col-lg-6">
                    <div class="card">

                        <div class="card-header">
                            <h3 class="card-title">분류별 지출</h3>
                        </div>

                        <div class="table-responsive">
                            <table class="table table-vcenter card-table">

                                <thead>
                                    <tr>
                                        <th>대분류</th>
                                        <th class="text-end">금액</th>
                                        <th class="text-end">비율</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <tr>
                                        <td>주거비</td>
                                        <td class="text-end text-danger">
                                            780,000원
                                        </td>
                                        <td class="text-end">46.2%</td>
                                    </tr>

                                    <tr>
                                        <td>식비</td>
                                        <td class="text-end text-danger">
                                            412,000원
                                        </td>
                                        <td class="text-end">24.4%</td>
                                    </tr>

                                    <tr>
                                        <td>교통비</td>
                                        <td class="text-end text-danger">
                                            195,000원
                                        </td>
                                        <td class="text-end">11.6%</td>
                                    </tr>

                                    <tr>
                                        <td>생활비</td>
                                        <td class="text-end text-danger">
                                            300,000원
                                        </td>
                                        <td class="text-end">17.8%</td>
                                    </tr>

                                    <tr class="fw-bold">
                                        <td>합계</td>
                                        <td class="text-end text-danger">
                                            1,687,000원
                                        </td>
                                        <td class="text-end">100%</td>
                                    </tr>
                                </tbody>

                            </table>
                        </div>

                    </div>
                </div>

                <!-- 지출 상위 내역 -->
                <div class="col-12">
                    <div class="card">

                        <div class="card-header">
                            <h3 class="card-title">
                                이번 달 지출 TOP 5
                            </h3>
                        </div>

                        <div class="table-responsive">
                            <table class="table table-vcenter card-table">

                                <thead>
                                    <tr>
                                        <th>순위</th>
                                        <th>날짜</th>
                                        <th>대분류</th>
                                        <th>내용</th>
                                        <th>출금 계좌</th>
                                        <th class="text-end">지출 금액</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>2026.09.05</td>
                                        <td>주거비</td>
                                        <td>아파트 관리비</td>
                                        <td>카카오뱅크 입출금</td>
                                        <td class="text-end text-danger fw-bold">
                                            780,000원
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>2</td>
                                        <td>2026.09.10</td>
                                        <td>생활비</td>
                                        <td>보험료</td>
                                        <td>카카오뱅크 입출금</td>
                                        <td class="text-end text-danger fw-bold">
                                            250,000원
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>3</td>
                                        <td>2026.09.07</td>
                                        <td>식비</td>
                                        <td>주말 장보기</td>
                                        <td>카카오뱅크 입출금</td>
                                        <td class="text-end text-danger fw-bold">
                                            182,000원
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>4</td>
                                        <td>2026.09.04</td>
                                        <td>교통비</td>
                                        <td>교통카드 충전</td>
                                        <td>카카오뱅크 입출금</td>
                                        <td class="text-end text-danger fw-bold">
                                            65,000원
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>5</td>
                                        <td>2026.09.03</td>
                                        <td>식비</td>
                                        <td>외식</td>
                                        <td>현대카드</td>
                                        <td class="text-end text-danger fw-bold">
                                            58,000원
                                        </td>
                                    </tr>
                                </tbody>

                            </table>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>

</div>

<jsp:include page="/WEB-INF/views/com/footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>

<script>
    document.addEventListener("DOMContentLoaded", function () {

        new ApexCharts(
            document.querySelector("#income-expense-chart"),
            {
                chart: {
                    type: "bar",
                    height: 280,
                    toolbar: {
                        show: false
                    }
                },
                series: [
                    {
                        name: "금액",
                        data: [2815000, 1687000, 1128000]
                    }
                ],
                xaxis: {
                    categories: ["수입", "지출", "순수입"]
                },
                colors: ["#206bc4", "#d63939", "#2fb344"],
                plotOptions: {
                    bar: {
                        distributed: true,
                        borderRadius: 4,
                        columnWidth: "45%"
                    }
                },
                dataLabels: {
                    enabled: false
                },
                yaxis: {
                    labels: {
                        formatter: function (value) {
                            return (value / 10000) + "만";
                        }
                    }
                }
            }
        ).render();

        new ApexCharts(
            document.querySelector("#expense-category-chart"),
            {
                chart: {
                    type: "donut",
                    height: 280
                },
                series: [780000, 412000, 195000, 300000],
                labels: ["주거비", "식비", "교통비", "생활비"],
                colors: ["#d63939", "#f59f00", "#206bc4", "#7e57c2"],
                legend: {
                    position: "bottom"
                },
                dataLabels: {
                    enabled: false
                }
            }
        ).render();

    });
</script>