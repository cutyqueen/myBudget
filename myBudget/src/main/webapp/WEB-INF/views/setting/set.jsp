<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/com/header.jsp" />
<jsp:include page="/WEB-INF/views/com/sidebar.jsp" />

<div class="page-wrapper">

    <div class="page-header d-print-none">
        <div class="container-xl">

            <div class="row g-2 align-items-center">

                <div class="col">
                    <h2 class="page-title">가계부 설정</h2>

                    <div class="text-secondary mt-1">
                        카테고리, 계좌, 기준일 등을 설정합니다.
                    </div>
                </div>

                <div class="col-auto ms-auto">

                    <button type="button" class="btn btn-primary">
                        전체 설정 저장하기
                    </button>

                </div>

            </div>
        </div>
    </div>

    <div class="page-body">
        <div class="container-xl">

            <!-- 섹션 1: 가계부 시작 기준일 설정 -->
            <div class="card mb-4">
                <div class="card-header">
                    <h3 class="card-title">가계부 시작 기준일 설정</h3>
                </div>
                <div class="card-body">
                    <div class="row g-3">
                        <div class="col-md-4">
                            <label class="form-label">시작년도</label>
                            <select class="form-select">
                                <option value="2024">2024 년</option>
                                <option value="2025" selected>2025 년</option>
                                <option value="2026">2026 년</option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">회계기준월</label>
                            <select class="form-select">
                                <option value="1">1 월</option>
                                <option value="2">2 월</option>
                                <option value="3">3 월</option>
                                <option value="4">4 월</option>
                                <option value="5">5 월</option>
                                <option value="6">6 월</option>
                                <option value="7">7 월</option>
                                <option value="8">8 월</option>
                                <option value="9">9 월</option>
                                <option value="10">10 월</option>
                                <option value="11">11 월</option>
                                <option value="12" selected>12 월</option>
                            </select>
                        </div>
                        <div class="col-md-4 d-flex align-items-end">
                            <button class="btn btn-outline-primary">저장하기</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 섹션 2: 카테고리 설정 -->
            <div class="card mb-4">
                <div class="card-header">
                    <h3 class="card-title">카테고리 설정</h3>
                </div>
                <div class="card-body">
                    
                    <div class="alert alert-info">
                        <strong>설정 가이드</strong>
                        <ul class="mb-0 mt-2">
                            <li>대분류와 소분류를 상황에 맞게 수정하여 사용하세요.</li>
                            <li>"현금·예금" 대분류는 수정하지 않고 그대로 사용하세요.</li>
                            <li>매월 일정한 고정수입, 고정지출은 체크하세요. 고정/변동 비율을 보고서에서 확인하실 수 있습니다.</li>
                        </ul>
                    </div>
                    
                    <!-- 대분류 목록 -->
                    <div class="card mt-3">
                        <div class="card-header">
                            <h4 class="card-subtitle">대분류 관리</h4>
                        </div>
                        <div class="card-body">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th style="width: 50px;">순서</th>
                                        <th>대분류명</th>
                                        <th style="width: 150px;">아이콘</th>
                                        <th style="width: 150px;">관리</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input type="number" class="form-control form-control-sm" value="1" min="1"></td>
                                        <td>현금·예금</td>
                                        <td><input type="text" class="form-control form-control-sm" value="💰" readonly></td>
                                        <td>
                                            <button class="btn btn-sm btn-outline-primary">수정</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><input type="number" class="form-control form-control-sm" value="2" min="1"></td>
                                        <td>수입</td>
                                        <td><input type="text" class="form-control form-control-sm" value="💵"></td>
                                        <td>
                                            <button class="btn btn-sm btn-outline-primary">수정</button>
                                            <button class="btn btn-sm btn-outline-danger">삭제</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><input type="number" class="form-control form-control-sm" value="3" min="1"></td>
                                        <td>지출</td>
                                        <td><input type="text" class="form-control form-control-sm" value="💸"></td>
                                        <td>
                                            <button class="btn btn-sm btn-outline-primary">수정</button>
                                            <button class="btn btn-sm btn-outline-danger">삭제</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            
                            <button class="btn btn-outline-success mt-2">+ 대분류 추가</button>
                        </div>
                    </div>
                    
                    <!-- 소분류 목록 -->
                    <div class="card mt-3">
                        <div class="card-header">
                            <h4 class="card-subtitle">소분류 관리 (수입)</h4>
                        </div>
                        <div class="card-body">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th style="width: 50px;">순서</th>
                                        <th>소분류명</th>
                                        <th style="width: 80px;">고정</th>
                                        <th style="width: 150px;">관리</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input type="number" class="form-control form-control-sm" value="1" min="1"></td>
                                        <td>월급</td>
                                        <td class="text-center">
                                            <input type="checkbox" class="form-check-input" checked>
                                        </td>
                                        <td>
                                            <button class="btn btn-sm btn-outline-primary">수정</button>
                                            <button class="btn btn-sm btn-outline-danger">삭제</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><input type="number" class="form-control form-control-sm" value="2" min="1"></td>
                                        <td>부수입</td>
                                        <td class="text-center">
                                            <input type="checkbox" class="form-check-input">
                                        </td>
                                        <td>
                                            <button class="btn btn-sm btn-outline-primary">수정</button>
                                            <button class="btn btn-sm btn-outline-danger">삭제</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            
                            <button class="btn btn-outline-success mt-2">+ 소분류 추가</button>
                        </div>
                    </div>
                    
                </div>
            </div>

            <!-- 섹션 3: 자산/부채 계좌 입력 -->
            <div class="card mb-4">
                <div class="card-header">
                    <h3 class="card-title">자산/부채 계좌 관리</h3>
                </div>
                <div class="card-body">
                    
                    <div class="alert alert-info">
                        <strong>입력 가이드</strong>
                        <p class="mb-0 mt-2">
                            모든 자산과 부채를 입력하세요.<br>
                            <strong>[숨기기]</strong> 기능은 더이상 사용하지 않는 계좌를 숨기는 기능입니다. 
                            잔액이 0 인 계좌만 숨기기 기능을 사용할 수 있습니다. (잔액이 남아있을 경우 계산이 달라집니다.)
                        </p>
                    </div>
                    
                    <div class="card mt-3">
                        <div class="card-header">
                            <h4 class="card-subtitle">내 계좌 목록</h4>
                        </div>
                        <div class="card-body">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>구분</th>
                                        <th>계좌명</th>
                                        <th>금융기관</th>
                                        <th>잔액</th>
                                        <th>숨기기</th>
                                        <th>관리</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <select class="form-select form-select-sm">
                                                <option value="asset">자산</option>
                                                <option value="liability">부채</option>
                                            </select>
                                        </td>
                                        <td><input type="text" class="form-control form-control-sm" value="국민은행 통장"></td>
                                        <td><input type="text" class="form-control form-control-sm" value="국민은행"></td>
                                        <td><input type="number" class="form-control form-control-sm" value="1000000"></td>
                                        <td class="text-center">
                                            <input type="checkbox" class="form-check-input" disabled>
                                        </td>
                                        <td>
                                            <button class="btn btn-sm btn-outline-primary">저장</button>
                                            <button class="btn btn-sm btn-outline-danger">삭제</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <select class="form-select form-select-sm">
                                                <option value="asset" selected>자산</option>
                                                <option value="liability">부채</option>
                                            </select>
                                        </td>
                                        <td><input type="text" class="form-control form-control-sm" value="현금"></td>
                                        <td><input type="text" class="form-control form-control-sm" value="-"></td>
                                        <td><input type="number" class="form-control form-control-sm" value="50000"></td>
                                        <td class="text-center">
                                            <input type="checkbox" class="form-check-input">
                                        </td>
                                        <td>
                                            <button class="btn btn-sm btn-outline-primary">저장</button>
                                            <button class="btn btn-sm btn-outline-danger">삭제</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            
                            <button class="btn btn-outline-success mt-2">+ 계좌 추가</button>
                        </div>
                    </div>
                    
                </div>
            </div>

        </div>
    </div>

</div>

<jsp:include page="/WEB-INF/views/com/footer.jsp" />