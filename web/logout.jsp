<%-- 
    Document   : logout
    Created on : Aug 30, 2023, 5:00:58 PM
    Author     : mohamed irfaan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Invalidate the session
    session.invalidate();
%>
<jsp:forward page="index.jsp"/>

