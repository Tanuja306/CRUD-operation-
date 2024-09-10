<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    HttpSession s1=request.getSession();
    String f=(String)s1.getAttribute("temp");
    
    if(f==null)
    {
    	response.sendRedirect("login.html");
    }
    else
    {
        %>
    
    
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="sidebar" id="sidebar">
  <ul>
    <li><a href="#">Home</a></li>
    <li><a href="#">About</a></li>
    <li><a href="#">Services</a></li>
    <li><a href="logout.jsp">Logout</a></li>
  </ul>
</div>

<div class="content" id="content">
  <h1>Content</h1>
</div>

</body>
</body>
</html>
<style>

* {
  box-sizing: border-box;
}

body {
  margin: 0;
  padding: 0;
  font-family: Arial, sans-serif;
  background-color: #f1f1f1;
  text-align: center;
}

.sidebar {
  height: 100%;
  width: 250px;
  min-width: 150px;
  max-width: 400px;
  position: fixed;
  top: 0;
  left: 0;
  background-color: #333;
  color: #fff;
  padding-top: 20px;
  overflow-y: auto;
  transition: width 0.3s ease;
  padding-inline: 8px;
}

.sidebar ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

.sidebar ul li {
  padding: 20px;
  border-bottom: 1px solid #555;
}

.sidebar ul li a {
  color: #fff;
  text-decoration: none;
}

.sidebar ul li a:hover {
  background-color: #555;
}

.content {
  margin-left: 250px;
  padding: 20px;
  transition: margin-left 0.3s ease;
}

@media (max-width: 768px) {
  .sidebar {
    width: 100%;
    height: auto;
    position: relative;
  }
  .content {
    margin-left: 0;
  }
}



</style>

<script>

window.onload = function () {
	  var sidebar = document.getElementById("sidebar");
	  var content = document.getElementById("content");
	  var resizing = false;

	  sidebar.addEventListener("mousemove", function (e) {
	    if (
	      e.clientX >= sidebar.offsetWidth - 10 &&
	      e.clientX <= sidebar.offsetWidth + 10
	    ) {
	      sidebar.style.cursor = "ew-resize";
	      document.body.style.userSelect = "none";
	    } else {
	      sidebar.style.cursor = "default";
	    }
	  });

	  sidebar.addEventListener("mousedown", function (e) {
	    if (
	      e.clientX >= sidebar.offsetWidth - 10 &&
	      e.clientX <= sidebar.offsetWidth + 10
	    ) {
	      resizing = true;
	      document.body.style.cursor = "ew-resize";
	    }
	  });

	  document.addEventListener("mouseup", function (e) {
	    resizing = false;
	    document.body.style.cursor = "default";
	    document.body.style.userSelect = "auto";
	  });

	  document.addEventListener("mousemove", function (e) {
	    if (resizing) {
	      // Ensure sidebar width does not go below minimum width
	      var newWidth = Math.max(150, Math.min(400, e.clientX));
	      sidebar.style.width = newWidth + "px";
	      content.style.marginLeft = newWidth + "px";
	    }
	  });
	};


</script>
    
    
    
    
    
    <% 
    }
    
  
    %>

