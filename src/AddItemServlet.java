

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jspBeans.Item;
import jspBeans.Organization;
import jspBeans.User;
import Model.Model;

/**
 * Servlet implementation class AddItemServlet
 */
@WebServlet("/addItem")
public class AddItemServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Organization org = (Organization) session.getAttribute("admin");
        String title = request.getParameter("itemName");
        String desc = request.getParameter("desc");
        int item_qty = 0;
        
        if (request.getParameter("xsQty") != null)
        	item_qty += Integer.parseInt(request.getParameter("xsQty"));
        
        if (request.getParameter("sQty") != null)
        	item_qty += Integer.parseInt(request.getParameter("sQty"));
        
        if (request.getParameter("mQty") != null)
        	item_qty += Integer.parseInt(request.getParameter("mQty"));
        
        if (request.getParameter("lQty") != null)
        	item_qty += Integer.parseInt(request.getParameter("lQty"));
        
        if (request.getParameter("xlQty") != null)
        	item_qty += Integer.parseInt(request.getParameter("xlQty"));
        
        if (request.getParameter("xxlQty") != null)
        	item_qty += Integer.parseInt(request.getParameter("xxlQty"));
        
        if (request.getParameter("xxxlQty") != null)
        	item_qty += Integer.parseInt(request.getParameter("xxxlQty"));

        if (item_qty != 0)
        {
        	Model.addItem(new Item(0, title, item_qty, desc, "Active", org ));
        	response.sendRedirect("post-item.jsp?msg=successAdd");
        }
        else
        {
        	response.sendRedirect("post-item.jsp?msg=errorAdd");
        }
	}

}
