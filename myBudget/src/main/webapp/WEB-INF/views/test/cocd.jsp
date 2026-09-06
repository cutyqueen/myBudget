<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="adm.dto.cocdDto" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공통코드조회</title>
</head>
<body>

<h2>거래유형</h2>

<%
    List<cocdDto> codeList =
        (List<cocdDto>) request.getAttribute("codeList");
%>

<select>
<%
    if (codeList != null) {
        for (cocdDto code : codeList) {
%>
    <option value="<%= code.getValCd() %>">
        <%= code.getValNm() %>
    </option>
<%
        }
    }
%>
</select>

</body>
</html>