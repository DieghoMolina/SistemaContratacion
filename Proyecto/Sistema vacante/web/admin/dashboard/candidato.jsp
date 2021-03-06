<%@page import="modelo.Usuario"%>
<%@page import="modelo.CrudUsuario"%>
<%@page import="modelo.Municipio"%>
<%@page import="modelo.CrudMunicipio"%>
<%@page import="modelo.Depto"%>
<%@page import="modelo.CrudDepto"%>
<%@page import="modelo.Idioma"%>
<%@page import="modelo.CrudIdioma"%>
<%@page import="modelo.Habilidad"%>
<%@page import="modelo.CrudHabilidad"%>
<%@page import="modelo.NivelAcademico"%>
<%@page import="modelo.CrudNivelAcademico"%>
<%@page import="modelo.Profesion"%>
<%@page import="modelo.CrudProfesion"%>
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
 <script Language="JavaScript">
     function llenar(id,nom,apelli,fecha,email,tel,foto,gen,habi,profe,labor,nivel,idioma,depto,muni,usu)
     {
         document.frm1.codigo.value=id;
         document.frm1.nombre.value=nom;
         document.frm1.apellido.value=apelli;
         document.frm1.fecha.value=fecha;
         document.frm1.email.value=email;
         document.frm1.tel.value=tel;
         document.frm1.foto.value=foto;
         document.frm1.genero.value=gen;
         document.frm1.habilidad.value=habi;
         document.frm1.profesion.value=profe;
         document.frm1.experiencia.value=labor;
         document.frm1.nivel.value=nivel;
         document.frm1.idioma.value=idioma;
         document.frm1.departamento.value=depto;
         document.frm1.municipio.value=muni;   
         document.frm1.user.value=usu;
         
     }
     
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
           out.print("<a href='../login.jsp?cerrar=true'><h5> Cerrar Sesion "+usuario+"</h5></a>");    
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
          <h5>Candidato</h5>
        </div>
          
        <div class="widget-content" >
            
            <form action="../../controlCandidato" method="get" class="form-horizontal" name="frm1">
            <div class="control-group">
              <label class="control-label">Codigo:</label>
              <div class="controls">
                <input type="text" class="span11" placeholder="codigo" name="codigo" readonly />
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
                <input type="text" class="span11" name="foto" />
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
                  <select name="habilidad">
                      <%
                        CrudHabilidad crudha = new CrudHabilidad();
                        List<Habilidad> listha = crudha.mostrarHabilidad();
                        for(Habilidad ver:listha)
                        {
                            %>
                            <option value="<%= ver.getIdHabilidad() %>" ><%= ver.getNombre() %></option>
                            <%
                        }
                      %>
                  </select>
              </div>
            </div>
              
               <div class="control-group">
              <label class="control-label">Profesion</label>
              <div class="controls">
                  <select name="profesion">
                      <%
                        CrudProfesion cpro = new CrudProfesion();
                        List<Profesion> listpro = cpro.mostrarProfesion();
                        for(Profesion ver:listpro)
                        {
                            %>
                            <option value="<%= ver.getIdProfesion() %>" ><%= ver.getNombre() %></option>
                            <%
                        }
                      %>
                  </select>
              </div>
            </div>
              
            <div class="control-group">
              <label class="control-label">Experiencia Laboral</label>
              <div class="controls">
                  <input name="experiencia" type="number" min="1" max="25">
              </div>
            </div>
              <div class="control-group">
              <label class="control-label">Nivel academico:</label>
              <div class="controls">
                  <select name="nivel">
                      <%
                        CrudNivelAcademico cna = new CrudNivelAcademico();
                        List<NivelAcademico> listNA = cna.mostrarNivelAcad();
                        for(NivelAcademico ver:listNA)
                        {
                          %>
                          <option value="<%= ver.getIdNivelAca() %>"><%= ver.getNombre() %></option>
                          <%
                        }
                      %>
                  </select>
              </div>
            </div>
              
              
             
            <div class="control-group">
              <label class="control-label">Idioma:</label>
              <div class="controls">
                  <select name="idioma">
                      <%
                         CrudIdioma crudi = new CrudIdioma();
                         List<Idioma> listaI = crudi.mostrarIdioma();
                         for(Idioma ver:listaI)
                         {
                             %>
                             <option value="<%= ver.getIdIdioma() %>"><%= ver.getNombre() %></option>
                             <%
                         }
                         
                      %>
                  </select>
              </div>
            </div>
              
              <div class="control-group">
              <label class="control-label">Departamento</label>
              <div class="controls">
                  <select name="departamento">
                      <%
                        CrudDepto cdep = new CrudDepto();
                        List<Depto> listaD = cdep.mostrarDepto();
                        for(Depto ver:listaD)
                        {
                            %>
                            <option value="<%= ver.getIdDepto() %>"><%= ver.getNombre() %></option>
                            <%
                        }
                      %>
                  </select>
              </div>
            </div>
              
              
            <div class="control-group">
              <label class="control-label">Municipio</label>
              <div class="controls">
                  
                  <select name="municipio">
                      <%
                          CrudMunicipio crudMuni = new CrudMunicipio();
                          List<Municipio> listMu = crudMuni.mostrarMunicipio();
                          for(Municipio ver:listMu)
                          {
                              %>
                              <option value="<%= ver.getIdMunicipio() %>"><%= ver.getNombre() %></option>
                              <%
                          }
                      %>
                  </select>
              </div>
            </div>
                  
             <div class="control-group">
              <label class="control-label">USUARIO:</label>
              <div class="controls">
                <input type="text" class="span11" placeholder="Usuario" name="user" />
              </div>
            </div>
            
            <div class="form-actions">
              <center>
               <!--
               <button type="submit" class="btn btn-success" name="btnInsertar" onclick="confirmar1()">Insertar</button>&nbsp;&nbsp;
               -->
              <button type="submit" class="btn btn-success" name="btnModificar" onclick="confirmar2()" >Modificar</button>&nbsp;&nbsp;
              <button type="submit" class="btn btn-success" name="btnEliminar" onclick="confirmar3()" >Eliminar</button>&nbsp;&nbsp;
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
              <th colspan="17">Datos Candidato</th>
              </thead>
              <tbody>
                  <tr>
                  
                  <th>Codigo Candidato</th>
                  <th>Nombre</th>
                  <th>Apellido</th>
                  <th>Fecha Nacimiento</th>
                  <th>email</th>
                  <th>Telefono</th>
                  <th>Foto</th>
                  <th>Genero</th>
                  <th>Habilidad</th>
                  <th>Profesion</th>
                  <th>Experiencia Laboral</th>
                  <th>Nivel Academico</th>
                  <th>Idioma</th>
                  <th>Departamento</th>
                  <th>Municipio</th>                  
                  <th>Usuario</th>
                  <th>Seleccionar</th>
                </tr>
                  <%
                  List<Candidato> ls = crud.mostrarCandidato();
                  for(Candidato cn : ls){
                     
                  
                  %>
                <tr class="odd gradeX">
                    <td><b><%= cn.getIdCandidato() %></b> </td>
            <td ><center><b><%= cn.getNombre() %> </b></center></td>
            <td ><center><b><%= cn.getApellido() %></b> </center></td>
            <td ><center><b><%= cn.getFechaNac() %></b> </center></td>
            <td ><center><b><%= cn.getCorreo() %></b> </center></td>
            <td ><center><b><%= cn.getTelefono() %></b> </center></td>
            <td ><center><b><%= cn.getFoto() %></b> </center></td>
            <td ><center><b><%= cn.getGenero() %></b> </center></td> 
            
            <td ><center>
                <%
                    List<Habilidad> listahabi = crudha.mostrarNombreHabilidad(cn.getHabilidad());
                    for(Habilidad ver:listahabi)
                    {
                        %>
                           <b><%= ver.getNombre() %></b>
                        <%
                    }
                %>
            </center></td>
            
            <td ><center>
                <% 
                    List<Profesion> listanPro = cpro.mostrarNombreProfesion(cn.getIdProfecion());
                    for(Profesion ver:listanPro)
                    {
                        %>
                        <b><%= ver.getNombre() %></b>
                        <%
                    }
                %>
            </center></td>
            
            
            
            <td ><center><%= cn.getExpLaboral() %> </center></td>
            
            <td ><center>
                <%
                    List<NivelAcademico> lstNA =cna.mostrarNombreNivelAcad(cn.getIdNivelAcad());
                    for(NivelAcademico ver:lstNA)
                    {
                        %>
                          <b><%= ver.getNombre() %></b>
                        <%
                    }
                %> 
            </center></td>
            
            <td ><center>
                <%
                    List<Idioma> listaidi = crudi.mostrarNombreIdioma(cn.getIdioma());
                    for(Idioma ver:listaidi)
                    {
                        %>
                           <b><%= ver.getNombre() %></b>
                        <%
                    }
                 %> 
            </center></td>
            
            <td ><center>
                <%
                    List<Depto> listadepa = cdep.mostrarNombreDepto(cn.getIdDepto());
                    for(Depto ver:listadepa)
                    {
                        %>
                        <b><%= ver.getNombre() %></b>
                        <%
                    }
                %>
            </center></td>
            <td ><center>
                <%
                    List<Municipio> listamunil = crudMuni.nombreMunicipio(cn.getIdMunicipio());
                    for(Municipio ver:listamunil)
                    {
                        %>
                        <b><%= ver.getNombre() %></b>
                        <%
                    }
                %> 
            </center></td>
            
            
             <td ><center>
                 <%
                     CrudUsuario crudu= new CrudUsuario();
                     List<Usuario>listaUsu = crudu.nombreUsuario(cn.getIdUsuario());
                     for(Usuario ver:listaUsu)
                     {
                         %>
                            <b><%= ver.getUsuario() %></b>
                         <%
                     }
                 %>
             </center></td>
            <td ><center><a href="JavaScript:llenar(<%= cn.getIdCandidato() %>,'<%= cn.getNombre() %>','<%= cn.getApellido() %>','<%= cn.getFechaNac() %>','<%= cn.getCorreo() %>','<%= cn.getTelefono() %>','<%= cn.getFoto() %>','<%= cn.getGenero() %>','<%= cn.getHabilidad() %>','<%= cn.getIdProfecion() %>','<%= cn.getExpLaboral() %>','<%= cn.getIdNivelAcad() %>','<%= cn.getIdioma() %>','<%= cn.getIdDepto() %>','<%= cn.getIdMunicipio() %>','<%= cn.getIdUsuario() %>')">Seleccionar</a></center></td>
            
            
                  
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