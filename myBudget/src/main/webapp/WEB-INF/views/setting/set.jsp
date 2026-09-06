<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setAttribute("pageTitle", "가계부 설정 | myBudget");

// 현재 년도, 월 구하기
String currentYear = String.valueOf(java.time.LocalDate.now().getYear());
String currentMonth = String.format("%02d", java.time.LocalDate.now().getMonthValue());

String setYear = request.getAttribute("setYear") != null ? 
                 (String)request.getAttribute("setYear") : currentYear;
String setMonth = request.getAttribute("setMonth") != null ? 
                  (String)request.getAttribute("setMonth") : currentMonth;
%>
<jsp:include page="/WEB-INF/views/com/header.jsp" />
<jsp:include page="/WEB-INF/views/com/sidebar.jsp" />

<div class="page-wrapper">

	<div class="page-header d-print-none">
		<div class="container-xl">

			<div class="row g-2 align-items-center">

				<div class="col">
					<h2 class="page-title">가계부 설정</h2>

					<div class="text-secondary mt-1">카테고리, 계좌, 기준일 등을 설정합니다.</div>
				</div>

				<div class="col-auto ms-auto">

					<button type="button" class="btn btn-primary">전체 설정 저장하기</button>

				</div>

			</div>
		</div>
	</div>

	<div class="page-body">
		<div class="container-xl">
			<!-- 메시지 표시 -->
			<%
			String message = (String) request.getAttribute("message");
			%>
			<%
			if (message != null) {
			%>
			<div class="alert alert-success alert-dismissible" role="alert">
				<div class="alert-icon">
					<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24"
						height="24" viewBox="0 0 24 24" stroke-width="2"
						stroke="currentColor" fill="none" stroke-linecap="round"
						stroke-linejoin="round">
						<path stroke="none" d="M0 0h24v24H0z" fill="none" />
						<path d="M5 12l5 5l10 -10" /></svg>
				</div>
				<div class="alert-title"><%=message%></div>
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="close"></button>
			</div>
			<%
			}
			%>
			<form id="settingsForm" method="post"
				action="<%=request.getContextPath()%>/set">
				<!-- 섹션 1: 가계부 시작 기준일 설정 -->
				<div class="card mb-4">
					<div class="card-header">
						<h3 class="card-title">회계 기준일 설정</h3>
					</div>
					<div class="card-body">
						<div class="row g-3">
							<div class="col-md-4">
								<label class="form-label required">회계년도</label> 
								<input type="text" class="form-control" id="acctYear" name="acctYear"
									placeholder="2026"
									value="<%= setYear %>"
									maxlength="4" required>
							</div>
							<div class="col-md-4">
								<label class="form-label required">회계기준월</label> <select
									class="form-select" id="acctMonth" name="acctMonth" required>
									<option value="">선택하세요</option>
									<option value="01" <%= "01".equals(setMonth) ? "selected" : "" %>>1월</option>
									<option value="02" <%= "02".equals(setMonth) ? "selected" : "" %>>2월</option>
									<option value="03" <%= "03".equals(setMonth) ? "selected" : "" %>>3월</option>
									<option value="04" <%= "04".equals(setMonth) ? "selected" : "" %>>4월</option>
									<option value="05" <%= "05".equals(setMonth) ? "selected" : "" %>>5월</option>
									<option value="06" <%= "06".equals(setMonth) ? "selected" : "" %>>6월</option>
									<option value="07" <%= "07".equals(setMonth) ? "selected" : "" %>>7월</option>
									<option value="08" <%= "08".equals(setMonth) ? "selected" : "" %>>8월</option>
									<option value="09" <%= "09".equals(setMonth) ? "selected" : "" %>>9월</option>
									<option value="10" <%= "10".equals(setMonth) ? "selected" : "" %>>10월</option>
									<option value="11" <%= "11".equals(setMonth) ? "selected" : "" %>>11월</option>
									<option value="12" <%= "12".equals(setMonth) ? "selected" : "" %>>12월</option>
								</select>
							</div>
							<div class="col-md-4 d-flex align-items-end">
								<button type="submit" class="btn btn-primary">저장하기</button>
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
											<td><input type="number"
												class="form-control form-control-sm" value="1" min="1"></td>
											<td>현금·예금</td>
											<td><input type="text"
												class="form-control form-control-sm" value="💰" readonly></td>
											<td>
												<button class="btn btn-sm btn-outline-primary">수정</button>
											</td>
										</tr>
										<tr>
											<td><input type="number"
												class="form-control form-control-sm" value="2" min="1"></td>
											<td>수입</td>
											<td><input type="text"
												class="form-control form-control-sm" value="💵"></td>
											<td>
												<button class="btn btn-sm btn-outline-primary">수정</button>
												<button class="btn btn-sm btn-outline-danger">삭제</button>
											</td>
										</tr>
										<tr>
											<td><input type="number"
												class="form-control form-control-sm" value="3" min="1"></td>
											<td>지출</td>
											<td><input type="text"
												class="form-control form-control-sm" value="💸"></td>
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
											<td><input type="number"
												class="form-control form-control-sm" value="1" min="1"></td>
											<td>월급</td>
											<td class="text-center"><input type="checkbox"
												class="form-check-input" checked></td>
											<td>
												<button class="btn btn-sm btn-outline-primary">수정</button>
												<button class="btn btn-sm btn-outline-danger">삭제</button>
											</td>
										</tr>
										<tr>
											<td><input type="number"
												class="form-control form-control-sm" value="2" min="1"></td>
											<td>부수입</td>
											<td class="text-center"><input type="checkbox"
												class="form-check-input"></td>
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
								모든 자산과 부채를 입력하세요.<br> <strong>[숨기기]</strong> 기능은 더이상 사용하지
								않는 계좌를 숨기는 기능입니다. 잔액이 0 인 계좌만 숨기기 기능을 사용할 수 있습니다. (잔액이 남아있을 경우
								계산이 달라집니다.)
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
											<td><select class="form-select form-select-sm">
													<option value="asset">자산</option>
													<option value="liability">부채</option>
											</select></td>
											<td><input type="text"
												class="form-control form-control-sm" value="국민은행 통장"></td>
											<td><input type="text"
												class="form-control form-control-sm" value="국민은행"></td>
											<td><input type="number"
												class="form-control form-control-sm" value="1000000"></td>
											<td class="text-center"><input type="checkbox"
												class="form-check-input" disabled></td>
											<td>
												<button class="btn btn-sm btn-outline-primary">저장</button>
												<button class="btn btn-sm btn-outline-danger">삭제</button>
											</td>
										</tr>
										<tr>
											<td><select class="form-select form-select-sm">
													<option value="asset" selected>자산</option>
													<option value="liability">부채</option>
											</select></td>
											<td><input type="text"
												class="form-control form-control-sm" value="현금"></td>
											<td><input type="text"
												class="form-control form-control-sm" value="-"></td>
											<td><input type="number"
												class="form-control form-control-sm" value="50000"></td>
											<td class="text-center"><input type="checkbox"
												class="form-check-input"></td>
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
			</form>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/com/footer.jsp" />