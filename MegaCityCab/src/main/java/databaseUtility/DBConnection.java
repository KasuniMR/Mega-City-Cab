package databaseUtility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
public static DBConnection instance;
 private static final String URL = "jdbc:mysql://localhost:3306/mega_city_cab";
 private static final String USER = "root"; 
 private static final String PASSWORD = "Kasuni2003@#$"; 
 private static final String DRIVER = "com.mysql.cj.jdbc.Driver";

 public static Connection getConnection() throws ClassNotFoundException, SQLException {
     Class.forName(DRIVER);
     return DriverManager.getConnection(URL, USER, PASSWORD);
 }
}

