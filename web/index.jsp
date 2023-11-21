<%-- 
    Document   : index
    Created on : Aug 30, 2023, 4:06:40 PM
    Author     : mohamed irfaan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library</title>
    <link rel="stylesheet" href="css_files/style.css">
    <link rel="icon" href="head.jpg">
</head>
<%
    String name=(String)session.getAttribute("current_user");
    out.println(name);
%>
<body>
    <%
        if(name==null)
        {%>
    <div class="full">
        <div class="nav">
            <nav>
                <ul id="items">
                    <li>Home</li>
                    <li>About Us</li>
                    <li>Services</li>
                    <li>Contact</li>
                    <li><button class="login" onclick="document.getElementById('login-form').style.display='block'" style="width:auto;">Login</button></li>
                </ul>
            </nav>
        </div>
        <hr color="white" style="z-index: 99999; margin: 0;width: 96%;margin-left: 2%">
        <div id="login-form" class="login-page">
            <div class="form-box">
                <div class="button-box">
                    <div id="btn"></div>
                    <button type="button" class="toggle-btn" onclick="login()">Log In</button>
                    <button type="button" class="toggle-btn" onclick="register()">Register</button>
                </div>
                <form id="login" class="input-group-login" action="do_action.jsp" method="post">
                    <input type="hidden" name="formType" value="login">
                    <input type="email" class="input-field" placeholder="Email Id" required name="email" >
                    <input type="password" class="input-field" placeholder="Enter Password" required name="login_password">
                    <input type="checkbox" class="checkbox"><span>Remember Password</span><button type="submit" class="sub-btn">Log in</button>
                </form>
                <form id="register" class="input-group-register" action="do_action.jsp" method="post">
                    <input type="hidden" name="formType" value="register">
                    <input type="text" class="input-field" placeholder="First Name" name="First Name" required>
                    <input type="text" class="input-field" placeholder="Last Name" name="Last Name" required>
                    <input type="email" class="input-field" placeholder="Email Id" name="Email Id" required>
                    <input type="password" class="input-field" placeholder="Enter Password" name="Password" required id="p1">
                    <input type="password" class="input-field" placeholder="confirm Password" required  id="p2">
                    <div class="password_status" id="password_status">
                        <!-- comment -->
                        
                    </div>
                    <input type="checkbox" class="checkbox"><span>I argee to the terms and conditions</span><button type="submit" class="sub-btn">Register</button>
                </form>
            </div>
        </div>
    </div>
    <script>
        var x=document.getElementById('login');
        var y=document.getElementById('register');
        var z=document.getElementById('btn');
        function register(){
            x.style.left='-400px';
            y.style.left='50px';
            z.style.left='110px';
        }
        var pp=document.getElementById('p2');
        pp.addEventListener('input', function(event) {
            const typedCharacter = event.data; 
            console.log('New character typed:', typedCharacter);
            var pp1 = document.getElementById('p1').value;
            if(pp1===""){}
            else
                comparepassword();
        });
        function comparepassword()
        {
            var p1 = document.getElementById('p1').value;
            var p2 = document.getElementById('p2').value;
            console.log(p1);
            console.log(p2);
            var tag = document.getElementById('password_status');
            while(tag.firstChild)
                {
                    tag.removeChild(tag.firstChild)
                }
            if(p1===p2)
            {
                var newt = document.createElement('p');
                newt.textContent="valid";
                newt.style.color="white";
                tag.appendChild(newt);
            }
            else
            {
                var tag = document.getElementById('password_status');
                var newt = document.createElement('p');
                newt.textContent="not valid";
                newt.style.color="white";
                tag.appendChild(newt);
            }
        }
        function login(){
            x.style.left='50px';
            y.style.left='450px'
            z.style.left='0px';
        }
    </script>
    <%}
    else
    {%>
    <div class="full">
        <div class="nav">
            <nav>
                <ul id="items">
                    <li>Home</li>
                    <li>About Us</li>
                    <li>Services</li>
                    <li>Contact</li>
                    <li><a href="upload_book.jsp">Register a book</a></li>
                    <li><button class="logout" onclick="logout()">Logout</button></li>
                </ul>
            </nav>
        </div>
        <hr color="white" style="z-index: 99999; margin: 0;width: 96%;margin-left: 2%">
        <div class="books">
            <%
            try{
                Class.forName("org.postgresql.Driver");
                String email = (String)request.getParameter("email");
                String password = request.getParameter("login_password");
                Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","Irfaan@779");
                Statement st = con.createStatement();
                ResultSet resultSet = st.executeQuery("select * from books");
                while (resultSet.next()) {
                // Retrieve values from the current row
                String bid = resultSet.getString("bid");
                String bookName = resultSet.getString("book_name");
                String author = resultSet.getString("author_name");
                String bookImage = resultSet.getString("image");
                
            %>
                <a class="book" href="book_details.jsp?id=<%= bid %>">
                    <img src="<%= bookImage %>" alt="notavailable" style="height:50px;width: 50px;">
                    <p style="color: white;font-size: 15px"><%=bookName%></p>
                </a>
<%
            }
            }
            catch(Exception e)
            {
            out.println(e.getMessage());
            }       
            %>
        </div>
        
    </div>
    <script>
        function logout()
        {
            console.log("logging out");
            window.location.href="logout.jsp";
        }
    </script>  
    <%}
    %>
</body>
</html>
