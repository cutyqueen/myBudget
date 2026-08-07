<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="dto.NoticeDto" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 - OnLine</title>

<style>
    body {
        margin: 0;
        color: #222;
        font-family: Arial, "Malgun Gothic", sans-serif;
        background-color: #f5f7fb;
    }

    .header {
        padding: 24px 8%;
        color: white;
        background-color: #1557a6;
    }

    .logo {
        font-size: 26px;
        font-weight: bold;
    }

    .container {
        width: 84%;
        max-width: 1100px;
        min-height: 650px;
        margin: 0 auto;
        padding: 60px 0;
    }

    .page-title {
        margin-bottom: 30px;
    }

    .page-title h1 {
        margin-bottom: 10px;
    }

    .notice-table {
        width: 100%;
        border-collapse: collapse;
        background-color: white;
    }

    .notice-table th,
    .notice-table td {
        padding: 16px;
        border-bottom: 1px solid #e5e7eb;
        text-align: center;
    }

    .notice-table th {
        color: white;
        background-color: #334155;
    }

    .notice-table td:nth-child(2) {
        text-align: left;
    }

    .notice-title {
        color: #1557a6;
        font-weight: bold;
    }
</style>
</head>

<body>

<header class="header">
    <div class="logo">OnLine</div>
</header>

<main class="container">

    <section class="page-title">
        <h1>공지사항</h1>
        <p>OnLine의 주요 소식을 확인할 수 있습니다.</p>
    </section>

    <table class="notice-table">
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>
        </thead>

        <tbody>
        <%
            List<NoticeDto> noticeList =
                    (List<NoticeDto>) request.getAttribute("noticeList");

            for (NoticeDto notice : noticeList) {
        %>
            <tr>
                <td><%= notice.getNoticeId() %></td>
                <td class="notice-title">
                    <%= notice.getTitle() %>
                </td>
                <td><%= notice.getWriter() %></td>
                <td><%= notice.getCreatedDate() %></td>
                <td><%= notice.getViewCount() %></td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>

</main>

</body>
</html>