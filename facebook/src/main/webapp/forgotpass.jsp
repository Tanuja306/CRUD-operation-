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

String fpass,fcpass,email;

email=request.getParameter("t1");
fpass=request.getParameter("t3");
fcpass=request.getParameter("t4");



Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/my_data","root","");


PreparedStatement ps=con.prepareStatement("select * from facebook where femail='"+email+"'");

ResultSet rs=ps.executeQuery();


if(rs.next())
{

PreparedStatement ps1=con.prepareStatement("update facebook set pass='"+fpass+"',cpass='"+fcpass+"' where femail='"+email+"'");


if(fpass.equals(fcpass))
{
	ps1.executeUpdate();
	out.println("<script>");
	out.println("alert('update successfull')");
	out.println("window.location.href='login.html'");
	
	out.println("</script>");
	
}

else
{
	out.println("<script>");
	out.println("alert('Password and confirm password is not correct')");
	out.println("window.location.href='forgotpass.html'");
	out.println("</script>");
}


}

else
{
	out.println("<script>");
	out.println("alert('email not found')");
	out.println("window.location.href='forgotpass.html'");
	out.println("</script>");
}








%>
</body>
</html>