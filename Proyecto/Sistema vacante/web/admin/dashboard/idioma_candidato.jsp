<%@page import="modelo.Idioma_Candidato"%>
<%@page import="modelo.CrudIdioma_Candidato"%>
<%@page import="modelo.Idioma"%>
<%@page import="modelo.CrudIdioma"%>
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
LA IBA A UTILIZAR PARA EL REDIRECCIONAMIENTO REVISENLA USTEDES TALVEZ HAY ALGO QUE YO NO VEO ATT: DIEGOs
-->


<%@include file="../../layouts/stylesheets.jsp" %>

<script Language="JavaScript">
    function llenar(cod,candi,idi)
    {
        document.frm1.codigo.value=cod;
        document.frm1.candidato.value=candi;
        document.frm1.idioma.value=idi;
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
          <h5>idioma_candidato</h5>
        </div>
          
        <div class="widget-content" >
            
          <form action="../../procesarIdioma_Candidato" method="get" class="form-horizontal" name="frm1">
            <div class="control-group">
              <label class="control-label">Codigo:</label>
              <div class="controls">
                  <input type="text" name="codigo" class="span11" placeholder="codigo" />
              </div>
            </div>

            <div class="control-group">
              <label class="control-label">Candidato:</label>
              <div class="controls">
                   <select name="candidato">
                  <%
                      CrudCandidato  c = new CrudCandidato();
                  List<Candidato>lst = c.mostrarCandidato() ;
                      for(Candidato v: lst)
                      {
                      %>
                  
                       <option value="<%= v.getIdCandidato()  %>"> <%= v.getNombre()  %> </option>
                    <% } %>
                   </select>
                 
              </div>
            </div>
                   
                               <div class="control-group">
              <label class="control-label">Idioma:</label>
              <div class="controls">
                  <select name="idioma">
                      <%
                      CrudIdioma ci= new CrudIdioma();
                      List<Idioma>ls=ci.mostrarIdioma();
                      for(Idioma i:ls){
                      %>
                      <option value="<%= i.getIdIdioma() %>"><%= i.getNombre() %></option>
                      <%
                      }
                      %>
                  </select>
              </div>
            </div>
            <div class="form-actions">
              <center>
                  <button type="submit" class="btn btn-success" onclick="return alert('Exito al insertar')" name="btnInsertar" >Insertar</button> &nbsp;&nbsp;
                  <button type="submit" class="btn btn-success" onclick="return confirm('¿Desea Modificar?')" name="btnModificar">Modificar</button>&nbsp;&nbsp;
              <button type="submit" class="btn btn-success" onclick="return confirm('¿Desea Eliminar?')" name="btnEliminar">Eliminar</button>&nbsp;&nbsp;
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
                  <th>Id Idioma_Candidato</th>
                  <th>Candidato</th>
                  <th>Idioma</th>
                  <th>Seleccionar</th>
                  
                  
                </tr>
              </thead>
              <tbody>
                  <%
                      CrudIdioma_Candidato cic=new CrudIdioma_Candidato();
                      
                      List<Idioma_Candidato>lista = cic.mostrarIdiomaCandidato();
                      for(Idioma_Candidato ver:lista)
                      {
                   %>
                    <tr class="odd gradeX">
                  <td><%= ver.getIdIdiomaCandidato() %></td>
                  <td><%= ver.getIdCandidato() %></td>
                  <td><%= ver.getIdIdioma() %></td>
                  <td><a href="JavaScript:llenar(<%= ver.getIdIdiomaCandidato() %>,'<%= ver.getIdCandidato() %>','<%= ver.getIdIdioma() %>')">Seleccionar</a></td>
                  
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