package table;
import java.io.*;
import java.sql.Connection;
import java.sql.Statement;
import java.util.*;
import connect.*;


public class CreateTable 
{
	public static void createTab(String path)
	{
		
		try
		{
		System.out.println("Path of the Table "+path);
		
		FileInputStream fr=new FileInputStream(path);
		byte br[]=new byte[fr.available()];
		fr.read(br);
				
		fr.close();
		
		String data=new String(br);
		StringTokenizer str=new StringTokenizer(data,"/");	
		Connection con=ConnectionProvider.getConnection();
		Statement st=con.createStatement();
		String query;
		while(str.hasMoreTokens())
		{
			query=str.nextToken();
			if(query.trim().equals("stop"))
			{
			break;
			}
			st.executeUpdate(query);
			System.out.println(" Token"+query);
		}
		}catch(Exception e)
		{
			System.out.println("Table Allready Exists In the DataBase");
		}
		
	}
}	
