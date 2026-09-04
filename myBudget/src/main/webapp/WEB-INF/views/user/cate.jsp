<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    request.setAttribute("pageTitle", "카테고리 관리 | myBudget");
%>

<jsp:include page="/WEB-INF/views/com/header.jsp" />
<jsp:include page="/WEB-INF/views/com/sidebar.jsp" />

<div class="page-wrapper">

    <div class="page-header d-print-none">
        <div class="container-xl">

            <div class="row g-2 align-items-center">

                <div class="col">
                    <h2 class="page-title">카테고리 관리</h2>

                    <div class="text-secondary mt-1">
                        수입과 지출 거래에 사용할 대분류와 소분류를 관리합니다.
                    </div>
                </div>

                <div class="col-auto ms-auto">
                    <button type="button"
                            class="btn btn-primary"
                            data-bs-toggle="modal"
                            data-bs-target="#categoryAddModal">
                        + 카테고리 추가
                    </button>
                </div>

            </div>
        </div>
    </div>

    <div class="page-body">
        <div class="container-xl">

            <div class="row row-cards">

                <!-- 수입 카테고리 -->
                <div class="col-lg-6">
                    <div class="card">

                        <div class="card-header">
                            <h3 class="card-title text-success">
                                수입 카테고리
                            </h3>

                            <div class="card-actions">
                                <span class="badge bg-green-lt">
                                    INCOME
                                </span>
                            </div>
                        </div>

                        <div class="card-body">

                            <div class="datagrid">

                                <div class="datagrid-item">
                                    <div class="datagrid-title">
                                        근로소득
                                        <span class="badge bg-azure-lt ms-1">
                                            고정수입
                                        </span>
                                    </div>

                                    <div class="datagrid-content">
                                        <span class="badge bg-secondary-lt">
                                            월급
                                        </span>

                                        <span class="badge bg-secondary-lt">
                                            보너스
                                        </span>

                                        <button class="btn btn-sm btn-ghost-primary ms-2">
                                            수정
                                        </button>

                                        <button class="btn btn-sm btn-ghost-danger">
                                            삭제
                                        </button>
                                    </div>
                                </div>

                                <div class="datagrid-item">
                                    <div class="datagrid-title">
                                        사업소득
                                    </div>

                                    <div class="datagrid-content">
                                        <span class="badge bg-secondary-lt">
                                            부수입
                                        </span>

                                        <span class="badge bg-secondary-lt">
                                            프리랜서
                                        </span>

                                        <button class="btn btn-sm btn-ghost-primary ms-2">
                                            수정
                                        </button>

                                        <button class="btn btn-sm btn-ghost-danger">
                                            삭제
                                        </button>
                                    </div>
                                </div>

                                <div class="datagrid-item">
                                    <div class="datagrid-title">
                                        금융소득
                                    </div>

                                    <div class="datagrid-content">
                                        <span class="badge bg-secondary-lt">
                                            이자소득
                                        </span>

                                        <span class="badge bg-secondary-lt">
                                            배당금
                                        </span>

                                        <button class="btn btn-sm btn-ghost-primary ms-2">
                                            수정
                                        </button>

                                        <button class="btn btn-sm btn-ghost-danger">
                                            삭제
                                        </button>
                                    </div>
                                </div>

                                <div class="datagrid-item">
                                    <div class="datagrid-title">
                                        기타수입
                                    </div>

                                    <div class="datagrid-content">
                                        <span class="badge bg-secondary-lt">
                                            용돈
                                        </span>

                                        <span class="badge bg-secondary-lt">
                                            환급금
                                        </span>

                                        <button class="btn btn-sm btn-ghost-primary ms-2">
                                            수정
                                        </button>

                                        <button class="btn btn-sm btn-ghost-danger">
                                            삭제
                                        </button>
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>

                <!-- 지출 카테고리 -->
                <div class="col-lg-6">
                    <div class="card">

                        <div class="card-header">
                            <h3 class="card-title text-danger">
                                지출 카테고리
                            </h3>

                            <div class="card-actions">
                                <span class="badge bg-red-lt">
                                    EXPENSE
                                </span>
                            </div>
                        </div>

                        <div class="card-body">

                            <div class="datagrid">

                                <div class="datagrid-item">
                                    <div class="datagrid-title">
                                        주거비
                                        <span class="badge bg-orange-lt ms-1">
                                            고정지출
                                        </span>
                                    </div>

                                    <div class="datagrid-content">
                                        <span class="badge bg-secondary-lt">
                                            관리비
                                        </span>

                                        <span class="badge bg-secondary-lt">
                                            전기세
                                        </span>

                                        <span class="badge bg-secondary-lt">
                                            월세
                                        </span>

                                        <button class="btn btn-sm btn-ghost-primary ms-2">
                                            수정
                                        </button>

                                        <button class="btn btn-sm btn-ghost-danger">
                                            삭제
                                        </button>
                                    </div>
                                </div>

                                <div class="datagrid-item">
                                    <div class="datagrid-title">
                                        식비
                                    </div>

                                    <div class="datagrid-content">
                                        <span class="badge bg-secondary-lt">
                                            식자재
                                        </span>

                                        <span class="badge bg-secondary-lt">
                                            외식
                                        </span>

                                        <span class="badge bg-secondary-lt">
                                            배달
                                        </span>

                                        <span class="badge bg-secondary-lt">
                                            카페
                                        </span>

                                        <button class="btn btn-sm btn-ghost-primary ms-2">
                                            수정
                                        </button>

                                        <button class="btn btn-sm btn-ghost-danger">
                                            삭제
                                        </button>
                                    </div>
                                </div>

                                <div class="datagrid-item">
                                    <div class="datagrid-title">
                                        교통비
                                    </div>

                                    <div class="datagrid-content">
                                        <span class="badge bg-secondary-lt">
                                            대중교통
                                        </span>

                                        <span class="badge bg-secondary-lt">
                                            택시
                                        </span>

                                        <span class="badge bg-secondary-lt">
                                            주유
                                        </span>

                                        <button class="btn btn-sm btn-ghost-primary ms-2">
                                            수정
                                        </button>

                                        <button class="btn btn-sm btn-ghost-danger">
                                            삭제
                                        </button>
                                    </div>
                                </div>

                                <div class="datagrid-item">
                                    <div class="datagrid-title">
                                        생활비
                                    </div>

                                    <div class="datagrid-content">
                                        <span class="badge bg-secondary-lt">
                                            쇼핑
                                        </span>

                                        <span class="badge bg-secondary-lt">
                                            통신비
                                        </span>

                                        <span class="badge bg-secondary-lt">
                                            보험료
                                        </span>

                                        <button class="btn btn-sm btn-ghost-primary ms-2">
                                            수정
                                        </button>

                                        <button class="btn btn-sm btn-ghost-danger">
                                            삭제
                                        </button>
                                    </div>
                                </div>

                                <div class="datagrid-item">
                                    <div class="datagrid-title">
                                        문화 · 여가
                                    </div>

                                    <div class="datagrid-content">
                                        <span class="badge bg-secondary-lt">
                                            영화
                                        </span>

                                        <span class="badge bg-secondary-lt">
                                            여행
                                        </span>

                                        <span class="badge bg-secondary-lt">
                                            취미
                                        </span>

                                        <button class="btn btn-sm btn-ghost-primary ms-2">
                                            수정
                                        </button>

                                        <button class="btn btn-sm btn-ghost-danger">
                                            삭제
                                        </button>
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>

</div>

<!-- 카테고리 추가 모달 -->
<div class="modal modal-blur fade"
     id="categoryAddModal"
     tabindex="-1"
     role="dialog"
     aria-hidden="true">

    <div class="modal-dialog modal-md modal-dialog-centered"
         role="document">

        <div class="modal-content">

            <div class="modal-header">
                <h5 class="modal-title">카테고리 추가</h5>

                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                </button>
            </div>

            <form action="#"
                  method="post">

                <div class="modal-body">

                    <div class="mb-3">
                        <label class="form-label">카테고리 구분</label>

                        <select class="form-select"
                                name="categoryType"
                                required>
                            <option value="">선택하세요</option>
                            <option value="INCOME">수입</option>
                            <option value="EXPENSE">지출</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">대분류명</label>

                        <input type="text"
                               class="form-control"
                               name="majorCategory"
                               placeholder="예: 식비, 근로소득"
                               required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">소분류명</label>

                        <input type="text"
                               class="form-control"
                               name="minorCategory"
                               placeholder="예: 외식, 월급"
                               required>
                    </div>

                    <label class="form-check">
                        <input class="form-check-input"
                               type="checkbox"
                               name="isFixed">

                        <span class="form-check-label">
                            고정수입 또는 고정지출로 설정
                        </span>
                    </label>

                </div>

                <div class="modal-footer">

                    <button type="button"
                            class="btn btn-outline-secondary"
                            data-bs-dismiss="modal">
                        취소
                    </button>

                    <button type="submit"
                            class="btn btn-primary">
                        추가
                    </button>

                </div>

            </form>

        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/com/footer.jsp" />