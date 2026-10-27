package my;
import java.util.*;

public class MobileBean
{
javax.servlet.http.HttpServletRequest request;

public void addAttribute(javax.servlet.http.HttpServletRequest request)
{


	try
	{
	this.request=request;
	
	javax.servlet.http.HttpSession session = request.getSession(false);   
	
	String[] selectedmobiles=request.getParameterValues("Mobiles");
	session.setAttribute("selectedmobiles",selectedmobiles);
	if(selectedmobiles!=null && selectedmobiles.length>0)
	{
		int price[]=new int[selectedmobiles.length];
		for(int i=0;i<selectedmobiles.length;i++)
		{
		price[i]=Integer.parseInt(request.getParameter(selectedmobiles[i]));
		}
		session.setAttribute("price",price);			
		}
        }catch(Exception e)
	{ 
                System.out.println(e+"Error in Session Bean");
        }

}
}//end of MobileBean Class