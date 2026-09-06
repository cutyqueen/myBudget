<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="adm.dto.noticeDto" %>

<jsp:include page="/WEB-INF/views/com/header.jsp" />
<jsp:include page="/WEB-INF/views/com/sidebar.jsp" />

<div class="page-wrapper">
    <div class="page-header d-print-none">
        <div class="container-xl">
            <div class="row g-2 align-items-center">
                <div class="col">
                    <h2 class="page-title">공지사항 수정</h2>
                </div>
            </div>
        </div>
    </div>

    <div class="page-body">
        <div class="container-xl">
            <div class="card">
                <div class="card-body">
                    <%
                    noticeDto notice = (noticeDto) request.getAttribute("notice");
                    if (notice != null) {
                    %>
                    <form method="post" action="<%= request.getContextPath() %>/notice/edit">
                        <input type="hidden" name="noticeId" value="<%= notice.getNoticeId() %>">
                        <div class="mb-3">
                            <label class="form-label">사용메뉴</label>
                            <select name="noticeMenu" class="form-select" required>
                                <option value="">-- 선택 --</option>
                                <option value="setting" <%= "setting".equals(notice.getNoticeMenu()) ? "selected" : "" %>>가계부 설정</option>
                                <option value="guide" <%= "guide".equals(notice.getNoticeMenu()) ? "selected" : "" %>>사용가이드</option>
                                <option value="record" <%= "record".equals(notice.getNoticeMenu()) ? "selected" : "" %>>가계부 기록</option>
                                <option value="monthly_report" <%= "monthly_report".equals(notice.getNoticeMenu()) ? "selected" : "" %>>월간보고서</option>
                                <option value="monthly_detail" <%= "monthly_detail".equals(notice.getNoticeMenu()) ? "selected" : "" %>>월간 상세보기</option>
                                <option value="yearly_report" <%= "yearly_report".equals(notice.getNoticeMenu()) ? "selected" : "" %>>연간보고서</option>
                                <option value="yearly_detail" <%= "yearly_detail".equals(notice.getNoticeMenu()) ? "selected" : "" %>>연간 상세보기</option>
                                <option value="calendar" <%= "calendar".equals(notice.getNoticeMenu()) ? "selected" : "" %>>수입ㆍ지출달력</option>
                                <option value="balance" <%= "balance".equals(notice.getNoticeMenu()) ? "selected" : "" %>>잔고 보고서</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">제목</label>
                            <input type="text" name="title" class="form-control" value="<%= notice.getTitle() %>" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">내용</label>
                            <textarea name="content" class="form-control" rows="10" required><%= notice.getContent() %></textarea>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">사용여부</label>
                            <select name="useYn" class="form-select">
                                <option value="Y" <%= "Y".equals(notice.getUseYn()) ? "selected" : "" %>>사용</option>
                                <option value="N" <%= "N".equals(notice.getUseYn()) ? "selected" : "" %>>미사용</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">저장</button>
                        <a href="<%= request.getContextPath() %>/notice/list?noticeMenu=<%= notice.getNoticeMenu() %>" class="btn btn-outline-secondary">취소</a>
                    </form>
                    <%
                    } else {
                    %>
                    <div class="alert alert-danger">공지사항을 찾을 수 없습니다.</div>
                    <a href="<%= request.getContextPath() %>/notice/list" class="btn btn-outline-secondary">목록으로</a>
                    <%
                    }
                    %>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/com/footer.jsp" />