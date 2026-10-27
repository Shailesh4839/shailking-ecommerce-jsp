package my;
import java.util.*;

public class PenBean
{
javax.servlet.http.HttpServletRequest request;

public void addAttribute(javax.servlet.http.HttpServletRequest request)
{


	try
	{
	this.request=request;
	
	javax.servlet.http.HttpSession session = request.getSession(false);   
	
	String[] selectedpens=request.getParameterValues("Pen");
           session.setAttribute("selectedpens",selectedpens);
if(selectedpens!=null && selectedpens.length>0)
		{
			int pricep[]=new int[selectedpens.length];
			
			for(int i=0;i<selectedpens.length;i++)
			{
				pricep[i]=Integer.parseInt(request.getParameter(selectedpens[i]));
				
			}
          session.setAttribute("pricep",pricep);
		}
        }catch(Exception e)
	{ 
                System.out.println(e+"Error in Session Bean");
        }

}
}//end of PenBean Class