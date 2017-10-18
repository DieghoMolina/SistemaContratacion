<%@page import="modelo.Candidato"%>
<%@page import="modelo.CrudCandidato"%>
<%@page import="modelo.Curriculum"%>
<%@page import="java.util.List"%>
<%@page import="modelo.CrudCurriculum"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Vacantes</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--
INTENTE HACER EL CRUD PARA ESTA VISTAPERO NO LO PUDE HACER, LA JSP LLAMADA PCURRICULUM
LA IBA A UTILIZAR PARA EL REDIRECCIONAMIENTO REVISENLA USTEDES TALVEZ HAY ALGO QUE YO NO VEO ATT: DIEGO
-->


<%@include file="../../layouts/stylesheets.jsp" %>

<script Language="JavaScript">
    function llenar(cod,curr,fecha,candi)
    {
        document.frm1.codigo.value=cod;
        document.frm1.codigo.value=curr;
        document.frm1.codigo.value=fecha;
        document.frm1.codigo.value=candi;
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
          <h5>Curriculum</h5>
        </div>
          
        <div class="widget-content" >
            
          <form action="../../procesarCurriculum" method="get" class="form-horizontal" name="frm1">
            <div class="control-group">
              <label class="control-label">Codigo:</label>
              <div class="controls">
                  <input type="text" name="codigo" class="span11" placeholder="codigo" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Currículum:</label>
              <div class="controls">
                  <input name="curri" type="text" class="span11" >
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Fecha de modificación:</label>
              <div class="controls">
                  <input name="fechamodi" type="text" class="span11" placeholder="fecha">
              </div>
            </div> 
            <div class="control-group">
              <label class="control-label">Candidato.</label>
              <div class="controls">
                  <%
                      CrudCandidato  c = new CrudCandidato();
                  List<Candidato>lst = c.mostrarCandidato() ;
                      for(Candidato v: lst)
                      {
                      %>
                   <select name="candidato">
                       <option value="<%= v.getIdCandidato()  %>"> <%= v.getNombre()  %> </option>
                  </select>
                   <% } %>
              </div>
            </div>
            <div class="form-actions">
              <center>
                  <input type="submit" class="btn btn-success" name="btnInsertar" value="insertar">&nbsp;&nbsp;
              <button type="submit" class="btn btn-success" name="btnModificar">Modificar</button>&nbsp;&nbsp;
              <button type="submit" class="btn btn-success" name="btnEliminar">Eliminar</button>&nbsp;&nbsp;
              <button type="reset" class="btn btn-success" name="btnLimpiar">Limpiar</button>
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
                  <th>ID Curriculum</th>
                  <th>Curriculum</th>
                  <th>Cargo</th>
                  <th>Fecha de modificacion</th>
                  <th>Candidato</th>
                  
                  
                </tr>
              </thead>
              <tbody>
                  <%
                      CrudCurriculum crud = new CrudCurriculum();
                      
                      List<Curriculum>lista = crud.mostrarCurriculum();
                      for(Curriculum ver:lista)
                      {
                   %>
                    <tr class="odd gradeX">
                  <td><%= ver.getIdCurriculum() %></td>
                  <td><%= ver.getCurriculum() %></td>
                  <td><%= ver.getFechaModi() %></td>
                  <td><%= ver.getIdCandidato() %></td>
                  <td><a href="JavaScript:llenar(<%= ver.getIdCurriculum() %>,'<%= ver.getCurriculum() %>','<%= ver.getFechaModi() %>','<%=ver.getIdCandidato()  %>')">Seleccionar</a></td>
                  
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
