<%-- 
    Document   : index
    Created on : 8/07/2021, 04:57:45 PM
    Author     : Daniel Contreras
--%>

<%@page import="java.util.List"%>
<%@page import="Scotiabank.loginVO.NuevoUsuarioVO"%>
<%@page import="Scotiabank.loginDAO.NuevoUsuarioDAO"%>
<%@page import="Scotiabank.loginDAO.NuevoLoginDAO"%>
<%@page import="Scotiabank.loginVO.NuevoLoginVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        
        <link href="css/default.rtl.min.css" rel="stylesheet" type="text/css"/>
        
        <link href="css/alertify.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/default.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body id="main">
        <input type="hidden" id="usuariprin" name="usuariprin" value="1"/>
        <div class="container well" id="ContainerLogin">
            <center>
                <img src="img/logo.png" alt=""/>
            </center>
            <form name="form_login" id="form_login" onsubmit="return validar_correo()">
                <div class="form-group">
                    <label for="text">Correo:</label>
                    <input type="text" name="email" class="form-control">
                </div>
                <div class="form-group">
                    <label for="text">Contraseña:</label>
                    <input type="password" name="password" class="form-control">
                </div>
                <button type="submit" id="btnlogin" name="btnlogin" class="btn btn-danger">Entrar</button>
                <div>
                    <center>¿No tienes cuenta? <a href="nuevousuario/nue_user_lis.jsp" class="text-decoration-none" >¡Crea una!</a></center>
                        <%--<center>¿No tienes cuenta? <a href="nuevousuario/nue_user_ctr.jsp?op=1&usuariprin=1" class="text-decoration-none" >¡Crea una!</a></center>--%>
                </div>
            </form>
        </div>
        <%

            String Documento = "1";
            if (request.getParameter("btnlogin") != null) {
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                if (email != "" && password != "") {
                    NuevoLoginVO NuevoLoginVO = new NuevoLoginVO();
                    NuevoLoginVO.setCorreo(request.getParameter("email"));
                    NuevoLoginVO.setPassword(request.getParameter("password"));
                    NuevoLoginDAO NuevoLoginDAO = new NuevoLoginDAO(Documento);
                    if (NuevoLoginDAO.buscar(email, password)) {
                        response.sendRedirect("nuevousuario/user_login_lis.jsp?&email=" + email + "&password=" + password);
                    } else {
                        System.out.println("NO Existe Ese Usuario");
                        String mensaje="<script src='js/alertify.min.js' type='text/javascript'>"
                                + "</script><script type='text/javascript'>alertify.success('NO Existe Ese Usuario');</script>";
                        out.println(mensaje);                        
                    }
                } else {
                    System.out.println("Campos Vacíos");
                        String mensaje="<script src='js/alertify.min.js' type='text/javascript'>"
                                + "</script><script type='text/javascript'>alertify.success('Campos Vacíos');</script>";
                        out.println(mensaje);
                }
            } else {
                System.out.println("boton null");
            }
        %>
        <script src="js/alertify.min.js" type="text/javascript"></script>
        <script>
            function validar_correo(){
                correo = document.form_login.email.value;
                if(correo.length == 0){
                    //alertify.alert("Error","Campos Vacios").set('label','ok');
                    alertify.success("Campos Vacios o Incorrectos");
                    return false;
                }
                //else{
                //    alertify.success("Bienvenido");
                //    return true;
                //}
            }    
        </script>
    </body>
</html>
