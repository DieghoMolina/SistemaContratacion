<!DOCTYPE HTML>
<!--
	Landed by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Tecolocamos.com</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
	</head>
	<body class="landing">
        
		<div id="page-wrapper">

			<!-- Header -->
				<header id="header">
					<h1 id="logo">Tecolocamos</h1>
					<nav id="nav">
						<ul>
							<li><a href="index.jsp">Inicio</a></li>
							<li>
								<a href="ofertas.jsp">Ofertas</a>
								
							</li>
						
							<li>    <%
        HttpSession sesion = request.getSession();
        String usuario;
        String nivel;
        

       if(sesion.getAttribute("user")!=null && sesion.getAttribute("nivel")!=null){
           usuario=sesion.getAttribute("user").toString();
           nivel=sesion.getAttribute("nivel").toString();
           out.print("<a href='../login.jsp?cerrar=true' class='button special'><h5>Cerrar Sesion "+usuario+"</h5></a>");    
       }else{
       out.print("<script>location.replace('../login.jsp');</script>");
       }
        %></li>
						</ul>
					</nav>
				</header>

			<!-- Banner -->
				<section id="banner">
					<div class="content">
						<header>
							<h2>El futuro esta en tus manos</h2>
							<p>Nosotros te brindamos muchas<br />
							Oportunidades, tu aprovechalas.</p>
						</header>
						<span class="image"><img src="vistausu/images/pic01.jpg" alt="" /></span>
					</div>
					<a href="#one" class="goto-next scrolly">Next</a>
				</section>

			<!-- One -->
				<section id="one" class="spotlight style1 bottom">
					<span class="image fit main"><img src="images/pic02.jpg" alt="" /></span>
					<div class="content">
						<div class="container">
							<div class="row">
								<div class="4u 12u$(medium)">
									<header>
										<h2>Empieza a construir tu propio futuro</h2>
										
									</header>
								</div>
								<div class="4u 12u$(medium)">
									<p>Has visitado un millon de paginas similare a esta? 


Tecolocamos te ayuda a encontrar un empleo, en una gran variedad de empresas , sin perder tiempo y dinero Tecolocamos te lo hace facil para que encuentres tu trabajo Ideal en el menor tirmpo posible.
									  </p>
								</div>
								<div class="4u$ 12u$(medium)">
									<p> Tecolocamos busca al instante entre cientos de empleos y te muestra los empleos disponibles, selecciona el empleo que se mas se adecue a tus necesidades. Tecolocamos.com, tu opcion ideal</p>
								</div>
							</div>
						</div>
					</div>
					<a href="#two" class="goto-next scrolly">Next</a>
				</section>

			<!-- Two -->
				<section id="two" class="spotlight style2 right">
					<span class="image fit main"><img src="images/pic03.jpg" alt="" /></span>
					<div class="content">
						<header>
							<h2>¿Que beneficios le brinda Tecolocamos.com?</h2>
							<p></p>
						</header>
						<p>

Efectividad:
Al publicar un anuncio o realizar búsquedas en Tecolocamos.com, usted obtiene respuesta inmediata, con solo hacer un "click" usted tiene el acceso a candidatos calificados que llenan los requisitos del perfil solicitado.<br>

Productividad:
Al utilizar Tecolocamos.com, usted puede aplicar los filtros que desee, de tal forma que optimiza su tiempo en la búsqueda de candidatos.  </p>
					</div>
					<a href="#three" class="goto-next scrolly">Next</a>
				</section>

			<!-- Three -->
				<section id="three" class="spotlight style3 left">
					<span class="image fit main bottom"><img src="images/pic04.jpg" alt="" /></span>
					<div class="content">
						<header>
							<h2>Mision</h2>
							<p></p>
						</header>
						<p>Brindar a nuestros usuarios información confiable y actual, ofreciéndole una gama de productos y servicios a la vanguardia de la industria, con el fin de garantizar la colocación del mejor recurso humano en la región centroamericana. </p>
						
					</div>
					<a href="#four" class="goto-next scrolly">Next</a>
				</section>

			<!-- Four -->
			<!-- Footer -->
				<footer id="footer">
					<ul class="icons">
						<li><a href="#" class="icon alt fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="#" class="icon alt fa-facebook"><span class="label">Facebook</span></a></li>
						
						<li><a href="#" class="icon alt fa-instagram"><span class="label">Instagram</span></a></li>
						
						<li><a href="#" class="icon alt fa-envelope"><span class="label">Email</span></a></li>
					</ul>
					<ul class="copyright">
						<li>&copy; Todos los derechos reservados.</li><li>Design: Marvin, Diego</li>
					</ul>
				</footer>

		</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>

	</body>
</html>