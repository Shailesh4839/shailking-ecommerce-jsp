package my;
import java.util.*;

public class LaptopBean
{
javax.servlet.http.HttpServletRequest request;

public void addAttribute(javax.servlet.http.HttpServletRequest request)
{


	try
	{
	this.request=request;
	
	javax.servlet.http.HttpSession session = request.getSession(false);   
	
	String[] selectedlaptops=request.getParameterValues("Laptops");
           	session.setAttribute("selectedlaptops",selectedlaptops);



		if(selectedlaptops!=null && selectedlaptops.length>0)
		{

			int pricel[]=new int[selectedlaptops.length];
			
			for(int i=0;i<selectedlaptops.length;i++)
			{
			System.out.println(request.getParameter(selectedlaptops[i])+"error");
			pricel[i]=Integer.parseInt(request.getParameter(selectedlaptops[i]));
			System.out.println("price"+pricel[i]);    
   			System.out.println("Laptop name"+selectedlaptops[i]);    
			}

	          session.setAttribute("pricel",pricel);
			
		}
        }catch(Exception e)
	{ 
                System.out.println(e+"Error in Session Bean");
        }

}
}//end of LaptopBean Class