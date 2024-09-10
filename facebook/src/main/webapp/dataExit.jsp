<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

String name,email;
name=request.getParameter("t1");
email=request.getParameter("t2");

String pass,cpass;


pass=request.getParameter("t3");
cpass=request.getParameter("t4");




Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/my_data","root","");

PreparedStatement ps=con.prepareStatement("select * from facebook where fname='"+name+"' and femail='"+email+"'");

ResultSet rs=ps.executeQuery();

if(rs.next())
{
	out.println("<script>");
	
	out.println("alert('user already exist')");
	out.println("window.location.href='reg.html'");
	out.println("</script>");
	
}
else
{
	PreparedStatement ps2=con.prepareStatement("insert into facebook (fname,femail,pass,cpass)values('"+name+"','"+email+"','"+pass+"','"+cpass+"')");

	
	if(pass.equals(cpass))
	{    
		
	
		out.println("<script>");
		out.println("alert('Registration successfull')");
		out.println("window.location.href='login.html'");
		ps2.executeUpdate();
		out.println("</script>");
	    
	}

	else
	{
	     out.println("<script>");
		
		out.println("alert('password and confirm password')");
		out.println("window.location.href='reg.html'");
		out.println("</script>");
	}
}


%>
</body>
</html>