<%-- 
    Document   : loguin
    Created on : 23-oct-2017, 19:44:52
    Author     : diego
--%>

<%@page import=" modelado.Operaciones"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>TECOLOCAMOS-ADMIN</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/iCheck/square/blue.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="../../index2.html"><b>TECOLOCAMOS.COM</b>/Admin</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Inicia sesion para ingresar</p>

    <form action="login.jsp" method="post">
      <div class="form-group has-feedback">
        <input type="text" class="form-control" placeholder="Usuario" name="txtusuario" >
       
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="Password" name="txtcontra">
       
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input type="checkbox"> Recordarme 
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat" name="btnIngresar">Ingresar</button>
        </div>
        <!-- /.col -->
      </div>
    </form>
  <%
    Operaciones op = new Operaciones();
    
              if(request.getParameter("btnIngresar")!=null){
              String nombre=request.getParameter("txtusuario");
              String contra=request.getParameter("txtcontra");
              HttpSession sesion = request.getSession();
              String vec[]=op.loguear(nombre, contra);
              int var=Integer.parseInt( vec[3]);
              switch(var){
          
                      
             
              case 1 :
                  sesion.setAttribute("id", vec[0]);
                  sesion.setAttribute("user", vec[1]);
                  sesion.setAttribute("nivel", "1");
                  response.sendRedirect("dashboard/candidato.jsp");
                      break;
                      default:
                          out.write("<h3>Usuario no existe, o Contraseña invalida</h3>");
                          break;
                  
                 }
              }
              
          if(request.getParameter("cerrar")!=null){
          session.invalidate();
          }
    %>
   
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 3 -->
<script src="dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="dist/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="plugins/iCheck/icheck.min.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
</script>
</body>
</html>
