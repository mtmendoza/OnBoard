<%@page import="Model.Model"%>

<% 
	if (Model.getUser(request.getParameter("user_id")) == null) 
	{
		out.print("false");
	} 
	else 
	{
		out.print("true");
	}
%>
