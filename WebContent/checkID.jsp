<%@page import="Model.Model"%>

<% 
	if (Model.getUser(request.getParameter("id_num")) == null) 
	{
		out.print("true");
	} 
	else 
	{
		out.print("false");
	}
%>
