<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%@page import="modelo.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Vacantes</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<%@include file="../../layouts/stylesheets.jsp" %>
<script>
    function cargar(cod,nom)
    {
        document.frm.codigo.value=cod;
        document.frm.nombre.value=nom;
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
</head>

<%
    CrudIdioma cdi=new CrudIdioma();
%>
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
          <h5>Idiomas</h5>
        </div>
          
        <div class="widget-content" >
            
            <form action="../../procesarIdioma" method="get" name="frm" class="form-horizontal">
            <div class="control-group">
              <label class="control-label">Codigo:</label>
              <div class="controls">
                  <input type="text" name="codigo" class="span11" placeholder="codigo" readonly="true"/>
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
              <input type="submit" name="bntInsertar"   class="btn btn-success"  value="Insertar">&nbsp;&nbsp;
              <input  type="submit" name="bntModificar"  class="btn btn-success" value="Modificar">&nbsp;&nbsp;
              <input  type="submit" name="bntEliminar" onclick="confirmar()" class="btn btn-success" value="Eliminar">&nbsp;&nbsp;
              <button  type="reset" name="bntCancelar" class="btn btn-success">Cancelar</button>
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
            <h5>Datos de idiomas</h5>
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
                      List<Idioma> lti=cdi.mostrarIdioma();
                      for(Idioma im:lti){
                  %>
                <tr class="odd gradeX">
                  <td ><%= im.getIdIdioma() %></td>
                  <td ><%= im.getNombre() %></td>
                  <td ><a href="javascript:cargar(<%= im.getIdIdioma() %>,'<%= im.getNombre() %>')">Seleccionar</a></td>
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
