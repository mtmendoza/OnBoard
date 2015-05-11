

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jspBeans.Organization;
import jspBeans.User;
import Model.Model;

/**
 * Servlet implementation class SwitchToOrgServlet
 */
@WebServlet(name = "switchToOrg", description = "switches to org", urlPatterns = { "/switchToOrg" })
public class SwitchToOrgServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String org_id = request.getParameter("org_id");
        String pwd = request.getParameter("pw");
        Organization org = Model.getOrg(org_id, pwd);
       
        if (org != null)
        {
            HttpSession session = request.getSession();
            session.setAttribute("admin", org);
            response.sendRedirect("admin.jsp");
        }
        
        else
        {
        	response.sendRedirect("index.jsp?error=orgPwd");
        	/*
            RequestDispatcher rd
                    = getServletContext().getRequestDispatcher("/login.jsp");
            PrintWriter out = response.getWriter();
            //out.println("<font color = red>Either username or password is wrong.</font>");
            rd.include(request, response);
            
            rd.forward(request, response);*/
        }
	}

}
