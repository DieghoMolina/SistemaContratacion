<%-- 
    Document   : pcandidato
    Created on : 30/10/2017, 01:14:05 PM
    Author     : Héctor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="REFRESH" content="0.01; URL=http://localhost:8080/Sistema%20Vacantes/admin/dashboard/candidato.jsp">
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
