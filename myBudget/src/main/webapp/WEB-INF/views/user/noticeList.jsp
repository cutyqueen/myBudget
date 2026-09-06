<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="adm.dto.noticeDto" %>

<div class="table-responsive">
    <table class="table table-bordered">
        <thead>
            <tr>
                <th style="width: 60px;">순서</th>
                <th>대상 메뉴</th>
                <th>제목</th>
                <th style="width: 100px;">사용</th>
                <th style="width: 150px;">관리</th>
            </tr>
        </thead>
        <tbody>
            <%
            List<noticeDto> noticeList = (List<noticeDto>) request.getAttribute("noticeList");
            if (noticeList != null && noticeList.size() > 0) {
                for (noticeDto notice : noticeList) {
            %>
            <tr>
                <td><%= notice.getSort() %></td>
                <td><%= notice.getNoticeMenu() %></td>
                <td><%= notice.getTitle() %></td>
                <td class="text-center">
                    <% if ("Y".equals(notice.getUseYn())) { %>
                        <span class="badge bg-green-lt">Y</span>
                    <% } else { %>
                        <span class="badge bg-secondary-lt">N</span>
                    <% } %>
                </td>
                <td>
                    <button class="btn btn-sm btn-outline-primary" onclick="editNotice('<%= notice.getNoticeId() %>')">수정</button>
                    <button class="btn btn-sm btn-outline-danger" onclick="deleteNotice('<%= notice.getNoticeId() %>', '<%= notice.getNoticeMenu() %>')">삭제</button>
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