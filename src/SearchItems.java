

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Model;
import jspBeans.Item;
import jspBeans.User;

/**
 * Servlet implementation class SearchItems
 */
@WebServlet("/searchItems")
public class SearchItems extends HttpServlet {

	public void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("searchText");
		int org_id = 0;
		if (!request.getParameter("org").equals(""))
			org_id = Integer.parseInt(request.getParameter("org"));
		System.out.println(org_id);
		ArrayList<Item> listItems = Model.getAllItems(org_id, search);
		StringBuffer sb = new StringBuffer();
		HttpSession session = request.getSession();
		String userName = null;
		User user = (User) session.getAttribute("user");
		boolean itemsAdded = false;
		
		if (user != null)
			userName = user.getName();
		
		sb.append("<items>");
		sb.append("<userName>" + userName + "</userName>");
		for (int i = 0; i < listItems.size(); i++)
		{
			sb.append("<item>");
			sb.append("<itemName>" + listItems.get(i).getItem_name() + "</itemName>");
			sb.append("<itemDesc>" + listItems.get(i).getItem_desc() + "</itemDesc>" );
			sb.append("<itemID>" + listItems.get(i).getItem_id() + "</itemID>");
			sb.append("</item>");
			itemsAdded = true;
		}
		sb.append("</items>");
		
		
		if (itemsAdded) {
            response.setContentType("text/xml");
            response.setHeader("Cache-Control", "no-cache");
            response.getWriter().write(sb.toString());
            System.out.println("items!");
        } else {
            //nothing to show
        	System.out.println("Hello");
            response.setStatus(HttpServletResponse.SC_NO_CONTENT);
        }
	}

}
