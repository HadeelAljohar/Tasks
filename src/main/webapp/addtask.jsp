<%-- 
    Document   : addtask
    Created on : ???/???/????, ?:??:?? ?
    Author     : USER
--%>

<%@ page import="java.sql.*" %>
<%@ page import="com.mycompany.task2.ConnectionDB" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Task</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
    <h1>Add Task</h1>
    <form action="add-task" method="post">
        
        <label for="title">Task Title:</label>
        <input type="text" id="title" name="title" required><br><br>

    
        <label for="description">Task Description:</label>
        <textarea id="description" name="description"></textarea><br><br>

       
        <label for="employee">Assign To:</label>
        <select id="employee" name="employee" required>
            <%
               ConnectionDB db = new ConnectionDB(); 
                try {
                    Connection connection = db.initializeDatabase();
                    String query = "SELECT id, username FROM users WHERE role = 'employee'";
                    PreparedStatement statement = connection.prepareStatement(query);
                    ResultSet resultSet = statement.executeQuery();

                    while (resultSet.next()) {
                        int id = resultSet.getInt("id");
                        String username = resultSet.getString("username");
            %>
                        <option value="<%= id %>"><%= username %></option>
            <%
                    }
                    connection.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </select><br><br>

        
        <button type="submit">Add Task</button>
    </form>
    </div>
</body>
</html>
