<%-- 
    Document   : admin
   Created on : ???/???/????, ?:??:?? ?
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    if (!"admin".equals(session.getAttribute("role"))) {
        response.sendRedirect("index.html");
        return;
    }
%>
<link rel="stylesheet" href="style.css">
<div class="container">
<h1>Admin Dashboard</h1>
<a href="addtask.jsp">Add Task</a>
<a href="alltask.jsp">View All Tasks</a>
</div>