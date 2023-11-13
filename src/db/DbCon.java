package db;


import java.sql.Connection;
import java.sql.DriverManager;

public class DbCon {
 static Connection con=null;
 public static   Connection con()
 {
	 try
	 {
		Class.forName(DbInitializer.Driver); 
		con=DriverManager.getConnection(DbInitializer.db,DbInitializer.username,DbInitializer.pass);
		return con;
	 }
	 catch(Exception e)
	 {
		 e.printStackTrace();
		 //to handle exception
		 return con;
	 }
 }
}
