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
<!--   
VISTA FUNCIONAL! INSERTA MODIFICA Y ELIMINA, SI TOCAN ALGO QUE SE ESTETICO NO LO VAYAN 
A CHINGAR :V ATT: DIEGO
-->
<%@include file="../../layouts/stylesheets.jsp" %>
<script Language="JavaScript">
    function cargar(cod,nom,depa)
    {
        document.frm.codigo.value=cod;
        document.frm.nombre.value=nom;
        document.frm.departamento.value=depa;
    }
</script>
</head>
<%
    CrudMunicipio cdm= new CrudMunicipio();
    CrudDepto cdd= new CrudDepto();
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
          <h5>Municipios</h5>
        </div>
          
        <div class="widget-content" >
            
            <form action="../../procesarMunicipio" name="frm" method="get" class="form-horizontal">
            <div class="control-group">
              <label class="control-label">Codigo:</label>
              <div class="controls">
                  <input type="text" name="codigo" class="span11" placeholder="codigo" readonly="true"/>
              </div>
            </div>
              <div class="control-group">
              <label class="control-label">Nombre:</label>
              <div class="controls">
                  <input type="text" name="nombre" class="span11" placeholder="nombre" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Departamento</label>
              <div class="controls">
                  <select name="departamento">
                  <%
                      List<Depto> ltd=cdd.mostrarDepto();
                      for(Depto dto:ltd)
                      {
                  %>
                   
                  <option value="<%= dto.getIdDepto() %>"><%= dto.getNombre() %></option>
                   <% } %>
                  </select>
              </div>
            </div>
            <div class="form-actions">
              <center>
                  <input type="submit" name="bntInsertar"  class="btn btn-success" value="Insertar">&nbsp;&nbsp;
                  <input type="submit" name="bntModificar"  class="btn btn-success" value="Modificar">&nbsp;&nbsp;
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
            <h5>Datos de municipio</h5>
          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>Codigo</th>
                  <th>Municipio</th>
                  <th>Departamento</th>
                  </tr>
              </thead>
              <tbody>
                  <%
                      List<Municipio> ltm=cdm.mostrarMunicipio();
                      for(Municipio mn: ltm){
                  %>
                <tr class="odd gradeX">
                  <td><%= mn.getIdMunicipio() %></td>
                  <td><%= mn.getNombre() %></td>
                    <%
                        
                     %>
                    <td>
                        <% 
                            int ss = mn.getIdDepto();
                        List<Depto> lsd=cdd.mostrarNombreDepto(ss);
                        for(Depto dto:lsd)
                        {
                        %>
                        <b><%= dto.getNombre() %></b>
                        <%
                        } 
                        %>
                    </td>
                  <td><a   href="javascript:cargar(<%=  mn.getIdMunicipio()  %>, '<%=  mn.getNombre()  %>', '<%=  mn.getIdDepto()  %>') ">Seleccionar</a></td>
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
