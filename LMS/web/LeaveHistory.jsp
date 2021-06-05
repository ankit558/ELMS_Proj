<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>    
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="Css/styles.css">
        <title>Sidebar sub menus</title>
    </head>
    <body id="body-pd">
        <h1 style="color:white;">Leave History</h1>       
	 <% 
            try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/elms","root",""); 
            PreparedStatement ps=con.prepareStatement("Select * from leavehistory");
            ResultSet rs=ps.executeQuery();
            %>            
        <table>
            <tr>       
                <th>S.No</th>
                <th>Emp Code</th> 
                <th>EmployeeName</th>
                <th>Leave Type</th>                
                <th> Posting Date</th>               
                <th> From Date</th> 
                <th>To Date</th>
                 <th> Status</th> 
            </tr>
            <%
            while(rs.next()){
            %>
            <tr>        
                <td><%= rs.getInt("S.No") %> </td>
                <td><%= rs.getString("empcode") %></td>
                <td><%= rs.getString("empname") %></td>
                <td><%= rs.getString("Leavetype") %></td>
                <td><%= rs.getDate("postdate") %></td>
                <td><%= rs.getDate("fromdate") %></td>                
                <td><%= rs.getString("todate") %></td>
                <td><%= rs.getString("status") %></td>               
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
                        <a href="#" class="nav__logo">ELMS | Employee</a>
                    </div>
                    <div class="nav__list">
                        <a href="MyProfile.jsp" class="nav__link">
                            <ion-icon name="home-outline" class="nav__icon"></ion-icon>
                            <span class="nav__name">Profile</span>
                        </a>
                        <a href="applyleave.html" class="nav__link">
                            <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
                            <span class="nav__name">Apply Leave</span>
                        </a>
                        <a href="EchangePassword.html" class="nav__link">
                            <ion-icon name="pie-chart-outline" class="nav__icon"></ion-icon>
                            <span class="nav__name">Change Password</span>
                        </a>
                        <div>
                            <a href="#" class="nav__link active">
                                <ion-icon name="people-outline" class="nav__icon"></ion-icon>
                                <span class="nav__name">Leaves History</span>
                            </a>                                
                        </div>                        
                    </div>
                </div>
                <a href="Lout" class="nav__link">
                    <ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
                    <span class="nav__name">Sign Out</span>
                </a>
            </nav>
        </div>        
        <script src="https://unpkg.com/ionicons@5.1.2/dist/ionicons.js"></script>       
        <script src="JS/main.js"></script>       
    </body>
</html>