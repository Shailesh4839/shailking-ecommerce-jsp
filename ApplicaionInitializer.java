package Initializer;
import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import connect.*;
import table.*;
import loadprop.*;


public class ApplicaionInitializer extends HttpServlet
{
	
	public void init(javax.servlet.ServletConfig sc) 
	{
		
		try
		{
		ServletContext ctx=sc.getServletContext();
		String val=ctx.getInitParameter("oracletab");

		String prop=ctx.getRealPath("WEB-INF\\db\\db.properties");
		String oracle=ctx.getRealPath("WEB-INF\\dbtable\\tables.txt");
		System.out.println("Path of db.properties file "+prop);
		LoadProperties.load(prop);
		
			if(val.equals("yes"))
			{
				CreateTable.createTab(oracle);
				
				System.out.println("******************Table Created Successfully**********");
			}
			else
			{
				System.out.println("************No permistion to create table**************");
			}
		
	}catch(Exception e)
{
System.out.println("error in Apllication Initializer");
}
}
}
