<%-- 
    Document   : user_login_lis
    Created on : 9/07/2021, 06:47:10 PM
    Author     : Daniel Contreras
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Scotiabank.loginDAO.NuevoLoginDAO"%>
<%@page import="Scotiabank.loginVO.NuevoLoginVO"%>
<%@page import="Scotiabank.loginDAO.NuevoUsuarioDAO"%>
<%@page import="Scotiabank.loginVO.NuevoUsuarioVO"%>
<%@page import="ConexionSQL.ConexionSQL"%>
<script src="../js/bootstrap.js" type="text/javascript"></script>
<script src="../js/bootstrap.min.js" type="text/javascript"></script>
<!DOCTYPE html>
<html>
    <head>
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/estilo.css" rel="stylesheet" type="text/css"/>
        <link href="../css/alertify.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/default.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/default.rtl.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <%!
        String cedula, fecha, primerNom, segunNom, primerApe, segunApe, tel1, tel2;
    %>
    <%
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String Documento = "1";
        NuevoUsuarioVO NuevoUsuarioVO = new NuevoUsuarioVO();
        NuevoLoginDAO NuevoLoginDAO = new NuevoLoginDAO(Documento);
        List<NuevoUsuarioVO> ListaPersona = NuevoLoginDAO.ListaPersona(email);
        if (ListaPersona != null) {
            for (int i = 0; i < ListaPersona.size(); i++) {
                cedula = ListaPersona.get(i).getCedula();
                fecha = ListaPersona.get(i).getFechaNacimiento();
                primerNom = ListaPersona.get(i).getPriNombre();
                segunNom = ListaPersona.get(i).getSeguNombre();
                primerApe = ListaPersona.get(i).getPriApellido();
                segunApe = ListaPersona.get(i).getSegunApellido();
                tel1 = ListaPersona.get(i).getTel1();
                tel2 = ListaPersona.get(i).getTel2();
            }
            ListaPersona = null;
        } else {
            System.out.println("no hay lista");
        }
        if (request.getParameter("btnsalir") != null) {
            response.sendRedirect("../index.jsp");
        }
    %>
    <c:if test="${not empty ListaPersona}">
        <body id="main_user">        
            <input type="hidden" id="usuariprin" name="usuariprin" value="1"/>
            <div class="container well" id="ContainerUser">
                <form id ="datos" name ="datos" class="margin-bottom-0" method="post" >
                    <center><label for="text">Informacion de la persona</label></center>
                    <c:forEach var="j" items="${ListaPersona}">
                        <div class="form-group col-md-12" style="margin-top: 0.5em;">
                            <label for="text">Documento:</label>
                            <input type="Documento" name="Documento" class="form-control" id="inputDocumento" placeholder="Documento" readonly="readonly" value="<%= cedula%>">
                        </div>
                        <div class="form-group col-md-12" style="margin-top: 0.5em;">
                            <label for="text">Fecha Nacimiento:</label>
                            <input type="fecha" name="fecha" class="form-control" id="inputDocumento" placeholder="fecha" readonly="readonly" value="<%= fecha%>">                    
                        </div>                
                        <div class="form-group col-md-6" style="margin-top: 0.5em;">
                            <label for="text"> Primer Nombre:</label>
                            <input type="Primer_Nombre" name="Primer_Nombre" class="form-control" id="inputPrimer_Nombre" name="inputPrimer_Nombre" placeholder="Primer Nombre" readonly="readonly" value="<%= primerNom%>">
                        </div>
                        <div class="form-group col-md-6" style="margin-top: 0.5em;">
                            <label for="text"> Segundo Nombre:</label>
                            <input type="Segundo_Nombre" name="Segundo_Nombre" class="form-control" id="inputSegundo_Nombre" placeholder="Segundo Nombre" readonly="readonly" value="<%= segunNom%>">
                        </div>
                        <div class="form-group col-md-6" style="margin-top: 0.5em;">
                            <label for="text"> Primer Apellido:</label>
                            <input type="Primer_Apellido" name="Primer_Apellido" class="form-control" id="inputPrimer_Apellido" placeholder="Primer Apellido" readonly="readonly" value="<%= primerApe%>">
                        </div>
                        <div class="form-group col-md-6" style="margin-top: 0.5em;">
                            <label for="text"> Segundo Apellido:</label>
                            <input type="Segundo_Apellido" name="Segundo_Apellido" class="form-control" id="inputSegundo_Apellido" placeholder="Segundo Apellido" readonly="readonly" value="<%= segunApe%>">
                        </div>
                        <div class="form-group col-md-6" style="margin-top: 0.5em;">
                            <label for="text"> Telefono:</label>
                            <input type="Telefono1" name="Telefono1" class="form-control" id="inputTelefono" placeholder="Telefono" readonly="readonly" value="<%= tel1%>">
                        </div>
                        <div class="form-group col-md-6" style="margin-top: 0.5em;">
                            <label for="text"> Segundo Telefono:</label>
                            <input type="Telefono2" name="Telefono2" class="form-control" id="inputTelefono2" placeholder="Telefono2" readonly="readonly" value="<%= tel2%>">
                        </div>                 
                        <div class="form-group col-md-12" style="margin-top: 0.5em;">
                            <label for="text">Correo:</label>
                            <input type="Correo" name="Correo" class="form-control" id="inputCorreo" placeholder="Correo" readonly="readonly" value="<%= email%>">
                        </div>
                    </c:forEach>
                    <div>
                        <center><button type="submit" id="btnsalir" name="btnsalir" class="btn btn-danger">Salir</button></center>
                    </div>                    
                </form>
            </div> 
        </body>
    </c:if>
</html>
        
    
