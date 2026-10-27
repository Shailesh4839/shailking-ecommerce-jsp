package my;
import java.util.*;

public class CalBean
{
javax.servlet.http.HttpServletRequest request;

public void addAttribute(javax.servlet.http.HttpServletRequest request)
{


	try
	{
	this.request=request;
	
	javax.servlet.http.HttpSession session = request.getSession(false);   
	
String[] selectedcalci=request.getParameterValues("Calci");
           session.setAttribute("selectedcalci",selectedcalci);
if(selectedcalci!=null && selectedcalci.length>0)
		{
			int pricecl[]=new int[selectedcalci.length];
			
			for(int i=0;i<selectedcalci.length;i++)
			{
				pricecl[i]=Integer.parseInt(request.getParameter(selectedcalci[i]));
				
			}
          session.setAttribute("pricecl",pricecl);
		}
        }catch(Exception e)
	{ 
                System.out.println(e+"Error in Session Bean");
        }

}
}//end of CalBean Class