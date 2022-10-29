<%-- 
    Document   : economia
    Created on : 26/10/2022, 10:58:38 AM
    Author     : Sebastian Sanchez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controlador.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            *{
                margin: 0px;
                padding: 0px;
            }
            body{

                font-family: 'Arial', Helvetica, sans-serif;
                background-color: #AFB0AE;
            }
            #container{
                width: 100%;
            }
            header{
                background: white;
                height: 80px;
                width: 100%;
                margin: 0px;
                text-align: center;
                line-height: 100px;
                color: black;
                border: 1px black;
            }
            #content{
                background: green;
                text-align: center;
                line-height: 10px;
                color: white;
            }
            footer{
                background: black;
                color: white;
                text-align: center;
                height: 50px;
                line-height: 50px;
            }
        </style>
    </head>

    <body>
        <div id="container">
            <header>
                <h1>Modifica tu Economia</h1>
            </header>
            <section id="content">
                <%  Controlador ctrl = Control.getCtrl();
                    String action = request.getParameter("action");
                    String usuario = request.getParameter("usuario");
                    String contrasena = request.getParameter("contrasena");
                    String m = "";
                    ctrl.connect();
                    if (action.equals("ingresar")) {
                        if (ctrl.getMySql().verificarContraseña(usuario, contrasena)) {
                            if (ctrl.getMySql().existeEconomia(ctrl.getMySql().buscarEstudiante(usuario))) {
                                String salida = ctrl.getMySql().busquedaEconomia(ctrl.getMySql().buscarEstudiante(usuario));
                                out.print("<br>"+salida+"<br>");
                                out.println("Desea editar su economia? \n");
                                out.println("<button> \n");
                                out.println("<a href=listado.jsp>aceptar</a> \n");
                                out.println("</button> \n");
                                out.println("<button> \n");
                                out.println("<a href=index.html>volver al inicio</a> \n");
                                out.println("</button> \n");
                            } else {
                                String nueva = "Desea crear su economia? \n";
                                out.println(nueva);
                                out.println("<button> \n");
                                out.println("<a href=listado.jsp>aceptar</a> \n");
                                out.println("</button> \n");
                            }
                        } else {
                            out.println("El usuario o contraseña estan mal, o El usuario no esta registrado \n");
                            out.println("<button> \n");
                            out.println("<a href=index.html>Volver al inicio</a> \n");
                            out.println("</button> \n");
                        }
                    }
                %>
            </section>
            <footer>
                Creadores: Estudiantes de la Univesidad de Cundinamarca &copy;2022
            </footer>
        </div>
    </body>
</html>
