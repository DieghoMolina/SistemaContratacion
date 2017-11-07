<%-- 
    Document   : PRUEBA
    Created on : 06-nov-2017, 15:50:46
    Author     : diego
--%>
<%@page import="java.util.List"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.Cp"%>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        HttpSession sesion = request.getSession();
      String usuario;
        String nivel;
        String Usuario;
        String id;
        String idempresa;
      
        
       if(sesion.getAttribute("user")!=null && sesion.getAttribute("nivel")!=null){
          usuario=sesion.getAttribute("user").toString();
           nivel=sesion.getAttribute("nivel").toString();
            id=sesion.getAttribute("id").toString();
            idempresa=sesion.getAttribute("idempresa").toString();
         
        %>
        
           
                                             <% out.print("<a href='loginEmpresa.jsp?cerrar=true'> Cerrar Sesion "+usuario+ id + idempresa +"</a>");    %>
    
                                      
        
    <%
       }else{
       out.print("<script>location.replace('loginEmpresa.jsp');</script>");
       }
        %>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
