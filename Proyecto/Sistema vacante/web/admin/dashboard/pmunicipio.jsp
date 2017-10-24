<%-- 
    Document   : pmunicipio
    Created on : 17-oct-2017, 21:47:12
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="REFRESH" content="0.01; URL=http://localhost:8080/Sistema%20Vacantes/admin/dashboard/municipio.jsp">
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
       Guardando cambios!
    </body>
</html>

