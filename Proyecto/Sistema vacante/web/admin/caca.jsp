<%-- 
    Document   : caca
    Created on : 14-oct-2017, 15:23:32
    Author     : diego
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="../procesarCurriculum" method="get" class="form-horizontal" name="frm1">
              Co <input type="text" name="codigo" class="span11" placeholder="codigo" />
            NO <input name="curri" type="text" class="span11" >
             <input name="fechamodi" type="text" class="span11" placeholder="fecha">
              <input name="candidato" type="text" class="span11" placeholder="candidato">
           <input type="submit" class="btn btn-success" name="btnInsertar" value="insertar">&nbsp;&nbsp;
        </form>
    </body>
</html>
