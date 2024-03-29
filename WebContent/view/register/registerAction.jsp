<%@page import="com.drivezy.common.MySQLDbConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Registration Action</title>
</head>
<body>
<%@ page import="com.drivezy.dao.*, java.sql.*, java.util.*" %>
<%
	//response.sendRedirect("../../view/login/login.jsp");
	String userName = request.getParameter("userName");
	String userEmail = request.getParameter("userEmail");
	String userPassword = request.getParameter("userPassword");
	String userMobile = "+1 " + request.getParameter("userMobile");
	String userType = request.getParameter("userType");
	
	Connection mySqlCon = null;
	int status;
	
	try
	{
		mySqlCon = MySQLDbConnection.getConnection();
		
		PreparedStatement ps = mySqlCon.prepareStatement("INSERT INTO user (name,email,password,mobile,userType) VALUES (?,?,?,?,?)");
		
		ps.setString(1,userName);  
        ps.setString(2,userEmail);  
        ps.setString(3,userPassword);  
        ps.setString(4,userMobile);  
        ps.setString(5,userType);
        
        status = ps.executeUpdate();
        
        if(status > 0)
        {
        	response.sendRedirect("../../view/login/login.jsp");
        }
        else
        {
        	response.sendRedirect("register.jsp");
        }
	}
	catch(Exception e)
	{
		System.out.println("Customer Registration - registerAction page: "+e);
		e.printStackTrace();
	}
	finally
	{
		if(mySqlCon != null)
		{
			try
			{
				mySqlCon.close();
			}
			catch(SQLException e)
			{
				e.getSuppressed();
			}
		}
	}
%>
</body>
</html>