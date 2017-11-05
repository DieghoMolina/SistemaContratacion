<%-- 
    Document   : pdepartamento
    Created on : 21-oct-2017, 17:36:34
    Author     : palacios
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="REFRESH" content="0.01; URL=http://localhost:8080/Sistema%20Vacantes/admin/dashboard/departamento.jsp">
        <title>departamenot</title>
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
       out.print("<script>location.replace('../../login.jsp');</script>");
       }
    %>
    </body>
</html>
