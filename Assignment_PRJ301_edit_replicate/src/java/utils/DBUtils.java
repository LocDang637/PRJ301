/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utils;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;


/**
 *
 * @author Tony
 */
public class DBUtils implements Serializable {
    public static Connection getConnection() {
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url =("jdbc:sqlserver://localhost:1433;databaseName=shoesShop");
            Connection con = DriverManager.getConnection(url, "sa","12345");
            return con;
        }catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
