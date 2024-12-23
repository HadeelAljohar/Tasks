<%-- 
    Document   : etask
    Created on : ???/???/????, ?:??:?? ?
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" session="true" %>
<%@ page import="com.mycompany.task2.ConnectionDB" %>
<link rel="stylesheet" href="style.css">

<%
    int userId = (int) session.getAttribute("userId");
%>
<div class="container">

<h1>My Tasks</h1>
<table border="1">
    <tr>
        <th>Title</th>
        <th>Description</th>
        <th>Status</th>
        <th>Action</th>
    </tr>
    <%
        Connection connection = ConnectionDB.initializeDatabase();
        String query = "SELECT id, title, description, status FROM tasks WHERE assigned_to = ?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setInt(1, userId);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            int taskId = resultSet.getInt("id");
            String title = resultSet.getString("title");
            String description = resultSet.getString("description");
            String status = resultSet.getString("status");
    %>
    <tr>
        <td><%= title %></td>
        <td><%= description %></td>
        <td><%= status %></td>
        <td>
            <% if (!"completed".equals(status)) { %>
            <form action="CompleteTask" method="post">
                <input type="hidden" name="taskId" value="<%= taskId %>">
                <button type="submit">Mark as Completed</button>
            </form>
            <% } %>
        </td>
    </tr>
    <%
        }
        connection.close();
    %>
</table>
</div>