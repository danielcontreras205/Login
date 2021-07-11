<%-- 
    Document   : nue_user_lis
    Created on : 8/07/2021, 07:21:07 PM
    Author     : Daniel Contreras
--%>
<%@page import="Scotiabank.loginDAO.NuevoLoginDAO"%>
<%@page import="Scotiabank.loginVO.NuevoLoginVO"%>
<%@page import="Scotiabank.loginDAO.NuevoUsuarioDAO"%>
<%@page import="Scotiabank.loginVO.NuevoUsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ConexionSQL.ConexionSQL"%>
<script src="../js/bootstrap.js" type="text/javascript"></script>
<script src="../js/bootstrap.min.js" type="text/javascript"></script>
<!DOCTYPE html>
<html>
    <head>
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/estilo.css" rel="stylesheet" type="text/css"/>
        <link href="../css/default.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/alertify.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/default.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/default.rtl.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        
        

    </head>
    <body id="main_nue_user">        
        <input type="hidden" id="usuariprin" name="usuariprin" value="1"/>
        <div class="container well" id="ContainerNuevoUser">
            <form name="form_user" class="margin-bottom-0" method="post" onsubmit="return validar_Campos()">
                <div class="form-group col-md-12" style="margin-top: 0.5em;">
                    <label for="text">Documento(<span style="color: #6B0D0D" class="fa fa-asterisk"></span>):</label>
                    <input type="Documento" name="Documento" class="form-control" id="inputDocumento" placeholder="Documento">
                </div>
                <div class="form-group col-md-12" style="margin-top: 0.5em;">
                    <label for="text">Fecha Nacimiento(<span style="color: #6B0D0D" class="fa fa-asterisk"></span>):</label>
                    <input class="form-control" type="date" name="date" value="yyyy-mm-dd" name="fecha" id="fecha" placeholder="Ingrese su Fecha">
                </div>                
                <div class="form-group col-md-6" style="margin-top: 0.5em;">
                    <label for="text"> Primer Nombre(<span style="color: #6B0D0D" class="fa fa-asterisk"></span>):</label>
                    <input type="Primer_Nombre" name="Primer_Nombre" class="form-control" id="inputPrimer_Nombre" name="inputPrimer_Nombre" placeholder="Primer Nombre">
                </div>
                <div class="form-group col-md-6" style="margin-top: 0.5em;">
                    <label for="text"> Segundo Nombre:</label>
                    <input type="Segundo_Nombre" name="Segundo_Nombre" class="form-control" id="inputSegundo_Nombre" placeholder="Segundo Nombre">
                </div>
                <div class="form-group col-md-6" style="margin-top: 0.5em;">
                    <label for="text"> Primer Apellido(<span style="color: #6B0D0D" class="fa fa-asterisk"></span>):</label>
                    <input type="Primer_Apellido" name="Primer_Apellido" class="form-control" id="inputPrimer_Apellido" placeholder="Primer Apellido">
                </div>
                <div class="form-group col-md-6" style="margin-top: 0.5em;">
                    <label for="text"> Segundo Apellido:</label>
                    <input type="Segundo_Apellido" name="Segundo_Apellido" class="form-control" id="inputSegundo_Apellido" placeholder="Segundo Apellido">
                </div>                
                <div class="form-group col-md-12" style="margin-top: 0.5em;">
                    <label for="text">Correo(<span style="color: #6B0D0D" class="fa fa-asterisk"></span>):</label>
                    <input type="correo" id ="correo" name="correo" class="form-control" id="inputCorreo" placeholder="correo">
                </div>
                <div class="form-group col-md-6" style="margin-top: 0.5em;">
                    <label for="text">Password(<span style="color: #6B0D0D" class="fa fa-asterisk"></span>):</label>
                    <input type="password1" name="password1" class="form-control" id="inputpassword1" placeholder="Password">
                </div>
                <div class="form-group col-md-6" style="margin-top: 0.5em;">
                    <label for="text">Confirmar Password(<span style="color: #6B0D0D" class="fa fa-asterisk"></span>):</label>
                    <input type="password2" name="password2" class="form-control" id="inputpassword2" placeholder="Password">
                </div>
                <div class="form-group col-md-6" style="margin-top: 0.5em;">
                    <label for="text"> Telefono(<span style="color: #6B0D0D" class="fa fa-asterisk"></span>):</label>
                    <input type="Telefono1" name="Telefono1" class="form-control" id="inputTelefono" placeholder="Telefono">
                </div>
                <div class="form-group col-md-6" style="margin-top: 0.5em;">
                    <label for="text"> Segundo Telefono:</label>
                    <input type="Telefono2" name="Telefono2" class="form-control" id="inputTelefono2" placeholder="Telefono2">
                </div>               
                <div>
                    <center>
                    <button type="submit" id="btnguardar" name="btnguardar" class="btn btn-danger" onclick="validarEmail(document.getElementById('correo').value)">Guardar</button>
                    <button type="button" id="btncancelar" name="btncancelar" class="btn btn-danger" onclick="myFunction()">Cancelar</button>                 
                    </center>
                </div>
                
            </form>
        </div>  
        <%
            String Documento = request.getParameter("usuariprin");
            String pass = request.getParameter("password1");
            String pass2 = request.getParameter("password2");
            if (request.getParameter("btnguardar") != null) {
                if (pass.equals(pass2)) {
                    if (request.getParameter("btnguardar") != null) {
                        NuevoUsuarioVO NuevoUsuarioVO = new NuevoUsuarioVO();
                        NuevoUsuarioVO.setCedula(request.getParameter("Documento"));
                        NuevoUsuarioVO.setFechaNacimiento(request.getParameter("date"));
                        NuevoUsuarioVO.setPriNombre(request.getParameter("Primer_Nombre"));
                        NuevoUsuarioVO.setSeguNombre(request.getParameter("Segundo_Nombre"));
                        NuevoUsuarioVO.setPriApellido(request.getParameter("Primer_Apellido"));
                        NuevoUsuarioVO.setSegunApellido(request.getParameter("Segundo_Apellido"));
                        NuevoUsuarioVO.setTel1(request.getParameter("Telefono1"));
                        NuevoUsuarioVO.setTel2(request.getParameter("Telefono2"));
                        NuevoUsuarioDAO NuevoUsuarioDAO = new NuevoUsuarioDAO(Documento);
                        if (NuevoUsuarioDAO.Insertar(NuevoUsuarioVO)) {
                            System.out.println("Inserto usuario");
                            NuevoLoginVO NuevoLoginVO = new NuevoLoginVO();
                            NuevoLoginVO.setCedula(request.getParameter("Documento"));
                            NuevoLoginVO.setCorreo(request.getParameter("correo"));
                            NuevoLoginVO.setPassword(request.getParameter("password1"));
                            NuevoLoginVO.setPassword2(request.getParameter("password2"));
                            NuevoLoginDAO NuevoLoginDAO = new NuevoLoginDAO(Documento);
                            if (NuevoLoginDAO.Insertar(NuevoLoginVO)) {
                                String var = "Se Gusrdo Corectamente";
                                System.out.println(var);
                                response.sendRedirect("../index.jsp");
                            }
                        }
                    } else {
                        System.out.println("null");
                    }
                } else {
                    System.out.println("no son iguales");
                    String mensaje1 = "<script src='../js/alertify.min.js' type='text/javascript'></script>"
                            + "</script><script type='text/javascript'>alertify.success('Las Contraseñas No Son Iguales');</script>";
                    out.println(mensaje1);
                }
            } else {
                System.out.println("boton null");
            }
            if (request.getParameter("btncancelar") != null) {
            response.sendRedirect("../index.jsp");
            }


        %>
    <script src="../js/alertify.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.js" integrity="sha512-ia48mJh6IXv6baAI07Ib/crgsG/MD4tbSnOndWLo3GSExMhYsn1xPbni40VamCaXWk79t1dxi/JahsqOFazkew==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>
        function validar_Campos(){
            documento = document.form_user.Documento.value;
            if(documento.length == 0){
                //alertify.alert("Error","Campos Vacios").set('label','ok');
                alertify.success("Escriba Un Documento");
                return false;
            }
            else{
                date = document.form_user.date.value;
                if(date.length == 0){
                    //alertify.alert("Error","Campos Vacios").set('label','ok');
                    alertify.success("Coloque Una Fecha");
                    return false;
                }
                else{
                    nombre = document.form_user.Primer_Nombre.value;
                    if(nombre.length == 0){
                        //alertify.alert("Error","Campos Vacios").set('label','ok');
                        alertify.success("Escriba Un Nombre");
                        return false;
                    }
                    else{
                        apellido = document.form_user.Primer_Apellido.value;
                        if(apellido.length == 0){
                            //alertify.alert("Error","Campos Vacios").set('label','ok');
                            alertify.success("Escriba Un Apellido");
                            return false;
                        }
                        else{
                            Correo = document.form_user.correo.value;
                            if(Correo.length == 0){
                                alertify.success("Escriba Un Correo");
                                return false;
                            }
                            else{
                                
                                password = document.form_user.password1.value;
                                if(password.length == 0){
                                    //alertify.alert("Error","Campos Vacios").set('label','ok');
                                    alertify.success("Escriba Una Contraseña");
                                    return false;
                                }
                                else{
                                    Telefono = document.form_user.Telefono1.value;
                                    if(Telefono.length == 0){
                                        //alertify.alert("Error","Campos Vacios").set('label','ok');
                                        alertify.success("Escriba Un Telefono");
                                        return false;
                                    }
                                    else{
                                        return true;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        function validarEmail(valor) {
            var expReg= /^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$/;
            var esValido = expReg.test(valor);
            if(esValido == true){
                alertify.success("OK Correo");
            } else {
                alertify.success("El Correo No es Válido");
            }
        }
        function myFunction() {
            window.history.go(-1);
        }
        </script>
    </body>

    </html>

