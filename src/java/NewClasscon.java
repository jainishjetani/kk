
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Jetani
 */
public class NewClasscon {

     static String dbName = "StudentDB";
     static String userName = "admin";
     static String password = "123admin";
     static String hostname = "database-1.c6jevgf51ssc.us-east-1.rds.amazonaws.com";
     static String port = "3306";
     static String jdbcUrl = "jdbc:mysql://" + hostname + ":" + port + "/" + dbName + "?user=" + userName + "&password=" + password;
      
    
      static Connection connection=null;
      
    
    public static void main(String[] args) throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException {
       
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        connection = DriverManager.getConnection(jdbcUrl);
        PreparedStatement ps= connection.prepareStatement("INSERT INTO `studenttable` (`id`, `name`, `email`, `city`, `phone`, `department`) VALUES ( 'mali', 'naini@sad', 'as', '99734674', 'MCA');");
        
        int status= ps.executeUpdate();
        if(status !=0)
        {
            System.out.print("Database was connection");
        }
        
    }
    
    
    
}
