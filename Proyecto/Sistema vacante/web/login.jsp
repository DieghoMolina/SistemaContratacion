<%-- 
    Document   : login
    Created on : 10-08-2017, 01:56:15 PM
    Author     : Marvin Antillon, Preba github
--%>

<%@page import="modelado.Operaciones"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html lang="en">
    
<head>
        <title>Iniciar Sesion</title><meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<%@include file="layouts/login/stylesheets.jsp" %>

    </head>
    <body>
        <div id="loginbox">            
            <form id="loginform" class="form-vertical" action="login.jsp">
				 <div class="control-group normal_text"> <h3>Tecolocamos.com</h3></div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_lg"><i class="icon-user"> </i></span>
                            <input type="text" name="txtusuario" placeholder="Usuario">
                            </div>
                        </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_ly"><i class="icon-lock" ></i></span>
                            <input type="password" name="txtcontra" placeholder="Password">
        </div>
                    </div>
                </div>
                <div class="form-actions">
                    <span class="pull-left"><input type="submit" name="btnIngresar" value="Ingresar" class="btn btn-success"></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <span class="pull-right"><a href="index.jsp"><input type="button"  value="Regresar" class="btn btn-success"></a></span>
                    <span class="pull-center"><input type="submit"  value="Registrarse" class="btn btn-success"></span>
                    
              </div>
            </form>
             <%
    Operaciones op = new Operaciones();
    
              if(request.getParameter("btnIngresar")!=null){
              String nombre=request.getParameter("txtusuario");
              String contra=request.getParameter("txtcontra");
              HttpSession sesion = request.getSession();
              
              switch(op.loguear(nombre, contra)){
              case 1 :
                  sesion.setAttribute("user", nombre);
                  sesion.setAttribute("nivel", "1");
                  response.sendRedirect("admin/dashboard/candidato.jsp");
                      break;
                      
              case 2 :
                  sesion.setAttribute("user", nombre);
                  sesion.setAttribute("nivel", "2");
                  response.sendRedirect("vistausu/index.jsp");
                      break;
                      
              case 3 :
                  sesion.setAttribute("user", nombre);
                  sesion.setAttribute("nivel", "3");
                  response.sendRedirect("indexempresa.jsp");
                      break;
                      default:
                          out.write("<h3>Usuario no existe, o Contraseña invalida</h3>");
                          break;
                  
              }
              }
              
          if(request.getParameter("cerrar")!=null){
          session.invalidate();
          }
    %>
        </div>
   
    </body>
</html>
