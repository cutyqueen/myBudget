<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/com/header.jsp" />
<jsp:include page="/WEB-INF/views/com/sidebar.jsp" />

<div class="page-wrapper">
    <div class="page-header d-print-none">
        <div class="container-xl">
            <div class="row g-2 align-items-center">
                <div class="col">
                    <h2 class="page-title">공지사항 작성</h2>
                </div>
            </div>
        </div>
    </div>

    <div class="page-body">
        <div class="container-xl">
            <div class="card">
                <div class="card-body">
                    <form method="post" action="<%= request.getContextPath() %>/notice/write">
                        
                        <div class="mb-3">
                            <label class="form-label">사용메뉴</label>
                            <select name="noticeMenu" class="form-select" required>
                                <option value="">-- 선택 --</option>
                                <option value="setting">가계부 설정</option>
                                <option value="guide">사용가이드</option>
                                <option value="record">가계부 기록</option>
                                <option value="monthly_report">월간보고서</option>
                                <option value="monthly_detail">월간 상세보기</option>
                                <option value="yearly_report">연간보고서</option>
                                <option value="yearly_detail">연간 상세보기</option>
                                <option value="calendar">수입ㆍ지출달력</option>
                                <option value="balance">잔고 보고서</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">제목</label>
                            <input type="text" name="title" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">내용</label>
                            <textarea name="content" class="form-control" rows="10" required></textarea>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">사용여부</label>
                            <select name="useYn" class="form-select">
                                <option value="Y" selected>사용</option>
                                <option value="N">미사용</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">저장</button>
                        <a href="<%= request.getContextPath() %>/notice/list" class="btn btn-outline-secondary">취소</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/com/footer.jsp" />