<%@page import="Model.Model"%>
<%@page import="jspBeans.Item" %>

<% 

	Item i = Model.getItem(Integer.parseInt(request.getParameter("item_id")));
	if (Integer.parseInt(request.getParameter("item_qty")) > i.getItem_qty()) 
	{
		out.print("false");
	} 
	else 
	{
		out.print("true");
	}
%>
