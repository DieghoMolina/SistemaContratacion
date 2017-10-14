<%@page import="modelo.Oferta"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Empresa"%>
<%@page import="modelo.CrudEmpresa"%>
<%@page import="modelo.CrudOferta"%>
<!DOCTYPE HTML>
<!--
        Landed by HTML5 UP
        html5up.net | @ajlkn
        Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
    <head>
        <%
            CrudOferta cdf = new CrudOferta();
            CrudEmpresa cde = new CrudEmpresa();
        %>
        <title>Ofertas de Empleo</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="assets/css/main.css" />
        <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
    </head>
    <body>

        <div id="page-wrapper">

            <!-- Header -->
            <header id="header">
                <h1 id="logo"><a href="index.html">Tecolocamos</a></h1>
                <nav id="nav">
                    <ul>
                        <li><a href="../index.jsp">Inicio</a></li>
                        <li>
                            <a href="#">Ofertas</a>

                        </li>

                        <li><a href="../login.jsp" class="button special">Iniciar Sesion</a></li>
                    </ul>

                </nav>
            </header>

            <!-- Main -->
            <div id="main" class="wrapper style1">
                <div class="container">
                    <header class="major">
                        <h2>Ofertas de empleo</h2>
                        <p>Bienvenido a la seccion de Ofertas.<p>
                    </header>
                    <div class="row 150%">
                        <div class="4u 12u$(medium)">

                            <!-- Sidebar -->
                            <section id="sidebar">
                                <section>
                                    <h3>Nuestro equipo</h3>
                                    <p>Como Tecolocamos.com creemos en el trato personalizado y en relaciones de negocios a largo plazo, por ello nuestro equipo está conformado por profesionales con amplia experiencia en: 

                                        Identificación, reclutamiento, selección y desarrollo del capital humano. 
                                        Tecnología. 
                                        Mercadeo y ventas. 
                                        Compensaciones y beneficios. 
                                        Desarrollo organizacional. </p>

                                </section>
                                <hr />
                                <section>
                                    <a href="#" class="image fit"><img src="images/pic06.jpg" alt="" /></a>
                                    <h3>Quienes somos?</h3>
                                    <p>Tecoloco.com es parte del SAON GROUP, exitoso grupo Europeo líder en el mercado de bolsas de trabajo y con presencia en 4 continentes, ofreciendo soluciones integrales en el área de Recursos Humanos con un fin común: Ser el Socio Estratégico de nuestros Clientes en el desarrollo y crecimiento de su Capital Humano. .</p>

                                </section>
                            </section>

                        </div>
                        <div class="8u$ 12u$(medium) important(medium)">

                            <!-- Content -->
                            <section>

                                <h4>Ofertas especiales para ti</h4>
                                <div class="table-wrapper">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>Codigo</th>
                                                <th>Nombre</th>
                                                <th>Descripci�n</th>
                                                <th>Salario</th>
                                                <th>Vacante</th>
                                                <th>Edad requerida</th>
                                                <th>Anos de Experiencia requerida</th>
                                                <th>Genero requerido</th>
                                                <th>Tipo de contrataci�n</th>
                                                <th>Empresa</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                List<Oferta> lof = cdf.mostrarOferta();
                                                for (Oferta of : lof) {
                                            %>
                                            <tr class="odd gradeX">
                                                <td><%= of.getIdoferta()%></td>
                                                <td><%= of.getNombre()%></td>
                                                <td><%= of.getDescripcion()%></td>
                                                <td><%= of.getSalario()%></td>
                                                <td><%= of.getVacante()%></td>
                                                <td><%= of.getEdadRequerida()%></td>
                                                <td><%= of.getExpRequerida()%></td>
                                                <td><%= of.getGeneroRequerido()%></td>
                                                <td><%= of.getTipoContratacion()%></td>
                                                <td><%= of.getIdEmpresa()%></td>
                                            </tr> 
                                            <% }%>
                                        </tbody>
                                    </table>


                                </div>

                                <!-- Footer -->
                                <footer id="footer">
                                    <ul class="icons">
                                        <li><a href="#" class="icon alt fa-twitter"><span class="label">Twitter</span></a></li>
                                        <li><a href="#" class="icon alt fa-facebook"><span class="label">Facebook</span></a></li>
                                        <li><a href="#" class="icon alt fa-linkedin"><span class="label">LinkedIn</span></a></li>
                                        <li><a href="#" class="icon alt fa-instagram"><span class="label">Instagram</span></a></li>
                                        <li><a href="#" class="icon alt fa-github"><span class="label">GitHub</span></a></li>
                                        <li><a href="#" class="icon alt fa-envelope"><span class="label">Email</span></a></li>
                                    </ul>
                                    <ul class="copyright">
                                        <li>&copy; Untitled. All rights reserved.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
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