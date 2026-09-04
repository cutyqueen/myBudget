<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    request.setAttribute("pageTitle", "수입 등록 | myBudget");
%>

<jsp:include page="/WEB-INF/views/com/header.jsp" />
<jsp:include page="/WEB-INF/views/com/sidebar.jsp" />

<div class="page-wrapper">

    <div class="page-header d-print-none">
        <div class="container-xl">
            <div class="row g-2 align-items-center">

                <div class="col">
                    <h2 class="page-title">수입 등록</h2>
                    <div class="text-secondary mt-1">
                        급여, 보너스, 이자 등 들어온 수입을 등록합니다.
                    </div>
                </div>

                <div class="col-auto ms-auto">
                    <a href="<%= request.getContextPath() %>/trx/list"
                       class="btn btn-outline-secondary">
                        거래 내역
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
                          action="<%= request.getContextPath() %>/trx/income"
                          method="post">

                        <div class="card-body">

                            <h3 class="card-title text-success">
                                수입 정보
                            </h3>

                            <input type="hidden"
                                   name="transactionType"
                                   value="INCOME">

                            <div class="row">

                                <div class="col-md-6 mb-3">
                                    <label class="form-label" for="transactionDate">
                                        수입일
                                    </label>

                                    <input type="date"
                                           class="form-control"
                                           id="transactionDate"
                                           name="transactionDate"
                                           required>
                                </div>

                                <div class="col-md-6 mb-3">
                                    <label class="form-label" for="inAccount">
                                        입금 계좌
                                    </label>

                                    <select class="form-select"
                                            id="inAccount"
                                            name="inAccount"
                                            required>
                                        <option value="">선택하세요</option>
                                        <option value="카카오뱅크 입출금">
                                            카카오뱅크 입출금
                                        </option>
                                        <option value="국민은행 적금">
                                            국민은행 적금
                                        </option>
                                        <option value="현금">
                                            현금
                                        </option>
                                    </select>
                                </div>

                            </div>

                            <div class="row">

                                <div class="col-md-6 mb-3">
                                    <label class="form-label" for="majorCategory">
                                        수입 대분류
                                    </label>

                                    <select class="form-select"
                                            id="majorCategory"
                                            name="majorCategory"
                                            required>
                                        <option value="">선택하세요</option>
                                        <option value="근로소득">근로소득</option>
                                        <option value="사업소득">사업소득</option>
                                        <option value="금융소득">금융소득</option>
                                        <option value="기타수입">기타수입</option>
                                    </select>
                                </div>

                                <div class="col-md-6 mb-3">
                                    <label class="form-label" for="minorCategory">
                                        수입 소분류
                                    </label>

                                    <select class="form-select"
                                            id="minorCategory"
                                            name="minorCategory"
                                            required>
                                        <option value="">선택하세요</option>
                                        <option value="월급">월급</option>
                                        <option value="보너스">보너스</option>
                                        <option value="이자소득">이자소득</option>
                                        <option value="부수입">부수입</option>
                                    </select>
                                </div>

                            </div>

                            <div class="mb-3">
                                <label class="form-label" for="amount">
                                    수입 금액
                                </label>

                                <div class="input-group">
                                    <input type="number"
                                           class="form-control"
                                           id="amount"
                                           name="amount"
                                           min="1"
                                           step="1"
                                           placeholder="0"
                                           required>

                                    <span class="input-group-text">원</span>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label" for="content">
                                    내용
                                </label>

                                <input type="text"
                                       class="form-control"
                                       id="content"
                                       name="content"
                                       maxlength="200"
                                       placeholder="예: 9월 급여">
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
                                          placeholder="추가 메모를 입력하세요."></textarea>
                            </div>

                        </div>

                        <div class="card-footer text-end">

                            <a href="<%= request.getContextPath() %>/trx/list"
                               class="btn btn-outline-secondary">
                                취소
                            </a>

                            <button type="submit" class="btn btn-success">
                                수입 등록
                            </button>

                        </div>

                    </form>
                </div>
            </div>

        </div>
    </div>

</div>

<jsp:include page="/WEB-INF/views/com/footer.jsp" />