<%@page import="modelo.Empresa"%>
<%@page import="java.util.List"%>
<%@page import="modelo.CrudEmpresa"%>
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

<script laguage="javaScript">
    function llenar(id,nom,desc,logo,depto,muni,tipo,user)
    {
        document.frm1.codigo.value=id;
        document.frm1.nombre.value=nom;
        document.frm1.departamento.value=depto;
        document.frm1.logo.value=logo;
        document.frm1.descripcion.value=desc;
        document.frm1.municipio.value=muni;
        document.frm1.tempresa.value=tipo;
        document.frm1.user.value=user;
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
          <h5>Empresas</h5>
        </div>
          
        <div class="widget-content" >
            
          <form action="procesarEmpresa" method="get" class="form-horizontal" name="frm1">
            <div class="control-group">
              <label class="control-label">Codigo:</label>
              <div class="controls">
                <input type="text" class="span11" placeholder="codigo" name="codigo"/>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Nombre:</label>
              <div class="controls">
                <input type="text" class="span11" placeholder="Nombre" name="nombre"/>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Descripción</label>
              <div class="controls">
                <input type="textarea" class="span11" placeholder="descripcion" name="descripcion"/>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Logo:</label>
              <div class="controls">
                  <input type="file" class="span11" name="logo" />
            </div>
            </div>
            <div class="control-group">
              <label class="control-label">Municipio</label>
              <div class="controls">
                  <select name="municipio">
                      <option value="Municipio">Municipio</option>
                  </select>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Departamento</label>
              <div class="controls">
                  <select name="departento">
                      <option value="Departamento">Departamento</option>
                  </select>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Tipo de empresa:</label>
              <div class="controls">
                  <select name="Tempresa">
                      <option value="Tepresa">tipo</option>
                  </select>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Usuario:</label>
              <div class="controls">
                <input type="text" class="span11" placeholder="usuario" name="user"/>
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
            <h5>Datos de epresa</h5>
          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>Codigo</th>
                  <th>Nombre</th>
                  <th>Descripción</th>
                  <th>Logo</th>
                  <th>Municipio</th>
                  <th>Departamento</th>
                  <th>Tipo de empresa</th>
                  <th>Usuario</th>
                  <th>Seleccionar</th>
                </tr>
              </thead>
              <tbody>
                  <%
                      CrudEmpresa crud = new CrudEmpresa();
                      List<Empresa> lista = crud.mostrarEmpresa();
                      for(Empresa ver:lista)
                      {
                   %>
                      <tr class="odd gradeX">
                  
                  <td class="center"> <%= ver.getIdEmpresa() %></td>
                   <td class="center"> <%= ver.getNombre() %></td>
                   <td class="center"> <%= ver.getDescripcion() %></td>
                   <td class="center"> <%= ver.getLogo() %></td>
                    <td class="center"> <%= ver.getIdMunicipio() %></td>
                   <td class="center"> <%= ver.getIdDepto() %></td>
                   <td class="center"> <%= ver.getIdTipoEmpresa() %></td>
                   <td class="center"> <%= ver.getIdUsuario() %></td>
                   <td class="center"> <a href="JavaScript:llenar(<%= ver.getIdEmpresa() %>,'<%= ver.getNombre() %>','<%= ver.getDescripcion() %>','<%= ver.getLogo() %>','<%= ver.getIdMunicipio() %>','<%= ver.getIdDepto() %>','<%= ver.getIdTipoEmpresa() %>','<%= ver.getIdUsuario() %>')">Seleccionar</a></td>
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
