<%-- 
    Document   : pempresa
    Created on : 23/10/2017, 12:37:07 PM
    Author     : Hector
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="REFRESH" content="0.01; URL=http://localhost:8080/Sistema%20Vacantes/admin/dashboard/empresa.jsp">
        <title>JSP Page</title>
    </head>
    <body>
         <%
        HttpSession sesion = request.getSession();
        String usuario;
        String nivel;
        

       if(sesion.getAttribute("user")!=null && sesion.getAttribute("nivel")!=null){
           usuario=sesion.getAttribute("user").toString();
           nivel=sesion.getAttribute("nivel").toString();
       
       }else{
       out.print("<script>location.replace('../login.jsp');</script>");
       }
    %>
       Guardando los cambios!
    </body>


