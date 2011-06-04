<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String url = request.getParameter("u");
%>
<html>
    <head>
        <title>Google +1 Bookmarklet</title>
    <script type="text/javascript" src="https://apis.google.com/js/plusone.js"></script>
    </head>

    <body>
    	<% if(url != null) { %>
	        <g:plusone size="standard" count="true" href="<%= url %>"></g:plusone>
        <% } else { %>
        	invalid url
        <% } %> 
    </body>
</html>
