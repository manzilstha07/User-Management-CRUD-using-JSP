package com.example.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.model.User;

public class UserDAO {
	private static final String URL = "jdbc:postgresql://localhost:5555/mydatabase";
	private static final String USER = "postgres";
	private static final String PASSWORD = "Strong@Passw0rd";

	private static Connection getDbConnection() throws SQLException, ClassNotFoundException {
		Class.forName("org.postgresql.Driver");
		Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
		System.out.println("Connection Sucessfull!");
		return connection;
	}
	
	//INSERT
	  public void addUser(User user) {
		    try {
		      Connection connection = getDbConnection();
		      PreparedStatement statement = connection.prepareStatement("INSERT INTO users"
		          + "( name ,email, country )"
		          + "VALUES"
		          + "( ?, ?, ?);");

		      statement.setString(1, user.getName());
		      statement.setString(2, user.getEmail());
		      statement.setString(3, user.getCountry());

		      int rowsAffected = statement.executeUpdate();
		      System.out.println("Inserted " + rowsAffected + " rows successfully !!");
		      connection.close();
		    } catch (Exception e) {
		      System.out.println(e);
		    }
		  }
	  
	  
	  //READ BY ID
	  public User selectUser (int id) {
		  User user = new User();
		  try {
			  Connection connection = getDbConnection();
			  PreparedStatement statement = connection.prepareStatement("SELECT FROM users WHERE Id = ?;");
			  statement.setInt(1, id);
			  
			  ResultSet rs = statement.executeQuery();
			  while(rs.next()) {				  
				  user.setName(rs.getString("name"));
				  user.setEmail(rs.getString("email"));
				  user.setCountry(rs.getString("country"));
			  }
			  
		  }catch(Exception e) {
			  System.out.println(e);
		  }
		  return user;
	  }
	  
	  //READ ALL USER
	  public List<User> selectAllUsers(){
		  List<User> usersList= new ArrayList<>();
		  try {
			  Connection connection = getDbConnection();
			  PreparedStatement statement = connection.prepareStatement("SELECT * FROM users;");
			  
			  ResultSet rs= statement.executeQuery();
			  while(rs.next()) {
				 User user= new User();
				 user.setId(rs.getInt("id"));
				 user.setName(rs.getString("name"));
				 user.setEmail(rs.getString("email"));
				 user.setCountry(rs.getString("country"));
				 usersList.add(user); 
			  }
			  
		  }catch(Exception e) {
			  System.out.println(e);
		  }
		  return usersList;
	  }
		
	  //UPDATE USER
	  public void updateUser(User user) {
		  try {
			  Connection connection = getDbConnection();
			  PreparedStatement statement = connection.prepareStatement("UPDATE users"
			          + " SET name=?, email=?, country=?"
			          + " WHERE id=? ;");
			  
			  statement.setString(1, user.getName());
			  statement.setString(2, user.getEmail());
			  statement.setString(3, user.getCountry());
			  statement.setInt(4, user.getId());
			  
			  int rowsAffected = statement.executeUpdate();
			  System.out.println("Updated" + rowsAffected + " rows successfully !!");
		      connection.close();
			  
		  }catch(Exception e) {
			  System.out.println(e);
		  }
	  }
	  
	  //DELETE USER 
	  public void deleteUser(int id) {
		  try {
			  Connection connection = getDbConnection();
			  PreparedStatement statement = connection.prepareStatement("DELETE FROM users WHERE id=? ;");
			  statement.setInt(1, id);
			  
			  int rowsAffected = statement.executeUpdate();
			  System.out.println("Deleted " + rowsAffected + " rows successfully !!");
		      connection.close();
		  }catch(Exception e) {
			  System.out.println(e);
		  }
	  }
		
}
