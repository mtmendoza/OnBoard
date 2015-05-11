

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jspBeans.Order;
import jspBeans.Organization;
import Model.Model;

/**
 * Servlet implementation class UpdateOrdersServlet
 */
@WebServlet("/updateOrders")
public class UpdateOrdersServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String option = request.getParameter("option");
		String itemID = request.getParameter("item_id");
		HttpSession session = request.getSession();
		Organization org = (Organization) session.getAttribute("admin");
		ArrayList<Order> orderList = Model.getAllOrgOrders(itemID);
		if (option.equals("claim")) {
			for (int i = 0; i < orderList.size(); i++)
				if (orderList.get(i).getStatus().equals("Processing"))
					Model.setOrderStatus(orderList.get(i).getOrderID(), "Claiming");
		}
		else
			for (int i = 0; i < orderList.size(); i++)
				if (orderList.get(i).getStatus().equals("Paid"))
					Model.setOrderStatus(orderList.get(i).getOrderID(), "Processing");
		
		response.sendRedirect("admin-item-order.jsp?item=" + itemID);
	}

}
