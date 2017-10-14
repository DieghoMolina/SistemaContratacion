<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Matrix Admin</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<%@include file="../../layouts/stylesheets.jsp" %>
</head>
<body>
 <%
        HttpSession sesion = request.getSession();
        String usuario;
        String nivel;
        

       if(sesion.getAttribute("user")!=null && sesion.getAttribute("nivel")!=null){
           usuario=sesion.getAttribute("user").toString();
           nivel=sesion.getAttribute("nivel").toString();
           out.print("<a href='../../login.jsp?cerrar=true'><h5>Cerrar Sesion"+usuario+"</h5></a>");    
       }else{
       out.print("<script>location.replace('../../login.jsp');</script>");
       }
        %>

<!--Header-part-->
<div id="header">
  <h1><a href="dashboard.html">Matrix Admin</a></h1>
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

<!-- el codigo tiene que terminar aqui -->
</div>

<!--end-main-container-part-->

<!--Footer-part-->
<%@include file="../../layouts/footer/footer.jsp" %>

<!--end-Footer-part-->
<%@include file="../../layouts/javascript.jsp" %>

</body>
</html>
