<%-- 
    Document   : do_action
    Created on : Aug 29, 2023, 8:10:33 PM
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
        String formType = (String)request.getParameter("formType");
        if(formType.equals("register")){
        // Retrieve form parameters
        String name = request.getParameter("First Name");
        String lname = request.getParameter("Last Name");
        String email = request.getParameter("Email Id");
        String password = request.getParameter("Password");
        try{
        Class.forName("org.postgresql.Driver");
        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","Irfaan@779");
        Statement st = con.createStatement();
        int x = st.executeUpdate("insert into members values('"+name+"','"+lname+"','"+email+"','"+password+"')");
        if(x==1){
        session.setAttribute("current_user",email);
    }%>
        <jsp:forward page="index.jsp"/>
        <%}
        catch(Exception e)
        {%>
        <jsp:forward page="index.jsp"/>
        <%}
        }
        else
        {
            try{
                Class.forName("org.postgresql.Driver");
                String email = (String)request.getParameter("email");
                String password = request.getParameter("login_password");
                Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","Irfaan@779");
                Statement st = con.createStatement();
                ResultSet rt = st.executeQuery("SELECT 1 FROM members WHERE email='"+email+"' AND password='"+password+"'");
                
                while (rt.next()) {
                    int value = rt.getInt(1); 
                    if(value==1){
                        session.setAttribute("current_user",email);%>
                        <script>
                            window.location.href="index.jsp"
                        </script>
                        <%break;
                    }
                }
                out.println(email+" "+password);
            }
            catch(Exception e)
            {
                out.println("login exception : "+e.getMessage());
            }%>
            <script>
                            window.location.href="index.jsp"
                        </script>
        <%}
        %>
</body>
</html>
