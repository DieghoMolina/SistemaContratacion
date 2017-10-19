<%@page import="modelo.ExpLaboral"%>
<%@page import="modelo.CrudExpLaboral"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Candidato"%>
<%@page import="modelo.CrudCandidato"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Vacantes</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<%@include file="../../layouts/stylesheets.jsp" %>
<% CrudCandidato crud= new CrudCandidato(); 
Candidato can = new Candidato();
%>

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
 <script Languge="JavaScript">
     function llenar(id,nom,apelli,email,tel,gen,fecha,foto,idioma,habi,labor,depto,muni,profe,nivel)
     {
         document.frm1.codigo.value=id;
         document.frm1.nombre.value=nom;
         document.frm1.apellido.value=apelli;
         document.frm1.email.value=email;
         document.frm1.tel.value=tel;
         document.frm1.fecha.value=fecha;
         document.frm1.foto.value=foto;
         document.frm1.genero.value=gen;
         document.frm1.habilidad.value=habi;
         document.frm1.experiencia.value=labor;
         document.frm1.nivel.value=nivel;
         document.frm1.idioma.value=idioma;
         document.frm1.departamento.value=depto;
         document.frm1.municipio.value=muni;
         document.frm1.profesion.value=profe;
         
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
          <h5>Candidato</h5>
        </div>
          
        <div class="widget-content" >
            
            <form action="procesarCandidato" method="get" class="form-horizontal" name="frm1">
            <div class="control-group">
              <label class="control-label">Codigo:</label>
              <div class="controls">
                <input type="text" class="span11" placeholder="codigo" name="codigo" />
              </div>
            </div>
              
             
              
            <div class="control-group">
              <label class="control-label">Nombre:</label>
              <div class="controls">
                <input type="text" class="span11" placeholder="Nombre" name="nombre" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Apellido:</label>
              <div class="controls">
                <input type="text" class="span11" placeholder="Apellido" name="apellido" />
              </div>
            </div>
              
              <div class="control-group">
              <label class="control-label">Fecha Nacimiento:</label>
              <div class="controls">
                <input type="Date" class="span11"  name="fecha" />
              </div>
            </div>
              
            <div class="control-group">
              <label class="control-label" >Correo electronico:</label>
              <div class="controls">
                <input type="email"  class="span11" placeholder="Corre@gmail.com" name="email"  />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Numero de telefono:</label>
              <div class="controls">
                <input type="text" class="span11" placeholder="+5037158-9669" name="tel" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Foto:</label>
              <div class="controls">
                <input type="file" class="span11" name="foto" />
            </div>
            <div class="control-group">
              <label class="control-label">Genero:</label>
              <div class="controls">
                  Masculino  <input type="radio" name="genero" value="Masculino" class="span1"/>   Femenino   <input type="radio" name="genero" value="Femenino" class="span1" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Habilidad</label>
              <div class="controls">
                  <input type="text" class="span11" placeholder="Habilidad" name="habilidad" />
              </div>
            </div>
              
               <div class="control-group">
              <label class="control-label">Profesion</label>
              <div class="controls">
                  <select name="profesion">
                      <option value="doctor">Experiencia</option>
                  </select>
              </div>
            </div>
              
            <div class="control-group">
              <label class="control-label">Experiencia Laboral</label>
              <div class="controls">
                  <select name="experiencia">
                      <%
                         CrudExpLaboral cel = new CrudExpLaboral();
                         List<ExpLaboral> lsel = cel.mostrarExpLaboral();
                         for(ExpLaboral ver:lsel)
                         {
                             %>
                             <option value="<%= ver.getIdExpLaboral() %>"><%= ver.getCargo() %></option>
                             <%
                         }
                      %>
                  </select>
              </div>
            </div>
              <div class="control-group">
              <label class="control-label">Nivel academico:</label>
              <div class="controls">
                  <select name="nivel">
                      <option value="nivel">nivel</option>
                  </select>
              </div>
            </div>
              
              
             
            <div class="control-group">
              <label class="control-label">Idioma:</label>
              <div class="controls">
                  <select name="idioma">
                      <option value="idioma">Idioma</option>
                  </select>
              </div>
            </div>
              
              <div class="control-group">
              <label class="control-label">Departamento</label>
              <div class="controls">
                  <select name="departamento">
                      <option value="depa">Departamento</option>
                  </select>
              </div>
            </div>
              
              
            <div class="control-group">
              <label class="control-label">Municipio</label>
              <div class="controls">
                  
                  <select name="municipio">
                      <option value="municioi">Municipio</option>
                  </select>
              </div>
            </div>
            
            <div class="form-actions">
              <center>
              <button type="submit" class="btn btn-success" name="btnInsertar">Insertar</button>&nbsp;&nbsp;
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
            <h5>Datos de candidato</h5>
          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>Codigo Candidato</th>
                  <th>Nombre</th>
                  <th>Apellido</th>
                  <th>email</th>
                  <th>Telefono</th>
                  <th>Genero</th>
                  <th>Fecha Nacimiento</th>
                  <th>Foto</th>
                  <th>Idioma</th>
                  <th>Habilidad</th>
                  <th>Experiencia Laboral</th>
                  <th>Departamento</th>
                  <th>Id Municipio</th>
                  <th>Id Profesion</th>
                  <th>Id Nivel Academico</th>
                  <th>Seleccionar</th>
                </tr>
              </thead>
              <tbody>
                  <%
                  List<Candidato> ls = crud.mostrarCandidato();
                  for(Candidato cn : ls){
                     
                  
                  %>
                <tr class="odd gradeX">
            <td><%= cn.getIdCandidato() %> </td>
            <td ><center><%= cn.getNombre() %> </center></td>
            <td ><center><%= cn.getApellido() %> </center></td>
            <td ><center><%= cn.getCorreo() %> </center></td>
            <td ><center><%= cn.getTelefono() %> </center></td>
            <td ><center><%= cn.getGenero() %> </center></td>
            <td ><center><%= cn.getFechaNac() %> </center></td>
            <td ><center><%= cn.getFoto() %> </center></td>
            <td ><center><%= cn.getIdioma() %> </center></td>
            <td ><center><%= cn.getHabilidad() %> </center></td>
            <td ><center><%= cn.getExpLaboral() %> </center></td>
            <td ><center><%= cn.getIdDepto() %> </center></td>
            <td ><center><%= cn.getIdMunicipio() %> </center></td>
            <td ><center><%= cn.getIdProfecion() %> </center></td>
            <td ><center><%= cn.getIdNivelAcad() %> </center></td>
            <td ><center><a href="JavaScript:llenar(<%= cn.getIdCandidato() %>,'<%= cn.getNombre() %>','<%= cn.getApellido() %>','<%= cn.getCorreo() %>','<%= cn.getGenero() %>','<%= cn.getFechaNac() %>','<%= cn.getFoto() %>','<%= cn.getIdioma() %>','<%= cn.getExpLaboral() %>','<%= cn.getIdDepto() %>','<%= cn.getIdMunicipio() %>','<%= cn.getIdProfecion() %>','<%= cn.getIdNivelAcad() %>')">Seleccionar</a></center></td>
            
            
                  
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
