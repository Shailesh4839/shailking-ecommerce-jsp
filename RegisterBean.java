package my;
import java.sql.*;
import connect.*;
public class RegisterBean
{
private String userid,pass;
public void setUserid(String userid)
{
this.userid=userid;
}
public String getUserid()
{
return "userid";
}
public void setPass(String pass)
{
this.pass=pass;
}
public String getPass()
{
return "pass";
}


public String register()
{

	try
	{
	System.out.println("from the register method"+userid);
	Connection c=ConnectionProvider.getConnection();
        Statement s= c.createStatement();
        String s1 = "select * from form where name= '"+userid+"'and pass='"+pass+"'";
	ResultSet rs = s.executeQuery(s1);
       	if(rs.next())
	return "UserExists.jsp";
        else
        {
   	int x = s.executeUpdate("insert into form values('"+userid+"','"+pass+"')");           
	return "Registered.jsp";
        }
        }catch(Exception e)
	{ 
                System.out.println(e);
		return "Registered.jsp";
        }

}
}//end of LoginBean Class