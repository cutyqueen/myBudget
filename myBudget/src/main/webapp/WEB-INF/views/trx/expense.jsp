<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="adm.dto.cocdDto" %>
<%@ page import="adm.dto.accDto" %>

<%
    request.setAttribute("pageTitle", "지출 등록 | myBudget");

    List<cocdDto> expenseCatList =
        (List<cocdDto>) request.getAttribute("expenseCatList");

    List<accDto> accountList =
        (List<accDto>) request.getAttribute("accountList");

    // 대분류 중복 제거
    List<cocdDto> expenseMajorList = new ArrayList<cocdDto>();
    String prevLowCd = "";

    if (expenseCatList != null) {
        for (cocdDto code : expenseCatList) {
            if (!prevLowCd.equals(code.getLowCd())) {
                cocdDto major = new cocdDto();
                major.setLowCd(code.getLowCd());
                major.setLowNm(code.getLowNm());
                expenseMajorList.add(major);
                prevLowCd = code.getLowCd();
            }
        }
    }
%>

<jsp:include page="/WEB-INF/views/com/header.jsp" />
<jsp:include page="/WEB-INF/views/com/sidebar.jsp" />

<div class="page-wrapper">

    <div class="page-header d-print-none">
        <div class="container-xl">
            <div class="row g-2 align-items-center">

                <div class="col">
                    <h2 class="page-title">지출 등록</h2>
                    <div class="text-secondary mt-1">
                        식비, 교통비, 주거비 등 지출을 등록합니다.
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
                          action="<%= request.getContextPath() %>/trx/expense"
                          method="post">

                        <div class="card-body">

                            <h3 class="card-title text-danger">
                                지출 정보
                            </h3>

                            <input type="hidden"
                                   name="transactionType"
                                   value="EXPENSE">

                            <div class="row">

                                <div class="col-md-6 mb-3">
                                    <label class="form-label" for="transactionDate">
                                        지출일
                                    </label>

                                    <input type="date"
                                           class="form-control"
                                           id="transactionDate"
                                           name="transactionDate"
                                           value="<%= java.time.LocalDate.now() %>"
                                           required>
                                </div>

                                <div class="col-md-6 mb-3">
                                    <label class="form-label" for="outAccount">
                                        출금 계좌
                                    </label>

                                    <select class="form-select"
                                            id="outAccount"
                                            name="outAccount"
                                            required>
                                        <option value="">선택하세요</option>
<%
    if (accountList != null) {
        for (accDto account : accountList) {
%>
                                        <option value="<%= account.getAcctId() %>">
                                            <%= account.getAcctNm() %>
                                        </option>
<%
        }
    }
%>
                                    </select>
                                </div>

                            </div>

                            <div class="row">

                                <div class="col-md-6 mb-3">
                                    <label class="form-label" for="majorCategory">
                                        지출 대분류
                                    </label>

                                    <select class="form-select"
                                            id="majorCategory"
                                            name="majorCategory"
                                            required>
                                        <option value="">선택하세요</option>
<%
    if (expenseMajorList != null) {
        for (cocdDto code : expenseMajorList) {
%>
                                        <option value="<%= code.getLowCd() %>">
                                            <%= code.getLowNm() %>
                                        </option>
<%
        }
    }
%>
                                    </select>
                                </div>

                                <div class="col-md-6 mb-3">
                                    <label class="form-label" for="minorCategory">
                                        지출 소분류
                                    </label>

                                    <select class="form-select"
                                            id="minorCategory"
                                            name="minorCategory"
                                            required>
                                        <option value="">선택하세요</option>
<%
    if (expenseCatList != null) {
        for (cocdDto code : expenseCatList) {
%>
                                        <option value="<%= code.getValCd() %>">
                                            <%= code.getValNm() %>
                                        </option>
<%
        }
    }
%>
                                    </select>
                                </div>

                            </div>

                            <div class="mb-3">
                                <label class="form-label" for="amount">
                                    지출 금액
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
                                       placeholder="예: 점심 식사">
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

                            <button type="submit" class="btn btn-danger">
                                지출 등록
                            </button>

                        </div>

                    </form>
                </div>
            </div>

        </div>
    </div>

</div>

<jsp:include page="/WEB-INF/views/com/footer.jsp" />