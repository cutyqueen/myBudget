<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="adm.dto.noticeDto" %>

<%
    request.setAttribute("pageTitle", "공지사항 관리 | myBudget");
    String noticeMenu = request.getParameter("noticeMenu");
    if (noticeMenu == null || noticeMenu.equals("")) {
        noticeMenu = "set";
    }
%>

<jsp:include page="/WEB-INF/views/com/header.jsp" />
<jsp:include page="/WEB-INF/views/com/sidebar.jsp" />

<div class="page-wrapper">

    <div class="page-header d-print-none">
        <div class="container-xl">
            <div class="row g-2 align-items-center">
                <div class="col">
                    <h2 class="page-title">공지사항 관리</h2>
                    <div class="text-secondary mt-1">
                        각 메뉴별 공지사항을 관리합니다.
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
                            <a class="nav-link" href="<%= request.getContextPath() %>/user/admin">
                                사용자 관리
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="<%= request.getContextPath() %>/notice/list">
                                공지사항 관리
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="card-body">
                    <div class="tab-content">

                        <!-- 공지사항 관리 탭 -->
                        <div class="tab-pane fade show active" id="tab-notice">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">공지사항 목록</h3>
                                    <div class="card-actions">
                                        <a href="<%= request.getContextPath() %>/notice/write" class="btn btn-primary btn-sm">
                                            + 공지사항 작성
                                        </a>
                                    </div>
                                </div>
                                <div class="card-body">
                                    
                                    <div class="table-responsive">
                                        <table class="table table-sm card-table table-hover">
                                            <thead class="table-light">
                                                <tr>
                                                    <th style="width: 60px;">순서</th>
                                                    <th>제목</th>
                                                    <th>사용메뉴</th>
                                                    <th style="width: 100px;">사용여부</th>
                                                    <th style="width: 150px;">관리</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                List<noticeDto> noticeList = (List<noticeDto>) request.getAttribute("noticeList");
                                                if (noticeList != null && noticeList.size() > 0) {
                                                    int idx = 0;
                                                    for (noticeDto notice : noticeList) {
                                                        idx++;
                                                %>
                                                <tr>
                                                    <td><%= idx %></td>
                                                    <td><%= notice.getTitle() %></td>
                                                    <td><%= notice.getUseMenu() %></td>
                                                    <td class="text-center">
                                                        <% if ("Y".equals(notice.getUseYn())) { %>
                                                            <span>Y</span>
                                                        <% } else { %>
                                                            <span>N</span>
                                                        <% } %>
                                                    </td>
                                                    <td>
                                                        <a href="<%= request.getContextPath() %>/notice/edit?noticeId=<%= notice.getNoticeId() %>" class="btn btn-sm btn-outline-primary">수정</a>
                                                        <a href="<%= request.getContextPath() %>/notice/delete?noticeId=<%= notice.getNoticeId() %>&noticeMenu=<%= notice.getNoticeMenu() %>" class="btn btn-sm btn-outline-danger" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                                                    </td>
                                                </tr>
                                                <%
                                                    }
                                                } else {
                                                %>
                                                <tr>
                                                    <td colspan="5" class="text-center">등록된 공지사항이 없습니다.</td>
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