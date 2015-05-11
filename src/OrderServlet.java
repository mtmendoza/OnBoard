

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jspBeans.User;
import Model.Model;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/order")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException
    {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String contact = request.getParameter("contact");
        int item_id = Integer.valueOf(request.getParameter("item_id"));
        int user_id = user.getUser_id();
        int item_qty = Integer.valueOf(request.getParameter("item_qty"));
        String order_id = user_id%100 + "-" + item_id + "-" + item_qty;

        Model.orderItem(order_id, user_id, item_qty, item_id, contact);
        
        response.sendRedirect("home-orders.jsp");
    }

}
