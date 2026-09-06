<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="adm.dto.trxDto" %>

<%
    request.setAttribute("pageTitle", "거래 내역 | myBudget");

    List<trxDto> transactionList =
        (List<trxDto>) request.getAttribute("transactionList");
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
                            총 <%= transactionList != null ? transactionList.size() : 0 %>건
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
<%
                            if (transactionList != null && transactionList.size() > 0) {
                                for (trxDto trx : transactionList) {
                                    String typeNm = "";
                                    String badgeClass = "";
                                    String amountSign = "";
                                    String amountClass = "";

                                    if ("01".equals(trx.getTypeCd())) {
                                        typeNm = "수입";
                                        badgeClass = "bg-green-lt";
                                        amountSign = "+";
                                        amountClass = "text-success fw-bold";
                                    } else if ("02".equals(trx.getTypeCd())) {
                                        typeNm = "지출";
                                        badgeClass = "bg-red-lt";
                                        amountSign = "-";
                                        amountClass = "text-danger fw-bold";
                                    } else {
                                        typeNm = "이체";
                                        badgeClass = "bg-blue-lt";
                                        amountSign = "";
                                        amountClass = "text-primary fw-bold";
                                    }
%>
                            <tr>
                                <td><%= trx.getTranDt() %></td>
                                <td>
                                    <span class="badge <%= badgeClass %>">
                                        <%= typeNm %>
                                    </span>
                                </td>
                                <td><%= trx.getCatCd() %></td>
                                <td><%= trx.getCatCd() %></td>
                                <td><%= trx.getContent() %></td>
                                <td><%= trx.getInAcctId() != null ? trx.getInAcctId() : "-" %></td>
                                <td><%= trx.getOutAcctId() != null ? trx.getOutAcctId() : "-" %></td>
                                <td class="text-end <%= amountClass %>">
                                    <%= amountSign %><%= String.format("%,d", trx.getAmount()) %>원
                                </td>
                                <td class="text-center">
                                    <a href="#" class="btn btn-sm btn-outline-primary">
                                        수정
                                    </a>
                                </td>
                            </tr>
<%
                                }
                            } else {
%>
                            <tr>
                                <td colspan="9" class="text-center">
                                    등록된 거래내역이 없습니다.
                                </td>
                            </tr>
<%
                            }
%>
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