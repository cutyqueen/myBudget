<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    request.setAttribute("pageTitle", "계좌 등록 | myBudget");
%>

<jsp:include page="/WEB-INF/views/com/header.jsp" />
<jsp:include page="/WEB-INF/views/com/sidebar.jsp" />

<div class="page-wrapper">

    <div class="page-header d-print-none">
        <div class="container-xl">

            <div class="row g-2 align-items-center">

                <div class="col">
                    <h2 class="page-title">계좌 등록</h2>

                    <div class="text-secondary mt-1">
                        자산 또는 부채 계좌 정보를 입력하세요.
                    </div>
                </div>

                <div class="col-auto ms-auto">
                    <a href="<%= request.getContextPath() %>/acc/list"
                       class="btn btn-outline-secondary">
                        목록으로
                    </a>
                </div>

            </div>
        </div>
    </div>

    <div class="page-body">
        <div class="container-xl">

            <div class="row justify-content-center">
                <div class="col-lg-8">

                    <form class="card"
                          action="<%= request.getContextPath() %>/acc/add"
                          method="post">

                        <div class="card-body">

                            <h3 class="card-title">계좌 기본 정보</h3>

                            <div class="row">

                                <div class="col-md-6 mb-3">
                                    <label class="form-label" for="accountType">
                                        계좌 구분
                                    </label>

                                    <select class="form-select"
                                            id="accountType"
                                            name="accountType"
                                            required>

                                        <option value="">선택하세요</option>
                                        <option value="ASSET">자산</option>
                                        <option value="LIABILITY">부채</option>
                                    </select>
                                </div>

                                <div class="col-md-6 mb-3">
                                    <label class="form-label" for="assetCategory">
                                        자산 · 부채 분류
                                    </label>

                                    <select class="form-select"
                                            id="assetCategory"
                                            name="assetCategory"
                                            required>

                                        <option value="">선택하세요</option>
                                        <option value="CASH">현금 · 예금</option>
                                        <option value="SAVING">저축 · 투자</option>
                                        <option value="PROPERTY">부동산</option>
                                        <option value="ETC_ASSET">기타 자산</option>
                                        <option value="CARD">신용카드</option>
                                        <option value="LOAN">장기부채</option>
                                    </select>
                                </div>

                            </div>

                            <div class="row">

                                <div class="col-md-6 mb-3">
                                    <label class="form-label" for="accountName">
                                        계좌명
                                    </label>

                                    <input type="text"
                                           class="form-control"
                                           id="accountName"
                                           name="accountName"
                                           placeholder="예: 카카오뱅크 입출금"
                                           maxlength="100"
                                           required>
                                </div>

                                <div class="col-md-6 mb-3">
                                    <label class="form-label" for="accountDetail">
                                        계좌 종류
                                    </label>

                                    <input type="text"
                                           class="form-control"
                                           id="accountDetail"
                                           name="accountDetail"
                                           placeholder="예: 입출금 통장, 신용카드, 정기적금">
                                </div>

                            </div>

                            <div class="mb-3">
                                <label class="form-label" for="initialBalance">
                                    시작 금액
                                </label>

                                <div class="input-group">
                                    <input type="number"
                                           class="form-control"
                                           id="initialBalance"
                                           name="initialBalance"
                                           min="0"
                                           step="1"
                                           placeholder="0"
                                           required>

                                    <span class="input-group-text">원</span>
                                </div>

                                <div class="form-hint">
                                    가계부를 시작하는 시점의 계좌 잔액을 입력하세요.
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label" for="memo">
                                    메모
                                </label>

                                <textarea class="form-control"
                                          id="memo"
                                          name="memo"
                                          rows="3"
                                          maxlength="500"
                                          placeholder="예: 매월 25일 적금 자동이체"></textarea>
                            </div>

                        </div>

                        <div class="card-footer text-end">

                            <a href="<%= request.getContextPath() %>/acc/list"
                               class="btn btn-outline-secondary">
                                취소
                            </a>

                            <button type="submit"
                                    class="btn btn-primary">
                                계좌 등록
                            </button>

                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>

</div>

<jsp:include page="/WEB-INF/views/com/footer.jsp" />