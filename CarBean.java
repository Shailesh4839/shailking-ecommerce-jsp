package my;
import java.util.*;

public class CarBean
{
javax.servlet.http.HttpServletRequest request;

public void addAttribute(javax.servlet.http.HttpServletRequest request)
{


	try
	{
	this.request=request;
	
	javax.servlet.http.HttpSession session = request.getSession(false);   
	
	String[] selectedcars=request.getParameterValues("Cars");
	session.setAttribute("selectedcars",selectedcars);

	if(selectedcars!=null && selectedcars.length>0)
		{
			int pricec[]=new int[selectedcars.length];
			
			for(int i=0;i<selectedcars.length;i++)
			{
				pricec[i]=Integer.parseInt(request.getParameter(selectedcars[i]));
				
			}
        	  session.setAttribute("pricec",pricec);
	
		}
        }catch(Exception e)
	{ 
                System.out.println(e+"Error in Session Bean");
        }

}
}//end of CarBean Class