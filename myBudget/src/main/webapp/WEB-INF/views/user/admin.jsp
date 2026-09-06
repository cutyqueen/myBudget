<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="adm.dto.userDto" %>
<%@ page import="adm.dto.noticeDto" %>

<%
    request.setAttribute("pageTitle", "시스템 관리 | myBudget");
%>

<jsp:include page="/WEB-INF/views/com/header.jsp" />
<jsp:include page="/WEB-INF/views/com/sidebar.jsp" />

<div class="page-wrapper">

    <div class="page-header d-print-none">
        <div class="container-xl">
            <div class="row g-2 align-items-center">
                <div class="col">
                    <h2 class="page-title">시스템 관리</h2>
                    <div class="text-secondary mt-1">
                        사용자 및 공지사항을 관리합니다.
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="page-body">
        <div class="container-xl">
			<!-- 탭 메뉴 -->
			<div class="card mb-4">
			    <div class="card-header">
			        <ul class="nav nav-tabs card-header-tabs" role="tablist">
			            <li class="nav-item">
			                <a class="nav-link active" href="<%= request.getContextPath() %>/user/admin">
			                    사용자 관리
			                </a>
			            </li>
			            <li class="nav-item">
			                <a class="nav-link" href="<%= request.getContextPath() %>/notice/list">
			                    공지사항 관리
			                </a>
			            </li>
			        </ul>
			    </div>
			    <div class="card-body">
			        <div class="tab-content">
			
			            <!-- 사용자 관리 탭 -->
			            <div class="tab-pane fade show active" id="tab-user">
			                <div class="card">
			                    <div class="card-header">
			                        <h3 class="card-title">사용자 목록</h3>
			                    </div>
			                    <div class="card-body">
			                        <div class="table-responsive">
			                            <table class="table table-sm card-table table-hover">
			                                <thead class="table-light">
			                                    <tr>
			                                        <th>ID</th>
			                                        <th>이름</th>
			                                        <th>이메일</th>
			                                        <th>전화번호</th>
			                                        <th>가계부시작년도</th>
			                                        <th>가계부시작월</th>
			                                        <th>가입일</th>
			                                        <th>상태</th>
			                                    </tr>
			                                </thead>
			                                <tbody>
			                                    <%
			                                    List<userDto> userList = (List<userDto>) request.getAttribute("userList");
			                                    if (userList != null && userList.size() > 0) {
			                                        for (userDto user : userList) {
			                                    %>
			                                    <tr>
			                                        <td><%= user.getUserId() %></td>
			                                        <td><%= user.getUserNm() %></td>
			                                        <td><%= user.getEmail() %></td>
			                                        <td><%= user.getMbpno() %></td>
			                                        <td><%= user.getSetYear() %></td>
			                                        <td><%= user.getSetMonth() %></td>
			                                        <td><%= user.getBeginDt() %></td>
			                                        <td><%= user.getStatusNm() %></td>
			                                    </tr>
			                                    <%
			                                        }
			                                    } else {
			                                    %>
			                                    <tr>
			                                        <td colspan="8" class="text-center">등록된 사용자가 없습니다.</td>
			                                    </tr>
			                                    <%
			                                    }
			                                    %>
			                                </tbody>
			                            </table>
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

<jsp:include page="/WEB-INF/views/com/footer.jsp" />