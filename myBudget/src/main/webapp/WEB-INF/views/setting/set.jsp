<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="adm.dto.noticeDto" %>
<%@ page import="adm.dto.catDto" %>
<%@ page import="java.util.List" %>
<%@ page import="adm.dto.catGroupDto" %>

<%
request.setAttribute("pageTitle", "가계부 설정 | myBudget");

// 현재 년도, 월 구하기
String currentYear = String.valueOf(java.time.LocalDate.now().getYear());
String currentMonth = String.format("%02d", java.time.LocalDate.now().getMonthValue());

String setYear = request.getAttribute("setYear") != null
        ? (String) request.getAttribute("setYear")
        : currentYear;

String setMonth = request.getAttribute("setMonth") != null
        ? (String) request.getAttribute("setMonth")
        : currentMonth;
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
				<!-- 섹션 2: 공지사항 -->
				<%
				List<noticeDto> settingNoticeList = 
				    (List<noticeDto>) request.getAttribute("settingNoticeList");
				if (settingNoticeList != null) {
				    for (noticeDto settingNotice : settingNoticeList) {
				        if ("TOP".equals(settingNotice.getPosition())) {
				%>
				        <div class="alert alert-light">
				            <strong><%= settingNotice.getTitle() %></strong>
				            <div class="mb-0 mt-2">
				                <%= settingNotice.getContent().replace("\n", "<br>") %>
				            </div>
				        </div>
				<%
				        }
				    }
				}
				%>
				<!-- 카테고리 관리 -->
				<div class="d-flex justify-content-between align-items-center mb-3">
				<h4 class="fw-bold mb-0">카테고리 관리</h4>
				<div>
				<button type="button" class="btn btn-outline-success btn-sm me-2 edit-area d-none" data-bs-toggle="modal" data-bs-target="#addCatModal"><i class="bi bi-folder-plus"></i> 대분류 추가</button>
				<button type="button" class="btn btn-outline-primary btn-sm" id="editBtn" onclick="toggleEdit()"><i class="bi bi-pencil-square"></i> 편집</button>
				</div>
				</div>
				<table class="table table-bordered align-middle">
				<thead class="table-light text-center">
				<tr>
				<th style="width:120px;">구분</th>
				<th style="width:220px;">대분류</th>
				<th>소분류 (고정수입, 고정지출에 ☑️체크 하세요)</th>
				</tr>
				</thead>
				<tbody>
				<%
				List<catGroupDto> categoryGroup = (List<catGroupDto>)request.getAttribute("categoryGroup");
				String beforeType = "";
				for(catGroupDto group : categoryGroup){
				%>
				<tr>
				<td class="text-center fw-bold <%= "ASSET".equals(group.getCatType()) ? "table-primary" : "DEBT".equals(group.getCatType()) ? "table-danger" : "INCOME".equals(group.getCatType()) ? "table-success" : "table-warning" %>">
				<%= !beforeType.equals(group.getCatType()) ? ("ASSET".equals(group.getCatType()) ? "자산" : "DEBT".equals(group.getCatType()) ? "부채" : "INCOME".equals(group.getCatType()) ? "수입" : "지출") : "" %>
				</td>
				<td class="fw-bold">
				<div class="d-flex justify-content-between align-items-center">
				<span><%=group.getCatNm()%></span>
				</div>
				<div class="text-end mt-2 edit-area d-none">
				<div class="d-flex align-items-center gap-1 mt-1 edit-area d-none">
				<button type="button" class="btn btn-sm btn-light text-success border py-0 px-1 edit-area d-none"
				data-bs-toggle="modal"
				data-bs-target="#addSubCatModal"
				data-cat-type="<%=group.getCatType()%>"
				data-cat-nm="<%=group.getCatNm()%>">
				<i class="bi bi-plus-circle"></i> 소분류 추가
				</button>
				<button class="btn btn-sm btn-light text-primary border py-0 px-1">
				<i class="bi bi-pencil"></i>
				</button>
				<button class="btn btn-sm btn-light text-danger border py-0 px-1">
				<i class="bi bi-trash"></i>
				</button>
				</div>

				</div>
				</td>
				<td>
				<div class="row g-2">
				<%
				for(catDto cat : group.getSubList()){
				%>
				<div class="col-md-4">
				<div class="border rounded p-2 d-flex justify-content-between align-items-center">
				<label class="form-check mb-0">
				<input class="form-check-input fix-check" type="checkbox" data-id="<%=cat.getCatId()%>" <%= "Y".equals(cat.getFixYn()) ? "checked" : "" %> disabled>
				<span class="ms-2 sub-cat-name" id="subCat_<%=cat.getCatId()%>"><%=cat.getSubCatNm()%></span>
				</label>
				
				<div class="edit-area d-none">
				<button type="button" class="btn btn-sm btn-light text-primary" title="수정" onclick="editSubCat('<%=cat.getCatId()%>')">
				<i class="bi bi-pencil"></i>
				</button>
				
				<button type="button" class="btn btn-sm btn-light text-danger" title="삭제">
				<i class="bi bi-trash"></i>
				</button>
				</div>
				</div>
				</div>
				<%
				}
				%>
				</div>
				</td>
				</tr>
				<%
				beforeType = group.getCatType();
				}
				%>
				</tbody>
				</table>
				<!-- 섹션 3: 자산/부채 계좌 입력 -->
				<div class="card mb-4">
					<div class="card-header">
						<h3 class="card-title">자산/부채 계좌 관리</h3>
					</div>
					<div class="card-body">
					<%
					List<noticeDto> settingNoticeList2 = 
					    (List<noticeDto>) request.getAttribute("settingNoticeList");
					if (settingNoticeList != null) {
					    for (noticeDto settingNotice : settingNoticeList) {
					        if ("MID".equals(settingNotice.getPosition())) {
					%>
					        <div class="alert alert-info">
					            <strong><%= settingNotice.getTitle() %></strong>
					            <div class="mb-0 mt-2">
					                <%= settingNotice.getContent().replace("\n", "<br>") %>
					            </div>
					        </div>
					<%
					        }
					    }
					}
					%>
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

<!-- 대분류 추가 Modal -->
<div class="modal fade" id="addCatModal" tabindex="-1">
<div class="modal-dialog modal-dialog-centered">
<div class="modal-content">

<form action="<%=request.getContextPath()%>/set" method="post">

<input type="hidden" name="action" value="insertCatNm">

<div class="modal-header">
<h5 class="modal-title">대분류 추가</h5>
<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
</div>

<div class="modal-body">

<div class="mb-3">
<label class="form-label">구분</label>
<select class="form-select" name="catType">
<option value="ASSET">자산</option>
<option value="DEBT">부채</option>
<option value="INCOME">수입</option>
<option value="EXPENSE">지출</option>
</select>
</div>

<div class="mb-3">
<label class="form-label">대분류명</label>
<input type="text" class="form-control" name="catNm">
</div>

</div>

<div class="modal-footer">
<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
<button type="submit" class="btn btn-primary">저장</button>
</div>

</form>

</div>
</div>
</div>


<!-- 소분류 추가 Modal -->
<div class="modal fade" id="addSubCatModal" tabindex="-1">
<div class="modal-dialog modal-dialog-centered">
<div class="modal-content">

<form action="<%=request.getContextPath()%>/set" method="post">

<input type="hidden" name="action" value="insertSubCat">

<input type="hidden" id="subCatType" name="catType">
<input type="hidden" id="subCatNm" name="catNm">

<div class="modal-header">
<h5 class="modal-title">소분류 추가</h5>
<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
</div>

<div class="modal-body">

<div class="mb-3">
<label class="form-label">대분류</label>
<input type="text" class="form-control" id="showCatNm" readonly>
</div>

<div class="mb-3">
<label class="form-label">소분류명</label>
<input type="text" class="form-control" name="subCatNm">
</div>

<div class="mb-3">
<label class="form-label">고정수입ㆍ지출여부</label>
<select class="form-select" name="fixYn">
<option value="N">변동</option>
<option value="Y">고정</option>
</select>
</div>

</div>

<div class="modal-footer">
<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
<button type="submit" class="btn btn-primary">
<i class="bi bi-save"></i> 저장
</button>
</div>

</form>

</div>
</div>
</div>

<script>
function toggleEdit(){
	//대분류 모달
    let editArea = document.querySelectorAll(".edit-area");
    let editBtn = document.getElementById("editBtn");
    let checks = document.querySelectorAll(".fix-check");

    editArea.forEach(function(item){
        item.classList.toggle("d-none");
    });

    checks.forEach(function(check){
        check.disabled = !check.disabled;
    });

    if(editBtn.classList.contains("btn-outline-primary")){

        editBtn.innerHTML='<i class="bi bi-save"></i> 저장';
        editBtn.classList.remove("btn-outline-primary");
        editBtn.classList.add("btn-outline-success");

    }else{

        /* editBtn.innerHTML='<i class="bi bi-pencil-square"></i> 편집';
        editBtn.classList.remove("btn-outline-success");
        editBtn.classList.add("btn-outline-primary"); */
    	saveCategory();

    }
}
	//소분류 모달
	document.querySelectorAll('[data-bs-target="#addSubCatModal"]').forEach(function(btn){
    btn.addEventListener('click',function(){

    document.getElementById('subCatType').value = this.dataset.catType;
    document.getElementById('subCatNm').value = this.dataset.catNm;
    document.getElementById('showCatNm').value = this.dataset.catNm;

    });

});
	//소분류 명칭수정
	function editSubCat(catId){

    let span = document.getElementById("subCat_"+catId);
    let oldName = span.innerText;

    span.innerHTML =
    '<input type="text" class="form-control form-control-sm sub-edit" data-id="'+catId+'" value="'+oldName+'">';

	}
	
//소분류 편집 저장
function saveCategory(){

    let form = document.createElement("form");

    form.method = "post";
    form.action = "<%=request.getContextPath()%>/set";

    let action = document.createElement("input");
    action.type="hidden";
    action.name="action";
    action.value="updateCategory";

    form.appendChild(action);

    console.log("CAT ID");
    document.querySelectorAll(".fix-check").forEach(function(check){

        let catId = document.createElement("input");
        catId.type="hidden";
        catId.name="catIdList";
        catId.value=check.dataset.id;

        let fixYn = document.createElement("input");
        fixYn.type="hidden";
        fixYn.name="fixYnList";
        fixYn.value=check.checked ? "Y" : "N";

        form.appendChild(catId);
        form.appendChild(fixYn);

    });
    console.log("SUB NAME");

    document.querySelectorAll(".sub-cat-name").forEach(function(span){

        let subNm = document.createElement("input");
        subNm.type="hidden";
        subNm.name="subCatNmList";

        let input = span.querySelector("input");

        if(input){
            subNm.value = input.value;
        }else{
            subNm.value = span.textContent.trim();
        }

        form.appendChild(subNm);

    });


    document.body.appendChild(form);
    form.submit();

}
</script>

<jsp:include page="/WEB-INF/views/com/footer.jsp" />