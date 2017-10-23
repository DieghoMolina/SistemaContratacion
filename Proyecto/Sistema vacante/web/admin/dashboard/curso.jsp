<%@page import="modelo.Curso"%>
<%@page import="java.util.List"%>
<%@page import="modelo.CrudCurso"%>
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

<script Language='JavaScript'>
  function llenar(cod,nom,y)
  {
      document.frm1.codigo.value=cod;
      document.frm1.nombre.value=nom;
      document.frm1.anio.value=y;
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
           out.print("<a href='../../login.jsp?cerrar=true'><h5>Cerrar Sesion "+usuario+"</h5></a>");    
       }else{
       out.print("<script>location.replace('../../login.jsp');</script>");
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
          <h5>Curso</h5>
        </div>
          
        <div class="widget-content" >
            
          <form  method="get" class="form-horizontal" action='procesarCurso' name='frm1'>
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
            <div class="control-group">
              <label class="control-label">Año</label>
              <div class="controls">
                  <input name="anio" type="text" class="span11" placeholder="año">
              </div>
            </div>
            <div class="form-actions">
              <center>
              <button type="submit" class="btn btn-success" name='btnInsertar'>Insertar</button>&nbsp;&nbsp;
              <button type="submit" class="btn btn-success" name='btnModificar'>Modificar</button>&nbsp;&nbsp;
              <button type="submit" class="btn btn-success" name='btnEliminar'>Eliminar</button>&nbsp;&nbsp;
              <button type="reset" class="btn btn-success" name='btnLimpiar'>Limpiar</button>
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
            <h5>Datos de curso</h5>
          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>ID Curso</th>
                  <th>Nombre</th>
                  <th>Year</th>
                  <th>Candidato</th>
                  
                   <th>Seleccionar</th>
                </tr>
              </thead>
              <tbody>
                  <%
                      CrudCurso crud = new CrudCurso();
                      List<Curso> lista = crud.mostrarCurso();
                      for(Curso ver:lista)
                      {
                    %>
                    <tr class="odd gradeX">
                    <td><%= ver.getIdCurso() %></td>
                    <td> <%= ver.getNombre() %></td>
                    <td><%= ver.getYear() %></td>
                    <td><%= ver.getIdcandidato() %></td>
                    <td><a href="JavaScript:llenar(<%= ver.getIdCurso() %>,'<%= ver.getNombre() %>','<%= ver.getYear() %>')">Seleccionar</a></td>
                </tr> 
                    <%
                      }
                   %>
                <tr class="odd gradeX">
                  <td>Trident</td>
                  <td>Internet
                    Explorer 4.0</td>
                  <td>Win 95+</td>
                </tr> 
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
