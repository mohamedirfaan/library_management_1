<%-- 
    Document   : upload_a_file
    Created on : Sep 5, 2023, 8:49:03 PM
    Author     : mohamed irfaan
--%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String root = getServletContext().getRealPath("images");
            MultipartRequest mr = new MultipartRequest(request,root);
            
            out.println("file upload successfully");
        %>
    </body>
</html>
