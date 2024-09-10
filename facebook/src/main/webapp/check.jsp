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

String email,fpass;

email=request.getParameter("t1");
fpass=request.getParameter("t2");

Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/my_data","root","");

PreparedStatement ps=con.prepareStatement("select * from facebook where femail='"+email+"' and pass='"+fpass+"'");

ResultSet rs=ps.executeQuery();

if(rs.next())
{
	HttpSession s1=request.getSession();
	s1.setAttribute("temp", email);
	out.println("<script>");
	out.println("alert('Login succesfull')");
	out.println("window.location.href='dash.jsp'");
	out.println("</script>");
	
}
else
{
	out.println("<script>");
	out.println("alert('Login fail')");
	out.println("window.location.href='login.html'");
	out.println("</script>");
}


%>
</body>
</html>