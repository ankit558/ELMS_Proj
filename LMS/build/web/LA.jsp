<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%> 
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">        
        <link rel="stylesheet" href="Css/styles.css">       
        <title>Employees</title>
    </head>
    <body id="body-pd">
        <h1 style="color:white;">Employee Leave Availability</h1>
         <% 
            try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/elms","root",""); 
            PreparedStatement ps=con.prepareStatement("Select * from leaveavail");
            ResultSet rs=ps.executeQuery();
         %>            
        <table>
            <tr>        
                <th>S.No</th>
                <th>Emp Id</th>
                <th>Employee Name</th>
                <th>Department</th>
                <th> Sick Leaves</th>
                <th> Casual Leaves</th>
                <th> Earned Leaves</th>
            </tr>    
        <%
        while(rs.next()){
        %>
            <tr>
                <td><%= rs.getInt("S.No") %></td>
                <td><%= rs.getInt("empcode") %></td>
                <td><%= rs.getInt("empname") %></td>
                <td><%= rs.getInt("Dept") %></td>
                <td><%= rs.getInt("CL") %></td>
                <td><%= rs.getInt("SL") %></td>
                <td><%= rs.getInt("EL") %></td>
            </tr>   
<%
}
%>
        </table>
<%
 }
         catch(Exception e) {
         out.println("Error Message while insertion: " + e);
          }
%>
        <div class="l-navbar" id="navbar">
            <nav class="nav">
                <div>
                    <div class="nav__brand">
                        <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
                        <a href="#" class="nav__logo">ELMS | Admin</a>
                    </div>
                    <div class="nav__list">
                        <a href="dashboard.jsp" class="nav__link">
                            <ion-icon name="home-outline" class="nav__icon"></ion-icon>
                            <span class="nav__name">Dashboard</span>
                        </a>
                        <a href="department.html" class="nav__link">
                            <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
                            <span class="nav__name">Department</span>
                        </a>                        
                        <a href="LA.html" class="nav__link">
                            <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
                            <span class="nav__name">Leave Availability</span>
                        </a>
                        <div>
                        <a href = "leave.html" class="nav__link collapse">
                            <ion-icon name="folder-outline" class="nav__icon"></ion-icon>
                            <span class="nav__name">Leave Type</span>
                        </a>                            
                        </div>
                        <a href="ChangePassword.html" class="nav__link">
                            <ion-icon name="pie-chart-outline" class="nav__icon"></ion-icon>
                            <span class="nav__name">Change Password</span>
                        </a>
                        <div>
                        <a href="leavemanagement.jsp" class="nav__link">
                            <ion-icon name="grid-outline" class="nav__icon"></ion-icon>
                            <span class="nav__name">Leave Management</span>
                        </a>                            
                        </div>                        
                    </div>
                </div>
                <a href="lout" class="nav__link">
                    <ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
                    <span class="nav__name">Sign Out</span>
                </a>
            </nav>
        </div>

        <h2></h2>
        
        <script src="https://unpkg.com/ionicons@5.1.2/dist/ionicons.js"></script>
        
        
        <script src="JS/main.js"></script>
        
    </body>
</html>