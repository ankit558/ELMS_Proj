 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>  
<%String eid = session.getAttribute("EmailId").toString();%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">     
        <link rel="stylesheet" href="Css/styles.css">
        <title>Sidebar sub menus</title>
    </head>
    <body>
          <% 
            try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/elms","root",""); 
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("Select * from tblemployees where EmailId ='"+eid+"' ");
            if(rs.next())
            {
          %> 
        <form action="myprofile" method="post">
            <h2>Update Employee Info</h2>
            <label>Emp code</label>
            <input type="text"  
                   name="empcode"
                   placeholder="emp_code" value=" <%=rs.getString("EmpId")%> ">
                   <br>
            <label> Name</label>
            <input type="text" 
                   name="fname"
                   placeholder="Name" value=" <%=rs.getString("EmpName")%> ">
                   <br>                
            <label>Address</label>
            <input type="text"
                   name="address"
                   placeholder="Address"  value=" <%=rs.getString("Address")%> ">
                   <br>
            <label>City</label>
            <input type="text" 
                   name="city"
                    placeholder="city"  value=" <%=rs.getString("City")%> ">
                    <br>
            <label>Country</label>
            <input type="text"
                   name="country"
            placeholder="country"  value=" <%=rs.getString("Country")%> ">
            <br>
            <label>Email</label>
            <input type="text" 
                   name="email"
                   placeholder="Email"  value=" <%= rs.getString("EmailId") %> ">
            <br>
            <label>Password</label>
            <input type="password" 
                   name="pass"
                   placeholder="Passwrord"  value=" <%= rs.getString("Password") %> ">
            <br>           
                    <label>Department</label>
            <input type="text"
                   name="dept"
                   placeholder="Department"  value=" <%= rs.getString("Department") %> ">
                   <br>
            <label>Phone Number</label>
            <input type="text"
                   name="phone"                 
                   placeholder="Phone No."  value=" <%= rs.getString("Phonenumber") %> ">
                   <br>
            <label>DOB</label>
            <input type = "text" size ="30" class ="form-control"min="1980-01-01"max="2050-01-01"  value=" <%= rs.getString("Dob") %> ">           
            <button type="submit">UPDATE</button>
        </form>
          <%
         }
            }
                 catch(Exception e) {
                 out.println(e);
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
                        <a href="myprofile.html" class="nav__link active">
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
                            <a href="LeaveHistory.jsp"class="nav__link collapse">
                                <ion-icon name="people-outline" class="nav__icon"></ion-icon>
                                <span class="nav__name">Leaves History</span>
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
        <!-- ===== IONICONS ===== -->
        <script src="https://unpkg.com/ionicons@5.1.2/dist/ionicons.js"></script>        
        <!-- ===== MAIN JS ===== -->
        <script src="JS/main.js"></script>        
    </body>
</html>