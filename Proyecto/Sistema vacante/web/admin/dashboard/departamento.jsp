<%@page import="modelo.Depto"%>
<%@page import="java.util.List"%>
<%@page import="modelo.CrudDepto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Vacantes</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<%@include file="../../layouts/stylesheets.jsp" %>
<%
if(request.getAttribute("Valor")!=null)
{
%>
<script>
    alert('<%= request.getAttribute("Valor") %>');
</script>
<%
}
%>
<script laguage='JavaScript'>
    function llenar(id,nombre)
    {
        document.frm1.codigo.value=id;
        document.frm1.nombre.value=nombre;
    }
</script>
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
          <h5>Departamento</h5>
        </div>
          
        <div class="widget-content" >
            
          <form action="#" method="get" class="form-horizontal" name='frm1' action='procesarDepartamento'>
            <div class="control-group">
              <label class="control-label">Codigo:</label>
              <div class="controls">
                  <input type="text" name="codigo" class="span11" placeholder="codigo" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Nombre:</label>
              <div class="controls">
                  <input type="text" name="nombre" class="span11" placeholder="Nombre" />
              </div>
            </div>
            <div class="form-actions">
              <center>
              <button type="submit" class="btn btn-success" name='btnInsertar'>Insertar</button>&nbsp;&nbsp;
              <button type="submit" class="btn btn-success" name='btnModificar'>Modificar</button>&nbsp;&nbsp;
              <button type="submit" class="btn btn-success" name='btnEliminar'>Eliminar</button>&nbsp;&nbsp;
              <button type="reset" class="btn btn-success" name='limpiar'>Limpiar</button>
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
            <h5>Datos de departamento</h5>
          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>Codigo</th>
                  <th>Nombre</th>
                  <th>Seleccionar</th>
                  </tr>
              </thead>
              <tbody>
                  <%
                     CrudDepto crud = new CrudDepto();
                     List<Depto> lista=crud.mostrarDepto();
                     for(Depto ver:lista)
                     {
                    %>
                     <tr class="odd gradeX">
                    <td><%= ver.getIdDepto() %></td>
                    <td><%= ver.getNombre() %></td>
                    <td><a href="JavaScript:llenar(<%= ver.getIdDepto() %>,'<%= ver.getNombre() %>')">Seleccionar</a></td>
                    </tr> 
                    <%
                     }
                  %>
               
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
