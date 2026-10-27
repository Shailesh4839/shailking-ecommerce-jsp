package my;
import java.util.*;

public class WatchBean
{
javax.servlet.http.HttpServletRequest request;

public void addAttribute(javax.servlet.http.HttpServletRequest request)
{


	try
	{
	this.request=request;
	
	javax.servlet.http.HttpSession session = request.getSession(false);   
	
	String[] selectedwatches=request.getParameterValues("Watches");
           session.setAttribute("selectedwatches",selectedwatches);
if(selectedwatches!=null && selectedwatches.length>0)
		{
			int pricew[]=new int[selectedwatches.length];
			
			for(int i=0;i<selectedwatches.length;i++)
			{
				pricew[i]=Integer.parseInt(request.getParameter(selectedwatches[i]));
				
			}
          session.setAttribute("pricew",pricew);

		}
        }catch(Exception e)
	{ 
                System.out.println(e+"Error in Session Bean");
        }

}
}//end of WatchBean Class