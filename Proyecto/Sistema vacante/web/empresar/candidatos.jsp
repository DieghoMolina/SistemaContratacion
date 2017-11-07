<%-- 
    Document   : Ofertas
    Created on : 05-nov-2017, 12:33:40
    Author     : diego
--%>

<%@page import="modelo.CrudUsuario"%>
<%@page import="modelo.CrudNivelAcademico"%>
<%@page import="modelo.NivelAcademico"%>
<%@page import="modelo.CrudProfesion"%>
<%@page import="modelo.Profesion"%>
<%@page import="modelo.CrudMunicipio"%>
<%@page import="modelo.Municipio"%>
<%@page import="modelo.CrudDepto"%>
<%@page import="modelo.Depto"%>
<%@page import="modelo.Habilidad"%>
<%@page import="modelo.CrudHabilidad"%>
<%@page import="modelo.CrudIdioma"%>
<%@page import="modelo.Idioma"%>
<%@page import="modelo.Candidato"%>
<%@page import="modelo.CrudCandidato"%>
<%@page import="modelo.Empresa"%>
<%@page import="modelo.CrudEmpresa"%>
<%@page import="modelo.CrudOferta"%>
<%@page import="modelo.Oferta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.CrudRegistroUsuario"%>

<%@page session="true" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Ofertas/Tecolocamos.com</title>
        <meta name="keywords" content="" />
		<meta name="description" content="" />
<!--

Urbanic Template

http://www.templatemo.com/tm-395-urbanic

-->
<meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
        <meta name="viewport" content="width=device-width, initial-scale=1"> 
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--<link rel="shortcut icon" href="PUT YOUR FAVICON HERE">-->
        
        <!-- Google Web Font Embed -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
        
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.css" rel='stylesheet' type='text/css'>

        <!-- Custom styles for this template -->
        <link href="js/colorbox/colorbox.css"  rel='stylesheet' type='text/css'>
        <link href="css/templatemo_style.css"  rel='stylesheet' type='text/css'>
        <meta name="description" content="Arrow Navigation Styles: Ideas and styles for arrow navigations" />
        <meta name="keywords" content="arrow navigation, effect, web design, inspiration" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico">
        <link rel="stylesheet" type="text/css" href="css/normalize.css" />
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/component.css" />

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>
    
<%
        HttpSession sesion = request.getSession();
      String usuario;
        String nivel;
        String Usuario;
      
        
       if(sesion.getAttribute("user")!=null && sesion.getAttribute("nivel")!=null){
                 usuario=sesion.getAttribute("user").toString();
           nivel=sesion.getAttribute("nivel").toString();
         
        %>
        <div class="templatemo-top-menu">
            <div class="container">
                <!-- Static navbar -->
                <div class="navbar navbar-default" role="navigation">
                    <div class="container">
                        <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                </button>
                                <a href="#" class="navbar-brand"><img src="images/templatemo_logo.png" alt="Urbanic Template" title="Urbanic Template" /></a>
                        </div>
                         <div class="navbar-collapse collapse" id="templatemo-nav-bar">
                            <ul class="nav navbar-brand navbar-right" style="margin-top: 40px;">
                                <a href="index.jsp">Inicio</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="#">Perfil</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="registaremp/datosemp.jsp">Publicar Ofertas</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="candidatos.jsp">Ver Candidatos</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="contactenos/contactenos.jsp">Contactarnos</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="login/login.jsp">
                                          <% out.print("<a href='../login.jsp?cerrar=true'> Cerrar Sesion "+usuario+"</a>");    
       }else{
       out.print("<script>location.replace('../login.jsp');</script>");
       }
        %>
        </a>                   
                            </ul>
                         </div><!--/.nav-collapse -->
                    </div><!--/.container-fluid -->
                </div><!--/.navbar -->
            </div> <!-- /container -->
        </div>
        
          
        
       <div id="templatemo-blog">
            <div class="container">
                <div class="row">
                    <div class="templatemo-line-header" style="margin-top: 0px;" >
                        <div class="text-center">
                            <hr class="team_hr team_hr_left hr_gray"/><span class="span_blog txt_darkgrey">Candidatos</span>
                            <hr class="team_hr team_hr_right hr_gray" />
                        </div>
                    </div>
                    <br class="clearfix"/>
                </div>
                
                 <%
               CrudCandidato cdf = new CrudCandidato();
                      List<Candidato> lof=cdf.mostrarCandidato();
                      for(Candidato ca:lof)
                      {
                  %>
               
                <div class="blog_box" style="margin-left: 5px;">
                    <div class="col-sm-5 col-md-10 blog_post">
                        <ul class="list-inline">
                            <li class="col-md-4">
                                <a href="#" style="margin-top: 50px;">
                                    <center><img class="img-responsive" src="images/blog-image-1.jpg" alt="gallery 1" /></center>
                                </a>
                            </li>
                            <li  class="col-md-8">
                                <div class="pull-left">
                                    <span class="blog_header"><%= ca.getNombre()%> <%= ca.getApellido() %> </span><br/>
                                                <span>Posted by : <a class="link_orange" href="#"><span class="txt_orange">
                                        
                  
                  
                                                            
                                            </span></a></span>
                                </div>
                                
                                <div class="clearfix"> </div>
                                <p class="blog_text">
                                    Nombre del Candidato: <%= ca.getNombre()%> <br>
               Apellido del Candidato: <%= ca.getApellido() %><br>
               Correo: <%= ca.getCorreo() %><br>
                Telefono: <%= ca.getTelefono() %><br>
                Genero: <%= ca.getGenero() %><br>
               Fecha de Nacimiento:  <%= ca.getFechaNac() %><br>
               Foto : <%= ca.getFoto() %><br>
                Idioma:  <%
                    CrudIdioma crudi=new CrudIdioma();
                    List<Idioma> listaidi = crudi.mostrarNombreIdioma(ca.getIdioma());
                    for(Idioma ver:listaidi)
                    {
                        %>
                           <%= ver.getNombre() %>
                        <%
                    }
                 %> <br>
                 Habilidad: <%
                     CrudHabilidad crudha=new CrudHabilidad();
                    List<Habilidad> listahabi = crudha.mostrarNombreHabilidad(ca.getHabilidad());
                    for(Habilidad ver:listahabi)
                    {
                        %>
                           <%= ver.getNombre() %>
                        <%
                    }
                %><br>
                Años de Experiencia: <%= ca.getExpLaboral() %> años<br>
                Departamento:  <%
                    CrudDepto cdep=new CrudDepto();
                    List<Depto> listadepa = cdep.mostrarNombreDepto(ca.getIdDepto());
                    for(Depto ver:listadepa)
                    {
                        %>
                        <%= ver.getNombre() %>
                        <%
                    }
                %><br>
                Municipio: <%
                    CrudMunicipio crudMuni=new CrudMunicipio();
                    List<Municipio> listamunil = crudMuni.nombreMunicipio(ca.getIdMunicipio());
                    for(Municipio ver:listamunil)
                    {
                        %>
                        <%= ver.getNombre() %>
                        <%
                    }
                %> <br>
                Profesion:  <% 
                    CrudProfesion cpro=new CrudProfesion();
                    List<Profesion> listanPro = cpro.mostrarNombreProfesion(ca.getIdProfecion());
                    for(Profesion ver:listanPro)
                    {
                        %>
                        <%= ver.getNombre() %>
                        <%
                    }
                %><br>
                Nivel Academico: <%
                    CrudNivelAcademico cna=new CrudNivelAcademico();
                    List<NivelAcademico> lstNA =cna.mostrarNombreNivelAcad(ca.getIdNivelAcad());
                    for(NivelAcademico ver:lstNA)
                    {
                        %>
                          <%= ver.getNombre() %>
                        <%
                    }
                %> <br>
                Id Usuario: <%
                     CrudUsuario crudu= new CrudUsuario();
                     List<Usuario>listaUsu = crudu.nombreUsuario(ca.getIdUsuario());
                     for(Usuario ver:listaUsu)
                     {
                         %>
                            <%= ver.getUsuario() %>
                         <%
                     }
                 %><br><br>
                                </p>
                            </li>
                        </ul>
                    </div> <!-- /.blog_post 1 -->  
         
                     <%}  %>
                </div>
            </div>
        </div>
                
               
        


        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js"  type="text/javascript"></script>
        <script src="js/stickUp.min.js"  type="text/javascript"></script>
        <script src="js/colorbox/jquery.colorbox-min.js"  type="text/javascript"></script>
        <script src="js/templatemo_script.js"  type="text/javascript"></script>
		<!-- templatemo 395 urbanic -->
        <script>
            // For Demo purposes only
            [].slice.call( document.querySelectorAll('nav > a') ).forEach( function(el) {
                el.addEventListener( 'click', function(ev) { ev.preventDefault(); } );
            } );
        </script>
    </body>
</html>