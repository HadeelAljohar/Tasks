<%-- 
    Document   : employee
    Created on : ???/???/????, ?:??:?? ?
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<link rel="stylesheet" href="style.css">

<%
    if (!"employee".equals(session.getAttribute("role"))) {
        response.sendRedirect("index.html");
        return;
    }
%>
<div class="container">
<h1>Employee Dashboard</h1>
<a href="etask.jsp">View Assigned Tasks</a>
</div>