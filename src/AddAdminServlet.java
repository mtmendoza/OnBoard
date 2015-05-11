

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jspBeans.Organization;
import jspBeans.User;
import Model.Model;

/**
 * Servlet implementation class AddAdminServlet
 */
@WebServlet("/addAdmin")
public class AddAdminServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userID = request.getParameter("user_id");
		HttpSession session = request.getSession();
		Organization org = (Organization) session.getAttribute("admin");
		User u = (User) Model.getUser(userID);
		boolean notYetAdmin = true;
		for (int i = 0; i < u.getOrgsManaged().size(); i++)
			if (u.getOrgsManaged().get(i).getOrg_id() == org.getOrg_id())
				notYetAdmin = false;
		if (notYetAdmin)
			Model.addAdminTo(org.getOrg_id(), Integer.parseInt(userID));
		response.sendRedirect("access.jsp");
	}

}
