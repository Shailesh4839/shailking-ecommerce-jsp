package loadprop;
import java.io.*;
import java.util.*;
public class LoadProperties
{
	
		public static void load(String path)
		{
			
			try
			{
			FileInputStream fin=new FileInputStream(path);
			Properties p=new Properties();
			p.load(fin);
			Enumeration en=p.propertyNames();
			while(en.hasMoreElements())
			{
			String key=(String)en.nextElement();
			String value=p.getProperty(key);
			System.setProperty(key,value);
			System.out.println(key+" : "+value);
			}				
			}
			catch(Exception e)
			{
				System.out.println("Error in PropertiesLoad");			}
		}
	
	
			
}