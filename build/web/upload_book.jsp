<%-- 
    Document   : upload_book
    Created on : Sep 4, 2023, 11:27:18 AM
    Author     : mohamed irfaan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Upload a book</title>
        <link rel="stylesheet" href="css_files/uploader.css">
    </head>
    <body>
        <form action="upload_a_file.jsp" method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>Bookname</td> <td><input type="text" name="bookname" placeholder="Enter book name"></td>
                </tr>
                <tr>
                    <td>author</td> <td><input type="text"  name="authorname" placeholder="Enter author name"></td>
                </tr>
                <tr>
                    <td>Image</td> <td><input  name="image" type="file" accept="image/*" ></td>
                </tr>
                <tr>
                    <td>Book</td> <td><input name="book" accept="application/pdf" type="file"></td>
                </tr>
            </table>
            <input type="submit" value="upload">
        </form>
    </body>
    <!--<%/*
        try{
        Class.forName("org.postgresql.Driver");
        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","Irfaan@779");
        Statement st = con.createStatement();
        int x = st.executeUpdate("insert into books values('1','sorcerers stone','J.K.Rowlin','images/sorceres_stone.jpg','Harry_Potter_and_the_Sorcerers_Stone.pdf')");
        }
        catch(Exception e)
        {
        out.println("exception"+e.getMessage());
        }*/
    %>-->
</html>