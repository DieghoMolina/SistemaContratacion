<%@page import="java.util.List"%>
<%@page import="modelo.ExpLaboral"%>
<%@page import="modelo.CrudExpLaboral"%>
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
<script language='JavaScript'>
    function llenar(id,nombre,cargo,f1,f2,candi)
    {
        document.frm1.codigo.value=id;
        document.frm1.nombre.value=nombre;
        document.frm1.cargo.value=cargo;
        document.frm1.fechaini.value=f1;
        document.frm1.fechafin.value=f2;
        document.frm1.candidato.value=candi;
    }
  <!--Con Mensajitos de confirmacion-->  
    function confirmar1()
    {
        if(confirm("¿Desea Insertar los datos en su formulario?")!= null)
        {
            true;
        }
        else
        {
            false;
        }
    }
    
    function confirmar2()
    {
        if(confirm("¿Desea modificar los siguientes datos ?")!= null)
        {
            true;
        }
        else
        {
            false;
        }
    }
    
    function confirmar3()
    {
        if(confirm("¿Desea eliminar los siguientes datos ?")!= null)
        {
            true;
        }
        else
        {
            false;
        }
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
          <h5>Experiencia Laboral</h5>
        </div>
          
        <div class="widget-content" >
            
            <form action="../../procesarExpLaboral" method="get" class="form-horizontal" name="frm1">
            <div class="control-group">
              <label class="control-label">Codigo:</label>
              <div class="controls">
                  <input type="text" name="codigo" class="span11" placeholder="codigo" required />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Nombre Empresa:</label>
              <div class="controls">
                  <input type="text" name="nombre" class="span11" placeholder="Nombre" required />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Cargo:</label>
              <div class="controls">
                  <input type="text" name="cargo" class="span11" placeholder="carga" required />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Fecha de inicio:</label>
              <div class="controls">
                  <input name="fechaini" type="date" class="span11" placeholder="fecha" required >
              </div>
            </div>
              <div class="control-group">
              <label class="control-label">Fecha de finalización</label>
              <div class="controls">
                  <input name="fechafin" type="date" class="span11" placeholder="fecha" required >
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Candidato</label>
              <div class="controls">
                  <input type="number" name="candidato" class="span11" placeholder="carga" required />
              </div>
            </div>
            <div class="form-actions">
              <center>
                  <button type="submit" class="btn btn-success" name='btnInsertar' onclick="confirmar1()">Insertar</button>&nbsp;&nbsp;
                  <button type="submit" class="btn btn-success" name='btnModificar' onclick="confirmar2()">Modificar</button>&nbsp;&nbsp;
                  <button type="submit" class="btn btn-success" name='btnEliminar' onclick="confirmar3()">Eliminar</button>&nbsp;&nbsp;
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
            <h5>Datos de experiencia laboral</h5>
          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>Codigo</th>
                  <th>Nombre</th>
                  <th>Cargo</th>
                  <th>Fecha de inicio</th>
                  <th>Fecha de finalización</th>
                  <th>Candidato</th>
                   <th>Seleccionar</th>
                </tr>
              </thead>
              <tbody>
                  <%
                    CrudExpLaboral crud = new CrudExpLaboral();
                    List<ExpLaboral> lista = crud.mostrarExpLaboral();
                    for(ExpLaboral ver:lista)
                    {
                   %>
                   <tr class="odd gradeX">
                  <td><%= ver.getIdExpLaboral() %></td>
                  <td><%= ver.getNombre() %></td>
                  <td><%= ver.getCargo() %></td>
                  <td><%= ver.getFechaInicio() %></td>
                  <td><%= ver.getFechaFin() %></td>
                  <td><%= ver.getIdCandidato() %></td>
                  <td><a href="JavaScript:llenar(<%= ver.getIdExpLaboral() %>,'<%= ver.getNombre() %>','<%= ver.getCargo() %>','<%= ver.getFechaInicio() %>','<%= ver.getFechaFin() %>','<%= ver.getIdCandidato() %>')">Seleccionar</a></td>
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