<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
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
			<h3>List Of Users</h3>
			<hr>
			<div>
				<a href="<%= request.getContextPath() %>/new"> Add New User </a>
			</div>
			<br>
			
			<table border="1">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Email</th>
						<th>Country</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<%
						@SuppressWarnings ("unchecked")
                		List<User> users = (List<User>)request.getAttribute("listUser");
						
					if(users!= null){
                		for (User user : users) {
           			 %>
	                <tr>
	                    <td><%= user.getId() %></td>
	                    <td><%= user.getName() %></td>
	                    <td><%= user.getEmail() %></td>
	                    <td><%= user.getCountry() %></td>
	                    <td>
	                        <a href="edit?id=<%= user.getId() %>">Edit</a>
	                        &nbsp;&nbsp;&nbsp;&nbsp;
	                        <a href="delete?id=<%= user.getId() %>">Delete</a>
	                    </td>
	                </tr>
		            <%
		                }
					} else {
		            %>
		            	<tr>
                            <td colspan="5">No users found</td>
                        </tr>
                    <%
						}
                    %>
                        
				</tbody>
			</table>	
		</div>
	</div>
	
</body>
</html>