

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspBeans.Order;
import Model.Model;

/**
 * Servlet implementation class ClaimItemServlet
 */
@WebServlet("/claimItem")
public class ClaimItemServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String orderID = request.getParameter("order_id");
		Order o = (Order) Model.getOrder(orderID);
		Model.setOrderStatus(orderID, "Claimed");
		response.sendRedirect("admin-item-order.jsp?item=" + o.getItem().getItem_id());
	}

}
