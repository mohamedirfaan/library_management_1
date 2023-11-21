<%-- 
    Document   : book_details
    Created on : Sep 5, 2023, 3:39:03 PM
    Author     : mohamed irfaan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String id = request.getParameter("id");
            try{
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","Irfaan@779");
            Statement st = con.createStatement();
            ResultSet rt = st.executeQuery("select * from books where bid='"+id+"'");
            while (rt.next()) {
                String bookName = rt.getString("book_name");
                String author = rt.getString("author_name");
                String bookImage = rt.getString("image");
                String pdf = rt.getString("pdf");
        %>
                
                <div>
                    <center>
                        <img src="<%= bookImage %>" alt="not found" style="height: 100px;width: 100px">
                        <p><%= bookName %></p> <br>
                        <p><%= author %></p>
                        <iframe src="<%= pdf %>" width="100%" height="500"></iframe>
                    </center>
                </div>
        <%
            }
            }
            catch(Exception e)
            {
            out.println("exception : "+e.getMessage());
            }
            
        %>
    </body>
</html>
