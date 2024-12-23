package com.mycompany.task2;


import java.sql.*;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author USER
 */
public class ConnectionDB {
    public static Connection initializeDatabase() throws SQLException, ClassNotFoundException {

        String URL = "jdbc:mysql://localhost:3306/Tasks"; 
        String Username = "root";  
        String Password = "Hadeel1420";  

        Class.forName("com.mysql.cj.jdbc.Driver");
     
        return DriverManager.getConnection(URL, Username, Password);
    }
    
}
