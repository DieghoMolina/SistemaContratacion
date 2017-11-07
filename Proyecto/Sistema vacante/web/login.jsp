<%-- 
    Document   : login
    Created on : 10-08-2017, 01:56:15 PM
    Author     : Marvin Antillon.
--%>

<%@page import="modelado.Operaciones"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login/Registro</title>
        <meta name="keywords" content="" />
        <meta name="description" content="" />
<!--

Urbanic Template

http://www.templatemo.com/tm-395-urbanic

-->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--<link rel="shortcut icon" href="PUT YOUR FAVICON HERE">-->
        
        <!-- Google Web Font Embed -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
        
        <!-- Bootstrap core CSS -->
        <link href="usuarior/css/bootstrap.css" rel='stylesheet' type='text/css'>

        <!-- Custom styles for this template -->
        <link href="usuarior/js/colorbox/colorbox.css"  rel='stylesheet' type='text/css'>
        <link href="usuarior/css/templatemo_style.css"  rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="login/css/style.css">


        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>
    

        <div class="templatemo-top-menu">
            <div class="container">
                <!-- Static navbar -->
                <div class="navbar navbar-default" role="navigation">
                    <div class="container">
                        <div class="navbar-header">
                                <button tiype="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                </button>
                                <a href="#" class="navbar-brand"><img src="usuarior/images/templatemo_logo.png" alt="Urbanic Template" title="Urbanic Template" /></a>
                        </div>
                        <div class="navbar-collapse collapse" id="templatemo-nav-bar">
                            <ul class="nav navbar-brand navbar-right" style="margin-top: 40px;">
                                <a href="index.jsp ">Inicio</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="lempresa.jsp ">Publicar Ofertas</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                
                            </ul>
                        </div><!--/.nav-collapse -->
                    </div><!--/.container-fluid -->
                </div><!--/.navbar -->
            </div> <!-- /container -->
        </div>
        <div class="form">
      
      <ul class="tab-group">
        <li class="tab active"><a href="#login">Iniciarse</a></li>
        <li class="tab"><a href="#signup">Registro</a></li>
      </ul>
      
      <div class="tab-content">
        
                 
           <div id="login">   
          <h1>Bienvenido de nuevo!</h1>
          
          <form action="login.jsp" method="post">
          
            <div class="field-wrap">
            
                <input type="text" name="txtusuario" placeholder="Nombre de Usuario" >
                          </div>
          
          <div class="field-wrap">
            <label>   
                
              Password<span class="req">*</span>
            </label>
                <input type="password" name="txtcontra">
        </div>
          
          <p class="forgot"><a href="#">Forgot Password?</a></p>
          
          <button class="button button-block" name="btnIngresar" />Iniciar sesion</button>
          
          </form>
<%
    Operaciones op = new Operaciones();
    
              if(request.getParameter("btnIngresar")!=null){
              String nombre=request.getParameter("txtusuario");
              String contra=request.getParameter("txtcontra");
              HttpSession sesion = request.getSession();
              
              switch(op.loguear(nombre, contra)){
          
                      
              case 2 :
                  sesion.setAttribute("user", nombre);
                  sesion.setAttribute("nivel", "2");
                  response.sendRedirect("usuarior/index.jsp"); 
                      break;
                      
                       case 3 :
                  sesion.setAttribute("user", nombre);
                  sesion.setAttribute("nivel", "3");
                  response.sendRedirect("empresar/index.jsp");
                      break;
                      default:
                          out.write("<font color='white'> <h3>Usuario no existe, o Contraseña invalida</h3></font>");
                          break;
                  
              }
              }
              
          if(request.getParameter("cerrar")!=null){
          session.invalidate();
          }
    %>
        </div>
        <div id="signup">   
          <h1>Registrate, es gratis!</h1>
          
          <form action="/" method="post">
          
          <div class="top-wrap">
            <div class="field-wrap">
              <label>
                Nombre de Usuario<span class="req">*</span>
              </label>
              <input type="text" required autocomplete="off" />
            </div>
        
            <div class="field-wrap">
              
            </div>
          </div>

          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <input type="password"required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Repetir Password<span class="req">*</span>
            </label>
            <input type="password"required autocomplete="off" />
          </div>
          
          <button type="submit" class="button button-block"/>Get Started</button>
          
          </form>

        </div>
           <!-- Aqui -->
             
        </div><!-- tab-content -->
      
</div> <!-- /form -->
   

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

        <script src="usuarior/js/jquery.min.js" type="text/javascript"></script>
        <script src="usuarior/js/bootstrap.min.js"  type="text/javascript"></script>
        <script src="usuarior/js/stickUp.min.js"  type="text/javascript"></script>
        <script src="usuarior/js/colorbox/jquery.colorbox-min.js"  type="text/javascript"></script>
        <script src="usuarior/js/templatemo_script.js"  type="text/javascript"></script>
        <!-- templatemo 395 urbanic -->
        <script>
            // For Demo purposes only
            [].slice.call( document.querySelectorAll('nav > a') ).forEach( function(el) {
                el.addEventListener( 'click', function(ev) { ev.preventDefault(); } );
            } );
        </script>
        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    <script  src="login/js/index.js"></script>
    </body>
</html>