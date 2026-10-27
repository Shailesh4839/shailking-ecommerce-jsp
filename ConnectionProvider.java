package connect;
import java.io.FileInputStream;
import java.sql.*;
import java.util.Properties;
public class ConnectionProvider
{

	private static Connection con=null;
		
		public static  Connection getConnection()
		{
			try
			{

			if(con == null)
			{
			String driver=System.getProperty("driver");
			String url=System.getProperty("url");
			String user=System.getProperty("user");
			String password=System.getProperty("passd");
			Class.forName(driver);
			Connection con=DriverManager.getConnection(url,user,password);
			System.out.println("Connecitn ..........."+con);
			return con;
			}

			}
			catch(Exception e)
			{
				System.out.println("Error in ConnectionProvider");
			}
			return con;
		}
}