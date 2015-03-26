/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import Model.Model;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jspBeans.User;

/**
 *
 * @author Jolo Simeon
 */
public class OrderServlet extends HttpServlet
{


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
        int item_id = Integer.valueOf(request.getParameter("item_id"));
        int user_id = user.getUser_id();
        int item_qty = Integer.valueOf(request.getParameter("item_qty"));
        String order_id = user_id%100 + "-" + item_id + "-" + item_qty;

        Model.orderItem(order_id, user_id, item_qty, item_id);
        
        response.sendRedirect("home-orders.jsp");
    }

}
