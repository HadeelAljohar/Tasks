<%-- 
    Document   : alltask
    Created on : ???/???/????, ?:??:?? ?
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.mycompany.task2.ConnectionDB" %>
<link rel="stylesheet" href="style.css">

<div class="container">
<h1>All Tasks</h1>
<table border="1">
    <tr>
        <th>Title</th>
        <th>Description</th>
        <th>Assigned To</th>
        <th>Status</th>
    </tr>
    <%
        Connection connection = ConnectionDB.initializeDatabase();
        String query = "SELECT t.title, t.description, u.username, t.status FROM tasks t LEFT JOIN users u ON t.assigned_to = u.id";
        PreparedStatement statement = connection.prepareStatement(query);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            String title = resultSet.getString("title");
            String description = resultSet.getString("description");
            String assignedTo = resultSet.getString("username");
            String status = resultSet.getString("status");
    %>
    <tr>
        <td><%= title %></td>
        <td><%= description %></td>
        <td><%= assignedTo %></td>
        <td><%= status %></td>
    </tr>
    <%
        }
        connection.close();
    %>
</table>    
</div>