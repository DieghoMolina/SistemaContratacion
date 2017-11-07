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
      
        
       if(sesion.getAttribute("user")!=null && sesion.getAttribute("nivel")!=null){
                 usuario=sesion.getAttribute("user").toString();
           nivel=sesion.getAttribute("nivel").toString();
         
        %>
        
           
                                             <% out.print("<a href='../login.jsp?cerrar=true'> Cerrar Sesion "+usuario+"</a>");    %>
    
                                       
                                             <% 
                          Cp cp= new Cp();
                          List<Usuario> lsd= cp.mostrarIdUsuario(usuario);
                          for(Usuario dto:lsd)
                          {
                              %>
                                 <% dto.getIdUsuario(); %>
                              <%
                          }
                      %>
        
    <%
       }else{
       out.print("<script>location.replace('../login.jsp');</script>");
       }
        %>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
