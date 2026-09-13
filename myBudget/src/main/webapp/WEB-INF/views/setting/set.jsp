<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="adm.dto.noticeDto" %>
<%@ page import="adm.dto.catDto" %>
<%@ page import="adm.dto.accDto" %>
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
				<!-- 소분류 추가 -->
				<button type="button" class="btn btn-sm btn-light text-success border py-0 px-1 edit-area d-none"
				data-bs-toggle="modal"
				data-bs-target="#addSubCatModal"
				data-cat-type="<%=group.getCatType()%>"
				data-cat-nm="<%=group.getCatNm()%>">
				<i class="bi bi-plus-circle"></i> 소분류 추가
				</button>
				<!-- 대분류 수정 -->
				<button class="btn btn-sm btn-light text-primary border py-0 px-1">
				<i class="bi bi-pencil"></i>
				</button>
				<!-- 대분류 삭제 -->
				<button type="button" class="btn btn-sm btn-light text-danger border py-0 px-1" onclick="deleteCat('<%=group.getCatNm()%>')">
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
				<!-- 소분류수정 -->
				<div class="edit-area d-none">
				<button type="button" class="btn btn-sm btn-light text-primary" title="수정" onclick="editSubCat('<%=cat.getCatId()%>')">
				<i class="bi bi-pencil"></i>
				</button>
				<!-- 소분류삭제 -->
				<button type="button" class="btn btn-sm btn-light text-danger" onclick="deleteSubCat('<%=cat.getCatId()%>', '<%=cat.getSubCatNm()%>', '<%=group.getCatNm()%>','<%=group.getSubList().size()%>')">
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
				<div class="card mb-4 w-100">
					
					<div class="card-header">
					<h3 class="card-title">자산/부채 계좌 관리</h3>
					</div>
					<div class="card-body"></div>
					<%
					List<noticeDto> settingNoticeList2 = 
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
					<!-- 자산조회 -->
					<%
					List<accDto> accountList = (List<accDto>)request.getAttribute("accountList");
					%>
					<!-- 자산 CRUD -->
					<div class="d-flex justify-content-end align-items-center mb-3 pe-0 me-n2">
					<button type="button" class="btn btn-outline-success btn-sm ms-2" id="addAccountBtn" onclick="openAccountModal()">
					<i class="bi bi-plus-circle"></i> 추가
					</button>
					<button type="button" class="btn btn-outline-primary btn-sm ms-2" id="accountEditBtn" onclick="toggleAccountEdit()">
					<i class="bi bi-pencil-square"></i> 편집
					</button>
					<button type="button" class="btn btn-outline-success btn-sm ms-2 d-none" id="saveBtn" onclick="saveAccountEdit()">
					<i class="bi bi-check-lg"></i> 저장
					</button>
					<button type="button" class="btn btn-outline-secondary btn-sm ms-2 d-none" id="cancelBtn" onclick="location.reload()">
					<i class="bi bi-x-lg"></i> 취소
					</button>
					<div id="accountDeleteArea"></div>
					</div>
					
					<table class="table table-bordered table-hover align-middle text-center" style="table-layout:fixed;">
					<thead class="table-light text-center">
					<tr>
					<th style="width:120px;">구분</th>
					<th style="width:120px;">대분류</th>
					<th style="width:120px;">소분류</th>
					<th style="width:180px;">이름</th>
					<th style="width:140px;">시작금액</th>
					<th style="width:250px;">메모</th>
					<th style="width:100px;">숨기기</th>
					<th class="delete-col d-none" style="width:80px;">삭제</th>
					</tr>
					</thead>
					<tbody>
					<%
					if(accountList != null && !accountList.isEmpty()){
					for(accDto acc : accountList){
					%>
					<tr>
					<!-- 자산/부채 구분 -->
					<td>
					<span class="account-cat-type"
					id="catType_<%=acc.getAccountId()%>"
					data-value="<%=acc.getCatType()%>">
					<%= "ASSET".equals(acc.getCatType()) ? "자산" : "부채" %>
					</span>
					</td>
					<!-- 자산/부채 대분류 -->
					<td>
					<span class="account-cat-nm"
					id="catNm_<%=acc.getAccountId()%>"
					data-id="<%=acc.getCatId()%>">
					<%=acc.getCatNm()%>
					</span>
					</td>
					<!-- 자산/부채 소분류 -->
					<td>
					<span class="account-sub-cat-nm"
					id="subCatNm_<%=acc.getAccountId()%>"
					data-value="<%=acc.getSubCatNm()%>">
					<%=acc.getSubCatNm()%>
					</span>
					</td>
					<!-- 이름 -->
					<td class="text-start">
					<span class="account-title" id="title_<%=acc.getAccountId()%>">
					<%=acc.getTitle()%>
					</span>
					</td>
					<!-- 시작금액 -->
					<td class="text-end">
					<span class="account-amount" id="amount_<%=acc.getAccountId()%>">
					<%=acc.getStartAmount()%>
					</span> 원
					</td>
					<!-- 메모 -->
					<td class="text-start">
					<span class="account-remrk" id="remrk_<%=acc.getAccountId()%>">
					<%=acc.getRemrk()==null?"":acc.getRemrk()%>
					</span>
					</td>
					<!-- 숨기기 -->
					<td class="text-center">
					<input type="checkbox"
					class="form-check-input use-check"
					data-id="<%=acc.getAccountId()%>"
					<%= "N".equals(acc.getUseYn()) ? "checked" : "" %>
					disabled>
					</td>
					<!-- 삭제버튼 -->
					<td class="text-center delete-col d-none">
					<button type="button"
					class="btn btn-sm btn-outline-danger account-delete-btn"
					data-id="<%=acc.getAccountId()%>"
					onclick="deleteAccountRow(this)">
					<i class="bi bi-trash"></i>
					</button>
					</td>
					</tr>
					<%
					}
					}else{
					%>
					<tr>
					<td colspan="7" class="text-muted py-4">
					등록된 자산/부채 정보가 없습니다.
					</td>
					</tr>
					<%
					}
					%>
					</tbody>
					</table>
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

<!-- 자산/부채 추가 Modal -->
<div class="modal fade" id="addAccountModal" tabindex="-1">
<div class="modal-dialog modal-dialog-centered">
<div class="modal-content">

<form action="<%=request.getContextPath()%>/set" method="post">

<input type="hidden" name="action" value="insertAccount">

<div class="modal-header">
<h5 class="modal-title">자산/부채 추가</h5>
<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
</div>


<div class="modal-body">

<!-- 구분 -->
<div class="mb-3">
<label class="form-label">구분</label>
<select class="form-select" id="accountCatType" name="catType" onchange="changeAccountCatType(this)">
<option value="ASSET">자산</option>
<option value="DEBT">부채</option>
</select>
</div>


<!-- 대분류 -->
<div class="mb-3">
<label class="form-label">대분류</label>
<input type="hidden" id="accountCatId" name="catId">
<select class="form-select" id="accountCatNm" name="catNm" onchange="changeAccountCatNm(this)">
</select>
</div>


<!-- 소분류 -->
<div class="mb-3">
<label class="form-label">소분류</label>
<select class="form-select" id="accountSubCatNm" name="subCatNm">
</select>
</div>


<!-- 이름 -->
<div class="mb-3">
<label class="form-label">이름</label>
<input type="text" class="form-control" name="title">
</div>


<!-- 시작금액 -->
<div class="mb-3">
<label class="form-label">시작금액</label>
<input type="number" class="form-control" name="startAmount" value="0">
</div>


<!-- 메모 -->
<div class="mb-3">
<label class="form-label">메모</label>
<textarea class="form-control" name="remrk"></textarea>
</div>


<!-- 사용여부 -->
<div class="mb-3">
<label class="form-label">사용여부</label>
<select class="form-select" name="useYn">
<option value="Y">사용</option>
<option value="N">숨김</option>
</select>
</div>


</div>


<div class="modal-footer">

<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
취소
</button>

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
//카테고리 소분류 삭제
function deleteSubCat(catId, subCatNm, catNm, subCount){

    if(subCount <= 1){
        alert("'" + catNm + "' 대분류 내에 소분류가 최소 1개 이상 존재해야 하므로 삭제할 수 없습니다.");
        return;
    }

    if(!confirm("'" + subCatNm + "' 소분류가 삭제됩니다.")){
        return;
    }

    let form=document.createElement("form");

    form.method="post";
    form.action="<%=request.getContextPath()%>/set";

    let action=document.createElement("input");
    action.type="hidden";
    action.name="action";
    action.value="deleteSubCat";

    let id=document.createElement("input");
    id.type="hidden";
    id.name="catId";
    id.value=catId;


    form.appendChild(action);
    form.appendChild(id);

    document.body.appendChild(form);

    form.submit();

}
//카테고리 대분류 삭제
function deleteCat(catNm){

    if(!confirm("'" + catNm + "'에 포함된 소분류 전체가 삭제됩니다.")){
        return;
    }


    let form = document.createElement("form");

    form.method = "post";
    form.action="<%=request.getContextPath()%>/set";


    let action=document.createElement("input");
    action.type="hidden";
    action.name="action";
    action.value="deleteCat";


    let name=document.createElement("input");
    name.type="hidden";
    name.name="catNm";
    name.value=catNm;


    form.appendChild(action);
    form.appendChild(name);


    document.body.appendChild(form);
    form.submit();

}
function saveAccountEdit(){
    let form=document.createElement("form");
    form.method="post";
    form.action="<%=request.getContextPath()%>/set";
    let action=document.createElement("input");
    action.type="hidden";
    action.name="action";
    action.value="updateAccount";
    form.appendChild(action);
    document.querySelectorAll(".edit-title").forEach(function(item){
        addHidden(form,"accountIdList",item.dataset.id);
        addHidden(form,"titleList",item.value);
    });
    document.querySelectorAll(".edit-amount").forEach(function(item){
        addHidden(form,"amountList",item.value);
    });
    document.querySelectorAll(".edit-remrk").forEach(function(item){
        addHidden(form,"remrkList",item.value);
    });
    document.querySelectorAll(".edit-cat-type").forEach(function(item){
        addHidden(form,"catTypeList",item.value);
    });
    document.querySelectorAll(".edit-cat-nm").forEach(function(item){
        addHidden(form,"catNmList",item.value);
    });
    document.querySelectorAll(".edit-sub-cat-nm").forEach(function(item){
        addHidden(form,"subCatNmList",item.value);
    });
    document.querySelectorAll(".use-check").forEach(function(item){
        addHidden(form,"useYnList",item.checked?"N":"Y");
    });
    document.querySelectorAll("input[name='deleteAccountList']").forEach(function(item){
        form.appendChild(item);
    });
    document.body.appendChild(form);
    form.submit();
}

function addHidden(form,name,value){

    let input=document.createElement("input");
    input.type="hidden";
    input.name=name;
    input.value=value;

    form.appendChild(input);

}function toggleAccountEdit(){

	let btn = document.getElementById("accountEditBtn");
    let saveBtn = document.getElementById("saveBtn");
    let addBtn = document.getElementById("addAccountBtn");
    let cancelBtn = document.getElementById("cancelBtn");

    if(btn.innerText.includes("편집")){

        document.querySelectorAll(".account-cat-type").forEach(function(span){

            let value = span.dataset.value;
            let id = span.id.replace("catType_","");

            span.innerHTML =
            '<select class="form-select form-select-sm edit-cat-type account-select" data-id="'+id+'" onchange="changeCatType(this)">' +
            '<option value="ASSET" '+(value=="ASSET"?"selected":"")+'>자산</option>' +
            '<option value="DEBT" '+(value=="DEBT"?"selected":"")+'>부채</option>' +
            '</select>';

        });


        document.querySelectorAll(".account-cat-nm").forEach(function(span){

            let oldValue = span.innerText;
            let id = span.id.replace("catNm_","");
            let catType = document.querySelector("#catType_"+id).dataset.value;

            let html =
            '<select class="form-select form-select-sm edit-cat-nm" data-id="'+id+'" onchange="changeCatNm(this)">';

            categoryData.filter(function(item){
                return item.catType == catType;
            }).forEach(function(item){

                html += '<option value="'+item.catNm+'" '+(oldValue==item.catNm?"selected":"")+'>'+item.catNm+'</option>';

            });

            html += '</select>';

            span.innerHTML = html;

        });


        document.querySelectorAll(".account-sub-cat-nm").forEach(function(span){

            let value = span.dataset.value;
            let id = span.id.replace("subCatNm_","");

            span.innerHTML =
            '<select class="form-select form-select-sm edit-sub-cat-nm" data-id="'+id+'" data-account-id="'+id+'">' +
            '<option>'+value+'</option>' +
            '</select>';

        });


        document.querySelectorAll(".use-check").forEach(function(check){
            check.disabled = false;
        });

        //삭제
        document.querySelectorAll(".delete-col").forEach(function(col){
		    col.classList.remove("d-none");
		});

        document.querySelectorAll(".account-title").forEach(function(span){

            let id = span.id.replace("title_","");

            span.innerHTML =
            '<input type="text" class="form-control form-control-sm edit-title" data-id="'+id+'" value="'+span.innerText+'">';

        });


        document.querySelectorAll(".account-amount").forEach(function(item){

            let id=item.id.replace("amount_","");
            let oldAmount=item.innerText.replace(/,/g,"").trim();

            item.innerHTML =
            '<input type="number" class="form-control form-control-sm edit-amount" data-id="'+id+'" value="'+oldAmount+'">';

        });


        document.querySelectorAll(".account-remrk").forEach(function(span){

            let id = span.id.replace("remrk_","");

            span.innerHTML =
            '<input type="text" class="form-control form-control-sm edit-remrk" data-id="'+id+'" value="'+span.innerText+'">';

        });


        // 버튼 변경
        btn.classList.add("d-none");
        addBtn.classList.add("d-none");
        saveBtn.classList.remove("d-none");
        cancelBtn.classList.remove("d-none");


    }else{

        location.reload();

    }

}

let categoryData = [
	<%
	for(catGroupDto group : categoryGroup){
	%>
	{
	    catType:"<%=group.getCatType()%>",
	    catId:"<%=group.getCatId()%>",
	    catNm:"<%=group.getCatNm()%>",
	    subList:[
	    <%
	    for(catDto cat : group.getSubList()){
	    %>
	        "<%=cat.getSubCatNm()%>",
	    <%
	    }
	    %>
	    ]
	},
	<%
	}
	%>
	];
	
//자산/부채 추가
function openAccountModal(){

    changeAccountCatType(
        document.getElementById("accountCatType")
    );

    let modal = new bootstrap.Modal(
        document.getElementById("addAccountModal")
    );

    modal.show();

}


function changeAccountCatType(select){

    let catType = select.value;

    let target = document.getElementById("accountCatNm");

    let html="";


    categoryData.filter(function(item){

        return item.catType == catType;

    }).forEach(function(item){

    	html += '<option value="'+item.catNm+'" data-id="'+item.catId+'">'+item.catNm+'</option>';

    });


    target.innerHTML = html;

    changeAccountCatNm(target);

}



function changeAccountCatNm(select){

	 let option = select.options[select.selectedIndex];
    document.getElementById("accountCatId").value = option.dataset.id;
    let catNm = select.value;
    let target = document.getElementById("accountSubCatNm");
    let html="";


    categoryData.filter(function(item){

        return item.catNm == catNm;

    }).forEach(function(item){

        item.subList.forEach(function(sub){

            html += '<option value="'+sub+'">'+sub+'</option>';

        });

    });


    target.innerHTML = html;

}

// 구분 변경 → 대분류 변경
function changeCatType(select){

    let id = select.dataset.id;
    let catType = select.value;

    let target = document.querySelector("#catNm_"+id);

    let html =
    '<select class="form-select form-select-sm edit-cat-nm" data-id="'+id+'" onchange="changeCatNm(this)">';


    categoryData.filter(function(item){

        return item.catType == catType;

    }).forEach(function(item){

        html += '<option value="'+item.catNm+'">'+item.catNm+'</option>';

    });


    html += '</select>';

    target.innerHTML = html;

    target.querySelector("select").dispatchEvent(new Event("change"));

}


// 대분류 변경 → 소분류 변경
function changeCatNm(select){

    let id = select.dataset.id;
    let catNm = select.value;

    let target = document.querySelector("#subCatNm_"+id);


    let html =
    '<select class="form-select form-select-sm edit-sub-cat-nm" data-id="'+id+'">';


    categoryData.filter(function(item){

        return item.catNm == catNm;

    }).forEach(function(item){

        item.subList.forEach(function(sub){

            html += '<option>'+sub+'</option>';

        });

    });


    html += '</select>';

    target.innerHTML = html;

}

//자산/부채 삭제
function deleteAccountRow(btn){

    if(!confirm("해당 자산/부채를 삭제하시겠습니까?")){
        return;
    }

    let id = btn.dataset.id;

    let input = document.createElement("input");
    input.type = "hidden";
    input.name = "deleteAccountList";
    input.value = id;

    document.getElementById("accountDeleteArea").appendChild(input);

    btn.closest("tr").remove();

}
</script>

<jsp:include page="/WEB-INF/views/com/footer.jsp" />