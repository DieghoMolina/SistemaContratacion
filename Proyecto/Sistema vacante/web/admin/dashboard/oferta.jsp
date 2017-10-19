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
    function cargar(cod,nom,des,sala,vacnt,edadr,expr,genr,tcon,empr)
    {
        document.frm.codigo.value=cod;
        document.frm.nombre.value=nom;
        document.frm.descripcion.value=des;
        document.frm.salario.value=sala;
        document.frm.vacante.value=vacnt;
        document.frm.edadr.value=edadr;
        document.frm.experienciar.value=expr;
        document.frm.generor.value=genr;
        document.frm.tipoc.value=tcon;
        document.frm.empresar.value=empr;
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
    CrudOferta cdf=new CrudOferta();
    CrudEmpresa cde=new CrudEmpresa();
%>
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
          <h5>Ofertas</h5>
        </div>
          
        <div class="widget-content" >
            
            <form action="../../procesarOferta" name="frm" method="get" class="form-horizontal">
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
              <label class="control-label">Descripción</label>
              <div class="controls">
                  <input name="descripcion" type="text" class="span11" placeholder="descripcion" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Salario:</label>
              <div class="controls">
                  <input type="text" class="span11" name="salario" placeholder="salario"/>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Vacante:</label>
              <div class="controls">
                  <input type="text" class="span11" placeholder="vacante"  name="vacante"/>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Edad requeerida:</label>
              <div class="controls">
                  <input type="text" class="span11" name="edadr" placeholder="edad" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Experiencia requerida:</label>
              <div class="controls">
                <input type="text" class="span11" name="experienciar" placeholder="años de experiencia" />
              </div>
            </div>
           <div class="control-group">
              <label class="control-label">Genero:</label>
              <div class="controls">
                  Masculino  <input type="radio" name="generor" value="Masculino" class="span1"/>   Femenino   <input type="radio" name="generor" value="Femenino" class="span1" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Tipo de contratación:</label>
              <div class="controls">
                  <input type="text" name="tipoc" class="span11" placeholder="tipo 1" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Empresa:</label>
              <div class="controls">
                  <select name="empresar">
                      <%
                          List<Empresa> lemp= cde.mostrarEmpresa();
                          for(Empresa emp:lemp){
                      %>
                      <option value="<%= emp.getIdEmpresa() %>"><%= emp.getNombre() %></option>
                      <%
                          }
                      %>
                  </select>
              </div>
            </div>
            <div class="form-actions">
              <center>
                  <button type="submit" name="btnInsertar" onclick="return alert('Exito al insertar')" class="btn btn-success">Insertar</button>&nbsp;&nbsp;
                  <button type="submit" name="btnModificar" onclick="return confirm('¿Desea modificar?')" class="btn btn-success">Modificar</button>&nbsp;&nbsp;
                  <button type="submit" name="btnEliminar"  onclick="return confirm('¿Desea eliminar?')" class="btn btn-success">Eliminar</button>&nbsp;&nbsp;
              <button type="reset" name="bntCancelar"   class="btn btn-success">Limpiar</button>
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
            <h5>Datos de oferta</h5>
          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>Codigo</th>
                  <th>Nombre</th>
                  <th>Descripción</th>
                  <th>Salario</th>
                  <th>Vacante</th>
                  <th>Edad requerida</th>
                  <th>Experiencia requerida</th>
                  <th>Genero requerido</th>
                  <th>Tipo de contratación</th>
                  <th>Empresa</th>
                  <th>Seleccionar</th>
                </tr>
              </thead>
              <tbody>
                  <%
                      List<Oferta> lof=cdf.mostrarOferta();
                      for(Oferta of:lof)
                      {
                  %>
                <tr class="odd gradeX">
                  <td><%= of.getIdoferta() %></td>
                  <td><%= of.getNombre() %></td>
                  <td><%= of.getDescripcion() %></td>
                  <td><%= of.getSalario() %></td>
                  <td><%= of.getVacante() %></td>
                  <td><%= of.getEdadRequerida() %></td>
                  <td><%= of.getExpRequerida() %></td>
                  <td><%= of.getGeneroRequerido() %></td>
                  <td><%= of.getTipoContratacion() %></td>
                  <td><%= of.getIdEmpresa() %></td>
                  <td><a href="javascript:cargar(<%= of.getIdoferta()%>,'<%= of.getNombre() %>','<%= of.getDescripcion()%>','<%= of.getSalario()%>','<%= of.getVacante()%>','<%= of.getEdadRequerida()%>','<%= of.getExpRequerida()%>','<%= of.getGeneroRequerido()%>','<%= of.getTipoContratacion()%>','<%= of.getIdEmpresa() %>')">Seleccionar</a></td>
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