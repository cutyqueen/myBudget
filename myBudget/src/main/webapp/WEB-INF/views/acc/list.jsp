<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    request.setAttribute("pageTitle", "계좌 관리 | myBudget");
%>

<jsp:include page="/WEB-INF/views/com/header.jsp" />
<jsp:include page="/WEB-INF/views/com/sidebar.jsp" />

<div class="page-wrapper">

    <div class="page-header d-print-none">
        <div class="container-xl">
            <div class="row g-2 align-items-center">

                <div class="col">
                    <h2 class="page-title">계좌 관리</h2>

                    <div class="text-secondary mt-1">
                        나의 자산과 부채 계좌를 등록하고 현재 잔액을 관리합니다.
                    </div>
                </div>

                <div class="col-auto ms-auto">
                    <a href="<%= request.getContextPath() %>/acc/add"
                       class="btn btn-primary">
                        + 계좌 등록
                    </a>
                </div>

            </div>
        </div>
    </div>

    <div class="page-body">
        <div class="container-xl">

            <div class="row row-cards">

                <div class="col-12">
                    <div class="card">

                        <div class="card-header">
                            <h3 class="card-title">자산 계좌</h3>
                        </div>

                        <div class="table-responsive">
                            <table class="table table-vcenter card-table">
                                <thead>
                                    <tr>
                                        <th>자산 분류</th>
                                        <th>계좌명</th>
                                        <th>계좌 종류</th>
                                        <th class="text-end">시작 금액</th>
                                        <th class="text-end">현재 잔액</th>
                                        <th>메모</th>
                                        <th class="text-center">관리</th>
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
                                        <td>입출금 통장</td>
                                        <td class="text-end">3,000,000원</td>
                                        <td class="text-end fw-bold text-primary">
                                            3,450,000원
                                        </td>
                                        <td class="text-secondary">생활비 계좌</td>
                                        <td class="text-center">
                                            <a href="#" class="btn btn-sm btn-outline-primary">
                                                수정
                                            </a>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <span class="badge bg-green-lt">
                                                저축 · 투자
                                            </span>
                                        </td>
                                        <td>국민은행 적금</td>
                                        <td>정기적금</td>
                                        <td class="text-end">5,000,000원</td>
                                        <td class="text-end fw-bold text-success">
                                            7,000,000원
                                        </td>
                                        <td class="text-secondary">매월 50만원 적립</td>
                                        <td class="text-center">
                                            <a href="#" class="btn btn-sm btn-outline-primary">
                                                수정
                                            </a>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <span class="badge bg-azure-lt">
                                                현금 · 예금
                                            </span>
                                        </td>
                                        <td>현금</td>
                                        <td>현금</td>
                                        <td class="text-end">100,000원</td>
                                        <td class="text-end fw-bold text-primary">
                                            250,000원
                                        </td>
                                        <td class="text-secondary">비상금</td>
                                        <td class="text-center">
                                            <a href="#" class="btn btn-sm btn-outline-primary">
                                                수정
                                            </a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>

                <div class="col-12">
                    <div class="card">

                        <div class="card-header">
                            <h3 class="card-title">부채 계좌</h3>
                        </div>

                        <div class="table-responsive">
                            <table class="table table-vcenter card-table">
                                <thead>
                                    <tr>
                                        <th>부채 분류</th>
                                        <th>계좌명</th>
                                        <th>계좌 종류</th>
                                        <th class="text-end">시작 금액</th>
                                        <th class="text-end">현재 잔액</th>
                                        <th>메모</th>
                                        <th class="text-center">관리</th>
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
                                        <td>신용카드</td>
                                        <td class="text-end">0원</td>
                                        <td class="text-end fw-bold text-danger">
                                            1,250,000원
                                        </td>
                                        <td class="text-secondary">결제일: 매월 12일</td>
                                        <td class="text-center">
                                            <a href="#" class="btn btn-sm btn-outline-primary">
                                                수정
                                            </a>
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