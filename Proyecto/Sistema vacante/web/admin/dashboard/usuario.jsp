<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%@page import="modelo.*" %>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Vacantes</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<%@include file="../../layouts/stylesheets.jsp" %>
<script>
    function cargar(cod,us,pass,niv)
    {
        document.frm.codigo.value=cod;
        document.frm.usuario.value=us;
        document.frm.pass.value=pass;
        document.frm.nivel.value=niv;
    }
    function confirmar()
    {
        if(confirm("Desea realizar la siguiente operación?")!= null)
        {
            true;
        }
        else
        {
            false;
        }
    }
</script>
<%
    CrudUsuario cdu=new CrudUsuario();
%>
</head>
<body>
 <%
        HttpSession sesion = request.getSession();
        String usuario;
        String nivel;
        

       if(sesion.getAttribute("user")!=null && sesion.getAttribute("nivel")!=null){
           usuario=sesion.getAttribute("user").toString();
           nivel=sesion.getAttribute("nivel").toString();
           out.print("<a href='../login.jsp?cerrar=true'><h5>Cerrar Sesion "+usuario+"</h5></a>");    
       }else{
       out.print("<script>location.replace('../login.jsp');</script>");
       }
        %>
    <%
        if(request.getAttribute("valor")!=null)
        {
    %>
    <script>
        alert("<% request.getAttribute("valor"); %>");
    </script>
    <% } %>

<!--Header-part-->
<div id="header">
  <h1><a href="dashboard.html">Vacantes sisten</a></h1>
</div>
<!--close-Header-part--> 


<!--top-Header-menu-->
<%@include file="../../layouts/header/headermenu.jsp" %>
<!--close-top-Header-menu-->
<!--sidebar-menu-->
<%@include file="../../layouts/sidebar/menu.jsp" %>
<!--sidebar-menu-->

<!--main-container-part-->

<div id="content">
    
<!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a></div>
  </div>
<!--End-breadcrumbs-->
<!-- todo el codigo empieza aqui! -->

<div class="container-fluid">
  <hr>
  <div class="row-fluid" >
    <div class="span6">
      <div class="widget-box">
        <div class="widget-title"> <span class="icon"> <i class="icon-align-center"></i> </span>
          <h5>Usuario</h5>
        </div>
          
        <div class="widget-content" >
            
          <form action="../../procesarUsuario" method="get" name="frm" class="form-horizontal">
            <div class="control-group">
              <label class="control-label">Codigo:</label>
              <div class="controls">
                  <input type="text" name="codigo" class="span11" placeholder="codigo" readonly="true"/>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Usuario:</label>
              <div class="controls">
                  <input type="text" name="usuario" class="span11" placeholder="usuario" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Password:</label>
              <div class="controls">
                  <input type="password" name="pass" class="span11" placeholder="Password" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Nivel:</label>
              <div class="controls">
                  <input type="text" name="nivel" class="span11" placeholder="admin" />
              </div>
            </div>
            <div class="form-actions">
              <center>
              <button type="submit" name="bntInsertar" onclick="confirmar()" class="btn btn-success">Insertar</button>&nbsp;&nbsp;
              <button type="submit" name="bntModificar" onclick="confirmar()" class="btn btn-success">Modificar</button>&nbsp;&nbsp;
              <button type="submit" name="bntEliminar" onclick="confirmar()" class="btn btn-success">Eliminar</button>&nbsp;&nbsp;
              <button type="reset" name="bntCancelar" onclick="confirmar()" class="btn btn-success">Cancelar</button>
              </center>
            </div>
          </form>
        </div>
      </div>
      </div>
      </div>
      </div>
<div class="container-fluid">

    <hr>
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-th"></i> </span>
            <h5>Datos de Usuario</h5>
          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>Codigo</th>
                  <th>Usuario</th>
                  <th>Password</th>
                  <th>Nivel</th>
                  </tr>
              </thead>
              <tbody>
                  <%
                      List<Usuario> lu=cdu.mostrarUsuario();
                      for(Usuario us:lu)
                      {
                  %>
                <tr class="odd gradeX">
                  <td><%= us.getIdUsuario() %></td>
                  <td><%= us.getUsuario() %></td>
                  <td><%= us.getPass() %></td>
                  <td><%= us.getNivel() %></td>
                  <td><a href="javascript:cargar(<%= us.getIdUsuario()%>,'<%= us.getUsuario()%>','<%= us.getPass()%>','<%= us.getNivel()%>')">Seleccionar</a></td>
                </tr> 
                <% } %>
              </tbody>
            </table>
          </div>
        </div>
        </div>
        </div>
        </div>
        </div>

<!-- el codigo tiene que terminar aqui -->
</div>

<!--end-main-container-part-->

<!--Footer-part-->
<%@include file="../../layouts/footer/footer.jsp" %>

<!--end-Footer-part-->
<%@include file="../../layouts/javascript.jsp" %>

</body>
</html>
