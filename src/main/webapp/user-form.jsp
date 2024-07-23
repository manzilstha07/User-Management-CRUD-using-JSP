<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.example.model.User" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Management Application</title>
</head>
<body>
	<header>
		<nav>
			<div>
			<a href="#"> User Management Application </a>
			</div>
			
			<ul>
				<li><a href="<%= request.getContextPath() %>/list"> Users List </a>
				</li>
			</ul>
		</nav>
	</header>
	<br>
	
	<div>
		<div>
			<div>
				<%
			        User user = (User) request.getAttribute("user");
			    %>
			    
			    <%
			        if (user != null) {
			    %>
			        <form action="update" method="post">
			    <%
			        } else {
			    %>
			        <form action="insert" method="post">
			    <%
			        }
			    %>
			    
			    <caption>
			        <h2>
			            <%
			                if (user != null) {
			            %>
			                Edit User
			            <%
			                } else {
			            %>
			                Add New User
			            <%
			                }
			            %>
			        </h2>
			    </caption>
			    
			    <form action="<%= (user != null) ? "update" : "insert" %>" method="post">
			        <%
			            if (user != null) {
			        %>
			            <input type="hidden" name="id" value="<%= user.getId() %>" />
			        <%
			            }
			        %>
			        
			        <fieldset class="form-group">
			            <label>Username</label>
			            <input type="text" name="name" required="required" class="form-control" value="<%= (user != null) ? user.getName() : "" %>" />
			        </fieldset>
			        
			        <fieldset class="form-group">
			            <label>Email</label>
			            <input type="text" name="email" class="form-control" value="<%= (user != null) ? user.getEmail() : "" %>" />
			        </fieldset>
			        
			        <fieldset class="form-group">
			            <label>Country</label>
			            <input type="text" name="country" class="form-control" value="<%= (user != null) ? user.getCountry() : "" %>" />
			        </fieldset>
			        
			        <button type="submit">Save</button>
			    </form>
			</div>
		</div>
	</div>
	
</body>
</html>