<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    request.setAttribute("pageTitle", "거래 내역 | myBudget");
%>

<jsp:include page="/WEB-INF/views/com/header.jsp" />
<jsp:include page="/WEB-INF/views/com/sidebar.jsp" />

<div class="page-wrapper">

    <div class="page-header d-print-none">
        <div class="container-xl">

            <div class="row g-2 align-items-center">

                <div class="col">
                    <h2 class="page-title">거래 내역</h2>

                    <div class="text-secondary mt-1">
                        수입, 지출, 이체 내역을 조회하고 관리합니다.
                    </div>
                </div>

                <div class="col-auto ms-auto">

                    <a href="<%= request.getContextPath() %>/trx/income"
                       class="btn btn-success">
                        + 수입
                    </a>

                    <a href="<%= request.getContextPath() %>/trx/expense"
                       class="btn btn-danger">
                        + 지출
                    </a>

                    <a href="<%= request.getContextPath() %>/trx/transfer"
                       class="btn btn-primary">
                        + 이체
                    </a>

                </div>

            </div>
        </div>
    </div>

    <div class="page-body">
        <div class="container-xl">

            <!-- 거래 검색 조건 -->
            <form class="card mb-3"
                  method="get"
                  action="<%= request.getContextPath() %>/trx/list">

                <div class="card-body">
                    <div class="row g-3">

                        <div class="col-md-3">
                            <label class="form-label" for="startDate">
                                시작일
                            </label>

                            <input type="date"
                                   class="form-control"
                                   id="startDate"
                                   name="startDate">
                        </div>

                        <div class="col-md-3">
                            <label class="form-label" for="endDate">
                                종료일
                            </label>

                            <input type="date"
                                   class="form-control"
                                   id="endDate"
                                   name="endDate">
                        </div>

                        <div class="col-md-2">
                            <label class="form-label" for="type">
                                거래 구분
                            </label>

                            <select class="form-select"
                                    id="type"
                                    name="type">
                                <option value="">전체</option>
                                <option value="INCOME">수입</option>
                                <option value="EXPENSE">지출</option>
                                <option value="TRANSFER">이체</option>
                            </select>
                        </div>

                        <div class="col-md-2">
                            <label class="form-label" for="keyword">
                                내용 검색
                            </label>

                            <input type="text"
                                   class="form-control"
                                   id="keyword"
                                   name="keyword"
                                   placeholder="내용 입력">
                        </div>

                        <div class="col-md-2">
                            <label class="form-label">&nbsp;</label>

                            <button type="submit"
                                    class="btn btn-outline-primary w-100">
                                조회
                            </button>
                        </div>

                    </div>
                </div>
            </form>

            <!-- 거래 목록 -->
            <div class="card">

                <div class="card-header">
                    <h3 class="card-title">전체 거래 내역</h3>

                    <div class="card-actions">
                        <span class="text-secondary">
                            총 6건
                        </span>
                    </div>
                </div>

                <div class="table-responsive">
                    <table class="table table-vcenter card-table">

                        <thead>
                            <tr>
                                <th>날짜</th>
                                <th>구분</th>
                                <th>대분류</th>
                                <th>소분류</th>
                                <th>내용</th>
                                <th>입금 계좌</th>
                                <th>출금 계좌</th>
                                <th class="text-end">금액</th>
                                <th class="text-center">관리</th>
                            </tr>
                        </thead>

                        <tbody>

                            <tr>
                                <td>2026.09.01</td>
                                <td>
                                    <span class="badge bg-green-lt">수입</span>
                                </td>
                                <td>근로소득</td>
                                <td>월급</td>
                                <td>9월 급여</td>
                                <td>카카오뱅크 입출금</td>
                                <td>-</td>
                                <td class="text-end text-success fw-bold">
                                    +2,800,000원
                                </td>
                                <td class="text-center">
                                    <a href="#" class="btn btn-sm btn-outline-primary">
                                        수정
                                    </a>
                                </td>
                            </tr>

                            <tr>
                                <td>2026.09.02</td>
                                <td>
                                    <span class="badge bg-red-lt">지출</span>
                                </td>
                                <td>식비</td>
                                <td>점심식사</td>
                                <td>점심 식사</td>
                                <td>-</td>
                                <td>카카오뱅크 입출금</td>
                                <td class="text-end text-danger fw-bold">
                                    -12,000원
                                </td>
                                <td class="text-center">
                                    <a href="#" class="btn btn-sm btn-outline-primary">
                                        수정
                                    </a>
                                </td>
                            </tr>

                            <tr>
                                <td>2026.09.03</td>
                                <td>
                                    <span class="badge bg-blue-lt">이체</span>
                                </td>
                                <td>저축</td>
                                <td>적금</td>
                                <td>국민은행 적금 이체</td>
                                <td>국민은행 적금</td>
                                <td>카카오뱅크 입출금</td>
                                <td class="text-end text-primary fw-bold">
                                    500,000원
                                </td>
                                <td class="text-center">
                                    <a href="#" class="btn btn-sm btn-outline-primary">
                                        수정
                                    </a>
                                </td>
                            </tr>

                            <tr>
                                <td>2026.09.04</td>
                                <td>
                                    <span class="badge bg-red-lt">지출</span>
                                </td>
                                <td>교통비</td>
                                <td>대중교통</td>
                                <td>교통카드 충전</td>
                                <td>-</td>
                                <td>카카오뱅크 입출금</td>
                                <td class="text-end text-danger fw-bold">
                                    -65,000원
                                </td>
                                <td class="text-center">
                                    <a href="#" class="btn btn-sm btn-outline-primary">
                                        수정
                                    </a>
                                </td>
                            </tr>

                            <tr>
                                <td>2026.09.05</td>
                                <td>
                                    <span class="badge bg-red-lt">지출</span>
                                </td>
                                <td>주거비</td>
                                <td>관리비</td>
                                <td>아파트 관리비</td>
                                <td>-</td>
                                <td>카카오뱅크 입출금</td>
                                <td class="text-end text-danger fw-bold">
                                    -180,000원
                                </td>
                                <td class="text-center">
                                    <a href="#" class="btn btn-sm btn-outline-primary">
                                        수정
                                    </a>
                                </td>
                            </tr>

                            <tr>
                                <td>2026.09.06</td>
                                <td>
                                    <span class="badge bg-green-lt">수입</span>
                                </td>
                                <td>금융소득</td>
                                <td>이자소득</td>
                                <td>예금 이자</td>
                                <td>카카오뱅크 입출금</td>
                                <td>-</td>
                                <td class="text-end text-success fw-bold">
                                    +15,000원
                                </td>
                                <td class="text-center">
                                    <a href="#" class="btn btn-sm btn-outline-primary">
                                        수정
                                    </a>
                                </td>
                            </tr>

                        </tbody>

                    </table>
                </div>

                <div class="card-footer">
                    <div class="text-secondary">
                        거래 내역은 최신 날짜 순으로 표시됩니다.
                    </div>
                </div>

            </div>
        </div>
    </div>

</div>

<jsp:include page="/WEB-INF/views/com/footer.jsp" />