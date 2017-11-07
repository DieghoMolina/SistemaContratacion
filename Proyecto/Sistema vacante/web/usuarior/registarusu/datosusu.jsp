<%@page import="java.util.List"%>
<%@page import="modelo.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Datos Candidato/Tecolocamos.com</title>
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
        <link href="../css/bootstrap.css" rel='stylesheet' type='text/css'>

        <!-- Custom styles for this template -->
        <link href="../js/colorbox/colorbox.css"  rel='stylesheet' type='text/css'>
        <link href="../css/templatemo_style.css"  rel='stylesheet' type='text/css'>
        <meta name="description" content="Arrow Navigation Styles: Ideas and styles for arrow navigations" />
        <meta name="keywords" content="arrow navigation, effect, web design, inspiration" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../../favicon.ico">
        <link rel="stylesheet" type="text/css" href="../css/normalize.css" />
        <link rel="stylesheet" type="text/css" href="../css/demo.css" />
        <link rel="stylesheet" type="text/css" href="../css/component.css" />

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
         <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/main.css">
    
        
        <link rel="stylesheet" href="css/style.css">
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
        String id;
        String idempresa;
      
        
       if(sesion.getAttribute("user")!=null && sesion.getAttribute("nivel")!=null){
          usuario=sesion.getAttribute("user").toString();
           nivel=sesion.getAttribute("nivel").toString();
            id=sesion.getAttribute("id").toString();
           // idempresa=sesion.getAttribute("idempresa").toString();
         
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
                                <a href="#" class="navbar-brand"><img src="../images/templatemo_logo.png" alt="Urbanic Template" title="Urbanic Template" /></a>
                        </div>
                        <div class="navbar-collapse collapse" id="templatemo-nav-bar">
                            <ul class="nav navbar-brand navbar-right" style="margin-top: 40px;">
                                <a href="../index.jsp">Inicio</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="">Perfil</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="../Ofertas.jsp">Ver ofertas</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="../contactenos/contactenos.jsp">Contactarnos</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="login/login.jsp">
                                        <% out.print("<a href='../../index.jsp?cerrar=true'> Cerrar Sesion "+usuario+ id  +"</a>");   
                                          //+idempresa+
                                          %>
      <%
       }else{
       out.print("<script>location.replace('../loginEmpresa.jsp');</script>");
       }
        %>
        </a>                   
                            </ul>
                                           </div><!--/.nav-collapse -->
                    </div><!--/.container-fluid -->
                </div><!--/.navbar -->
            </div> <!-- /container -->
        </div>
        <Center> <h1>Ingrese Sus Datos</h1></center>
        <body>

<center>
<!-- start contact us Section -->
<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs12 ">
				<div class="title_sec">
					
					
				</div>			
			</div>		
			<div class="col-sm-6"> 
				<div id="cnt_form">
					<form id="contact-form" class="contact" name="contact-form" method="post" action="">
						<div class="form-group">
                                                    <input type="number" name="idUsu" class="form-control name-field" placeholder="id del Candidato" >
						</div>
						<div class="form-group">
                                                    Nombre:
                                                    <input type="text" name="nombreUsu" class="form-control mail-field" required="required" placeholder="Nombre del Candidato">
						</div>
                                                      Apellido:
                                                <div class="form-group">
                                                    <input type="text" name="apellidoUsu" class="form-control mail-field" required="required" placeholder="Apellido del Candidato">
						</div>
                                                <div class="form-group">
                                                    Correo:
                                                    <input type="email" name="correoUsu" class="form-control mail-field" required="required" placeholder="ejemplo@gmail.com">
						</div>
                                                <div class="form-group">
                                                    Telefono:
                                                    <input type="text" name="telUsu" class="form-control mail-field" required="required" placeholder="Numero Telefonico">
						</div>
                                                <div class="form-group">Genero:
                                                    Masculino <input type="radio" name="genero">   Femenino <input type="radio" name="genero">
                                                    
						</div>
	
                                                <div class="form-group">
                                                    Fecha de Nacimiento:
                                                    <input type="date" name="fecNac" class="form-control mail-field" required="required">
						</div>
                                                
                                                <div class="form-group">
                                                    Foto(opcional)
                                                    <input type="text" name="foto" class="form-control mail-field" required="required" placeholder="Foto">
						</div> 
                                            
                                              <div class="form-group">
                                                  Idioma
                                                  <select name="idioma" class="form-control mail-field" >
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
                                            
                                             <div class="form-group">
                                                 Habilidad:
                                                  <select name="habilidad" class="form-control mail-field" >
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
                                            <div class="form-group">
                                                Años de Experiencia
                                                <input type="number" name="expL" class="form-control mail-field" required="required" placeholder="Años de Experiencia">
						</div> 
                                             
                                                 <div class="form-group">
                                                     Departamento
                                                     <select name="depto" class="form-control mail-field">
                                                         <%
                                       Depto d = new Depto();
                                       CrudDepto crud = new CrudDepto();
                                      List<Depto> listaD = crud.mostrarDepto();
                                       for(Depto ver:listaD)
                                             {
                             %>
                             <option value="<%= ver.getIdDepto() %>"><%= ver.getNombre() %></option>
                             <%
                          }
                      %>
                                                     </select>
						</div> 
                                                     <div class="form-group">
                                                         Municipio
                                                     <select name="munici" class="form-control mail-field">
                                                         <%
                          Municipio mu = new Municipio();
                          CrudMunicipio crud1 = new CrudMunicipio();
                          List<Municipio> listaM = crud1.mostrarMunicipio();
                          for(Municipio ver:listaM)
                          {
                              %>
                              <option value="<%= ver.getIdMunicipio() %>"><%= ver.getNombre() %></option>
                              <%
                          }
                      %>
                                                     </select>
						</div> 
                                                     
                                                      <div class="form-group">
                                                          Profesion
                                                     <select name="profesion" class="form-control mail-field">
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
                                                     
                                                     <div class="form-group">
                                                         Nivel Academico
                                                     <select name="nivelAca" class="form-control mail-field">
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
                                                      <div class="form-group">
                                                          Id Usuario
                                                     <select name="idUsu" class="form-control mail-field">
                                     <%
                          Usuario us = new Usuario();
                          CrudUsuario cu = new CrudUsuario();
                          List<Usuario> listau = cu.mostrarUsuario();
                          for(Usuario ver:listau)
                          {
                              %>
                              <option value="<%= ver.getIdUsuario() %>"><%= ver.getUsuario() %></option>
                              <%
                          }
                      %>
                                                     </select>
						</div> 
						<div class="form-group">
                                                    <button type="submit" name="insertar" class="btn btn-primary">Publicar</button>
						</div>
					</form> 
				</div>
			</div>	
                                                     <div class="col-lg-6 col-md-6 col-sm-6">
				<div class="cnt_info">
					<ul>
						<li><i class="fa fa-facebook"></i><b>Cadidato... Ingresa tu Datos</b></li>
						<li><i class="fa fa-envelope"></i><b>Para que las empresas Reguistradas</b></li>
						<li><i class="fa fa-phone"></i><b>Los Puedan ver... y asi</b></li>
						<li><i class="fa fa-phone"></i><b>Podran conocer tu cualidades para el trabajo..</b></li>
					</ul>
				</div>
			</div>	
		</div>
	</div>

</center>  


        <div class="templatemo-footer" >
            <div class="container">
                <div class="row">
                    <div class="text-center">

                        <div class="footer_container">
                            <ul class="list-inline">
                                <li>
                                    <a href="#">
                                        <span class="social-icon-fb"></span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <span class="social-icon-rss"></span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <span class="social-icon-twitter"></span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <span class="social-icon-linkedin"></span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <span class="social-icon-dribbble"></span>
                                    </a>
                                </li>
                            </ul>
                            <div class="height30"></div>
                            
                            <div class="height30"></div>
                        </div>
                        <div class="footer_bottom_content">
                            <span id="footer-line">Copyright © 2084 <a href="#">Your Company Name</a></span>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
   


        <script src="../js/jquery.min.js" type="text/javascript"></script>
        <script src="../js/bootstrap.min.js"  type="text/javascript"></script>
        <script src="../js/stickUp.min.js"  type="text/javascript"></script>
        <script src="../js/colorbox/jquery.colorbox-min.js"  type="text/javascript"></script>
        <script src="../js/templatemo_script.js"  type="text/javascript"></script>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
        <script src="js/vendor/jquery-1.11.2.min.js"></script>

<script src="js/isotope.pkgd.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/appear.js"></script>
<script src="js/jquery.counterup.min.js"></script>
<script src="js/waypoints.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/showHide.js"></script>
<script src="js/jquery.nicescroll.min.js"></script>
<script src="js/jquery.easing.min.js"></script>
<script src="js/scrolling-nav.js"></script>
<script src="js/plugins.js"></script>
        <!-- templatemo 395 urbanic -->
        <script>
            // For Demo purposes only
            [].slice.call( document.querySelectorAll('nav > a') ).forEach( function(el) {
                el.addEventListener( 'click', function(ev) { ev.preventDefault(); } );
            } );
        </script>
        <script src="js/main.js"></script>

<script src="showHide.js" type="text/javascript"></script>

<script type="text/javascript">

$(document).ready(function(){


   $('.show_hide').showHide({            
        speed: 1000,  // speed you want the toggle to happen    
        easing: '',  // the animation effect you want. Remove this line if you dont want an effect and if you haven't included jQuery UI
        changeText: 1, // if you dont want the button text to change, set this to 0
        showText: 'View',// the button text to show when a div is closed
        hideText: 'Close' // the button text to show when a div is open
                     
    }); 


});

</script>
<script>
    jQuery(document).ready(function( $ ) {
        $('.counter').counterUp({
            delay: 10,
            time: 1000
        });
    });
</script>

<script>

  //Hide Overflow of Body on DOM Ready //
$(document).ready(function(){
    $("body").css("overflow", "hidden");
});

// Show Overflow of Body when Everything has Loaded 
$(window).load(function(){
    $("body").css("overflow", "visible");        
    var nice=$('html').niceScroll({
    cursorborder:"5",
    cursorcolor:"#00AFF0",
    cursorwidth:"3px",
    boxzoom:true, 
    autohidemode:true
    });

});
</script>

    </body>
</html>