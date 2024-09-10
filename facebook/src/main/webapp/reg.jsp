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

String name,email,pass,cpass;

name=request.getParameter("t1");
email=request.getParameter("t2");
pass=request.getParameter("t3");
cpass=request.getParameter("t4");

Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/my_data","root","");

PreparedStatement ps=con.prepareStatement("insert into facebook (fname,femail,pass,cpass)values('"+name+"','"+email+"','"+pass+"','"+cpass+"')");

if(pass.equals(cpass))
{
	out.println("<script>");
	
	out.println("alert('Registration successfull')");
	out.println("window.location.href='login.html'");
	ps.executeUpdate();
	out.println("</script>");
    
}

else
{
     out.println("<script>");
	
	out.println("alert('password and confirm password')");
	out.println("</script>");
}
%>
</body>
</html>