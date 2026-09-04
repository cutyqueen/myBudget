<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    request.setAttribute("pageTitle", "잔고 보고서 | myBudget");
%>

<jsp:include page="/WEB-INF/views/com/header.jsp" />
<jsp:include page="/WEB-INF/views/com/sidebar.jsp" />

<div class="page-wrapper">

    <div class="page-header d-print-none">
        <div class="container-xl">

            <div class="row g-2 align-items-center">

                <div class="col">
                    <h2 class="page-title">잔고 보고서</h2>

                    <div class="text-secondary mt-1">
                        자산, 부채 및 순자산 변화를 한눈에 확인합니다.
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
                  action="<%= request.getContextPath() %>/report/balance">

                <div class="card-body">
                    <div class="row align-items-end">

                        <div class="col-md-3">
                            <label class="form-label" for="year">
                                기준 연도
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
                                기준 월
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

            <!-- 요약 카드 -->
            <div class="row row-deck row-cards mb-3">

                <div class="col-sm-6 col-lg-4">
                    <div class="card">

                        <div class="card-body">
                            <div class="subheader">총자산</div>

                            <div class="h1 mb-3 text-primary">
                                13,700,000원
                            </div>

                            <div class="text-secondary">
                                전월 대비 +1,128,000원
                            </div>
                        </div>

                    </div>
                </div>

                <div class="col-sm-6 col-lg-4">
                    <div class="card">

                        <div class="card-body">
                            <div class="subheader">총부채</div>

                            <div class="h1 mb-3 text-danger">
                                1,250,000원
                            </div>

                            <div class="text-secondary">
                                전월 대비 -250,000원
                            </div>
                        </div>

                    </div>
                </div>

                <div class="col-sm-6 col-lg-4">
                    <div class="card">

                        <div class="card-body">
                            <div class="subheader">순자산</div>

                            <div class="h1 mb-3 text-success">
                                12,450,000원
                            </div>

                            <div class="text-secondary">
                                총자산 - 총부채
                            </div>
                        </div>

                    </div>
                </div>

            </div>

            <div class="row row-cards">

                <!-- 자산 현황 -->
                <div class="col-lg-7">
                    <div class="card">

                        <div class="card-header">
                            <h3 class="card-title">자산 현황</h3>
                        </div>

                        <div class="table-responsive">
                            <table class="table table-vcenter card-table">

                                <thead>
                                    <tr>
                                        <th>자산 분류</th>
                                        <th>계좌명</th>
                                        <th class="text-end">전월 잔액</th>
                                        <th class="text-end">현재 잔액</th>
                                        <th class="text-end">변화</th>
                                    </tr>
                                </thead>

                                <tbody>

                                    <tr>
                                        <td>
                                            <span class="badge bg-blue-lt">
                                                현금 · 예금
                                            </span>
                                        </td>
                                        <td>카카오뱅크 입출금</td>
                                        <td class="text-end">2,322,000원</td>
                                        <td class="text-end fw-bold">
                                            3,450,000원
                                        </td>
                                        <td class="text-end text-success">
                                            +1,128,000원
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <span class="badge bg-green-lt">
                                                저축 · 투자
                                            </span>
                                        </td>
                                        <td>국민은행 적금</td>
                                        <td class="text-end">6,500,000원</td>
                                        <td class="text-end fw-bold">
                                            7,000,000원
                                        </td>
                                        <td class="text-end text-success">
                                            +500,000원
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <span class="badge bg-azure-lt">
                                                현금 · 예금
                                            </span>
                                        </td>
                                        <td>현금</td>
                                        <td class="text-end">250,000원</td>
                                        <td class="text-end fw-bold">
                                            250,000원
                                        </td>
                                        <td class="text-end text-secondary">
                                            0원
                                        </td>
                                    </tr>

                                    <tr class="fw-bold">
                                        <td colspan="3">총자산</td>
                                        <td class="text-end text-primary">
                                            13,700,000원
                                        </td>
                                        <td class="text-end text-success">
                                            +1,628,000원
                                        </td>
                                    </tr>

                                </tbody>

                            </table>
                        </div>

                    </div>
                </div>

                <!-- 부채 현황 -->
                <div class="col-lg-5">
                    <div class="card">

                        <div class="card-header">
                            <h3 class="card-title">부채 현황</h3>
                        </div>

                        <div class="table-responsive">
                            <table class="table table-vcenter card-table">

                                <thead>
                                    <tr>
                                        <th>부채 분류</th>
                                        <th>계좌명</th>
                                        <th class="text-end">현재 잔액</th>
                                        <th class="text-end">변화</th>
                                    </tr>
                                </thead>

                                <tbody>

                                    <tr>
                                        <td>
                                            <span class="badge bg-red-lt">
                                                신용카드
                                            </span>
                                        </td>
                                        <td>현대카드</td>
                                        <td class="text-end fw-bold text-danger">
                                            1,250,000원
                                        </td>
                                        <td class="text-end text-success">
                                            -250,000원
                                        </td>
                                    </tr>

                                    <tr class="fw-bold">
                                        <td colspan="2">총부채</td>
                                        <td class="text-end text-danger">
                                            1,250,000원
                                        </td>
                                        <td class="text-end text-success">
                                            -250,000원
                                        </td>
                                    </tr>

                                </tbody>

                            </table>
                        </div>

                    </div>
                </div>

                <!-- 자산/부채 비교 차트 -->
                <div class="col-12">
                    <div class="card">

                        <div class="card-header">
                            <h3 class="card-title">자산 · 부채 · 순자산 비교</h3>
                        </div>

                        <div class="card-body">
                            <div id="balance-chart"
                                 style="height: 300px;">
                            </div>
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
            document.querySelector("#balance-chart"),
            {
                chart: {
                    type: "bar",
                    height: 300,
                    toolbar: {
                        show: false
                    }
                },
                series: [
                    {
                        name: "금액",
                        data: [13700000, 1250000, 12450000]
                    }
                ],
                xaxis: {
                    categories: ["총자산", "총부채", "순자산"]
                },
                colors: ["#206bc4", "#d63939", "#2fb344"],
                plotOptions: {
                    bar: {
                        distributed: true,
                        borderRadius: 4,
                        columnWidth: "40%"
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

    });
</script>