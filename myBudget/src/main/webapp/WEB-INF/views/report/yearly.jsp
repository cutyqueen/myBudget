<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    request.setAttribute("pageTitle", "연간 보고서 | myBudget");
%>

<jsp:include page="/WEB-INF/views/com/header.jsp" />
<jsp:include page="/WEB-INF/views/com/sidebar.jsp" />

<div class="page-wrapper">

    <div class="page-header d-print-none">
        <div class="container-xl">

            <div class="row g-2 align-items-center">

                <div class="col">
                    <h2 class="page-title">연간 보고서</h2>

                    <div class="text-secondary mt-1">
                        한 해 동안의 수입, 지출, 순수입 및 자산 변화를 확인합니다.
                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="page-body">
        <div class="container-xl">

            <!-- 조회 연도 -->
            <form class="card mb-3"
                  method="get"
                  action="<%= request.getContextPath() %>/report/yearly">

                <div class="card-body">
                    <div class="row align-items-end">

                        <div class="col-md-3">
                            <label class="form-label" for="year">
                                조회 연도
                            </label>

                            <select class="form-select"
                                    id="year"
                                    name="year">
                                <option value="2026">2026년</option>
                                <option value="2025">2025년</option>
                                <option value="2024">2024년</option>
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

            <!-- 연간 요약 카드 -->
            <div class="row row-deck row-cards mb-3">

                <div class="col-sm-6 col-lg-3">
                    <div class="card">

                        <div class="card-body">
                            <div class="subheader">연간 총수입</div>

                            <div class="h1 mb-3 text-success">
                                33,780,000원
                            </div>

                            <div class="text-secondary">
                                월평균 2,815,000원
                            </div>
                        </div>

                    </div>
                </div>

                <div class="col-sm-6 col-lg-3">
                    <div class="card">

                        <div class="card-body">
                            <div class="subheader">연간 총지출</div>

                            <div class="h1 mb-3 text-danger">
                                20,244,000원
                            </div>

                            <div class="text-secondary">
                                월평균 1,687,000원
                            </div>
                        </div>

                    </div>
                </div>

                <div class="col-sm-6 col-lg-3">
                    <div class="card">

                        <div class="card-body">
                            <div class="subheader">연간 순수입</div>

                            <div class="h1 mb-3 text-primary">
                                13,536,000원
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
                            <div class="subheader">연간 저축률</div>

                            <div class="h1 mb-3 text-orange">
                                40.1%
                            </div>

                            <div class="text-secondary">
                                순수입 ÷ 총수입 × 100
                            </div>
                        </div>

                    </div>
                </div>

            </div>

            <div class="row row-cards">

                <!-- 월별 수입, 지출, 순수입 -->
                <div class="col-12">
                    <div class="card">

                        <div class="card-header">
                            <h3 class="card-title">
                                월별 수입 · 지출 · 순수입 추이
                            </h3>
                        </div>

                        <div class="card-body">
                            <div id="yearly-income-chart"
                                 style="height: 350px;">
                            </div>
                        </div>

                    </div>
                </div>

                <!-- 월별 순자산 변화 -->
                <div class="col-lg-7">
                    <div class="card">

                        <div class="card-header">
                            <h3 class="card-title">
                                월별 순자산 변화
                            </h3>
                        </div>

                        <div class="card-body">
                            <div id="net-asset-chart"
                                 style="height: 310px;">
                            </div>
                        </div>

                    </div>
                </div>

                <!-- 카테고리별 연간 지출 -->
                <div class="col-lg-5">
                    <div class="card">

                        <div class="card-header">
                            <h3 class="card-title">
                                연간 지출 구성 비율
                            </h3>
                        </div>

                        <div class="card-body">
                            <div id="yearly-expense-chart"
                                 style="height: 310px;">
                            </div>
                        </div>

                    </div>
                </div>

                <!-- 월별 요약 테이블 -->
                <div class="col-12">
                    <div class="card">

                        <div class="card-header">
                            <h3 class="card-title">
                                월별 수입 · 지출 요약
                            </h3>
                        </div>

                        <div class="table-responsive">
                            <table class="table table-vcenter card-table">

                                <thead>
                                    <tr>
                                        <th>월</th>
                                        <th class="text-end">수입</th>
                                        <th class="text-end">지출</th>
                                        <th class="text-end">순수입</th>
                                        <th class="text-end">저축률</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <tr>
                                        <td>1월</td>
                                        <td class="text-end text-success">2,800,000원</td>
                                        <td class="text-end text-danger">1,550,000원</td>
                                        <td class="text-end text-primary">1,250,000원</td>
                                        <td class="text-end">44.6%</td>
                                    </tr>

                                    <tr>
                                        <td>2월</td>
                                        <td class="text-end text-success">2,800,000원</td>
                                        <td class="text-end text-danger">1,620,000원</td>
                                        <td class="text-end text-primary">1,180,000원</td>
                                        <td class="text-end">42.1%</td>
                                    </tr>

                                    <tr>
                                        <td>3월</td>
                                        <td class="text-end text-success">2,850,000원</td>
                                        <td class="text-end text-danger">1,680,000원</td>
                                        <td class="text-end text-primary">1,170,000원</td>
                                        <td class="text-end">41.1%</td>
                                    </tr>

                                    <tr>
                                        <td>4월</td>
                                        <td class="text-end text-success">2,800,000원</td>
                                        <td class="text-end text-danger">1,720,000원</td>
                                        <td class="text-end text-primary">1,080,000원</td>
                                        <td class="text-end">38.6%</td>
                                    </tr>

                                    <tr>
                                        <td>5월</td>
                                        <td class="text-end text-success">2,800,000원</td>
                                        <td class="text-end text-danger">1,630,000원</td>
                                        <td class="text-end text-primary">1,170,000원</td>
                                        <td class="text-end">41.8%</td>
                                    </tr>

                                    <tr>
                                        <td>6월</td>
                                        <td class="text-end text-success">2,800,000원</td>
                                        <td class="text-end text-danger">1,700,000원</td>
                                        <td class="text-end text-primary">1,100,000원</td>
                                        <td class="text-end">39.3%</td>
                                    </tr>

                                    <tr>
                                        <td>7월</td>
                                        <td class="text-end text-success">2,900,000원</td>
                                        <td class="text-end text-danger">1,900,000원</td>
                                        <td class="text-end text-primary">1,000,000원</td>
                                        <td class="text-end">34.5%</td>
                                    </tr>

                                    <tr>
                                        <td>8월</td>
                                        <td class="text-end text-success">2,800,000원</td>
                                        <td class="text-end text-danger">1,750,000원</td>
                                        <td class="text-end text-primary">1,050,000원</td>
                                        <td class="text-end">37.5%</td>
                                    </tr>

                                    <tr>
                                        <td>9월</td>
                                        <td class="text-end text-success">2,815,000원</td>
                                        <td class="text-end text-danger">1,687,000원</td>
                                        <td class="text-end text-primary">1,128,000원</td>
                                        <td class="text-end">40.1%</td>
                                    </tr>

                                    <tr>
                                        <td>10월</td>
                                        <td class="text-end text-success">2,800,000원</td>
                                        <td class="text-end text-danger">1,660,000원</td>
                                        <td class="text-end text-primary">1,140,000원</td>
                                        <td class="text-end">40.7%</td>
                                    </tr>

                                    <tr>
                                        <td>11월</td>
                                        <td class="text-end text-success">2,800,000원</td>
                                        <td class="text-end text-danger">1,700,000원</td>
                                        <td class="text-end text-primary">1,100,000원</td>
                                        <td class="text-end">39.3%</td>
                                    </tr>

                                    <tr>
                                        <td>12월</td>
                                        <td class="text-end text-success">2,815,000원</td>
                                        <td class="text-end text-danger">1,647,000원</td>
                                        <td class="text-end text-primary">1,168,000원</td>
                                        <td class="text-end">41.5%</td>
                                    </tr>

                                    <tr class="fw-bold">
                                        <td>연간 합계</td>
                                        <td class="text-end text-success">33,780,000원</td>
                                        <td class="text-end text-danger">20,244,000원</td>
                                        <td class="text-end text-primary">13,536,000원</td>
                                        <td class="text-end">40.1%</td>
                                    </tr>
                                </tbody>

                            </table>
                        </div>

                    </div>
                </div>

                <!-- 연간 지출 TOP 5 -->
                <div class="col-12">
                    <div class="card">

                        <div class="card-header">
                            <h3 class="card-title">
                                연간 지출 TOP 5
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
                                        <td>2026.07.15</td>
                                        <td>문화 · 여가</td>
                                        <td>여름 휴가</td>
                                        <td>현대카드</td>
                                        <td class="text-end text-danger fw-bold">
                                            1,200,000원
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>2</td>
                                        <td>2026.01.05</td>
                                        <td>주거비</td>
                                        <td>아파트 관리비</td>
                                        <td>카카오뱅크 입출금</td>
                                        <td class="text-end text-danger fw-bold">
                                            780,000원
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>3</td>
                                        <td>2026.03.18</td>
                                        <td>생활비</td>
                                        <td>자동차 보험료</td>
                                        <td>카카오뱅크 입출금</td>
                                        <td class="text-end text-danger fw-bold">
                                            650,000원
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>4</td>
                                        <td>2026.09.10</td>
                                        <td>생활비</td>
                                        <td>보험료</td>
                                        <td>카카오뱅크 입출금</td>
                                        <td class="text-end text-danger fw-bold">
                                            250,000원
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>5</td>
                                        <td>2026.11.20</td>
                                        <td>문화 · 여가</td>
                                        <td>콘서트 티켓</td>
                                        <td>현대카드</td>
                                        <td class="text-end text-danger fw-bold">
                                            180,000원
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
            document.querySelector("#yearly-income-chart"),
            {
                chart: {
                    type: "line",
                    height: 350,
                    toolbar: {
                        show: false
                    }
                },
                series: [
                    {
                        name: "수입",
                        data: [
                            2800000, 2800000, 2850000, 2800000,
                            2800000, 2800000, 2900000, 2800000,
                            2815000, 2800000, 2800000, 2815000
                        ]
                    },
                    {
                        name: "지출",
                        data: [
                            1550000, 1620000, 1680000, 1720000,
                            1630000, 1700000, 1900000, 1750000,
                            1687000, 1660000, 1700000, 1647000
                        ]
                    },
                    {
                        name: "순수입",
                        data: [
                            1250000, 1180000, 1170000, 1080000,
                            1170000, 1100000, 1000000, 1050000,
                            1128000, 1140000, 1100000, 1168000
                        ]
                    }
                ],
                xaxis: {
                    categories: [
                        "1월", "2월", "3월", "4월",
                        "5월", "6월", "7월", "8월",
                        "9월", "10월", "11월", "12월"
                    ]
                },
                colors: ["#2fb344", "#d63939", "#206bc4"],
                stroke: {
                    width: 3,
                    curve: "smooth"
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
                },
                legend: {
                    position: "top"
                }
            }
        ).render();

        new ApexCharts(
            document.querySelector("#net-asset-chart"),
            {
                chart: {
                    type: "area",
                    height: 310,
                    toolbar: {
                        show: false
                    }
                },
                series: [
                    {
                        name: "순자산",
                        data: [
                            1800000, 2980000, 4150000, 5230000,
                            6400000, 7500000, 8500000, 9550000,
                            12450000, 13590000, 14690000, 15858000
                        ]
                    }
                ],
                xaxis: {
                    categories: [
                        "1월", "2월", "3월", "4월",
                        "5월", "6월", "7월", "8월",
                        "9월", "10월", "11월", "12월"
                    ]
                },
                colors: ["#206bc4"],
                dataLabels: {
                    enabled: false
                },
                stroke: {
                    curve: "smooth",
                    width: 3
                },
                fill: {
                    type: "gradient",
                    gradient: {
                        opacityFrom: 0.45,
                        opacityTo: 0.05
                    }
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
            document.querySelector("#yearly-expense-chart"),
            {
                chart: {
                    type: "donut",
                    height: 310
                },
                series: [
                    7200000,
                    4944000,
                    2280000,
                    3420000,
                    2400000
                ],
                labels: [
                    "주거비",
                    "식비",
                    "교통비",
                    "생활비",
                    "문화 · 여가"
                ],
                colors: [
                    "#d63939",
                    "#f59f00",
                    "#206bc4",
                    "#7e57c2",
                    "#2fb344"
                ],
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