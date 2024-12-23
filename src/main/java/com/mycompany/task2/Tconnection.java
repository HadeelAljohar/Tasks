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
public class Tconnection {
    public static void main(String[]args){
    try {
            // اختبار الاتصال
            Connection connection = ConnectionDB.initializeDatabase();
            if (connection != null) {
                System.out.println("Connection to the database was successful!");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("Connection failed!");
        }
}
}
