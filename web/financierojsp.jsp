<%-- 
    Document   : financierojsp
    Created on : 26/10/2022, 08:48:32 AM
    Author     : Sebastian Sanchez
--%>
<%@page import="controlador.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
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
    <body>
        <div id="container">
            <header>
                <h1>Herramientas de estudiante</h1>
            </header>
            <section id="content">
                <% Controlador ctrl = Control.getCtrl();
                    String m = "";
                    ctrl.connect();
                    String action = request.getParameter("action");
                    String id = request.getParameter("studentId");
                    String nombre = request.getParameter("nombre");
                    String apellido = request.getParameter("apellido");
                    String usuario = request.getParameter("usuario");
                    String contrasena = request.getParameter("contrasena");
                    if (action.equalsIgnoreCase("Add")) {
                        if (!ctrl.getMySql().consultaEstudiante(id)) {
                            ctrl.getMySql().InsertarEstudiante(id, nombre, apellido, usuario, contrasena);
                            out.println("El estudiante ha sido creado correctamente");
                            out.println("<button>");
                            out.println("<a href=index.html>volver al inicio</a>");
                            out.println("</button>");
                        } else {
                            String salida = "<h1>El estudiante ya esta registrado </h1>";
                            out.println(salida);
                            out.println("<button>");
                            out.println("<a href=index.html>volver al inicio</a>");
                            out.println("</button>");
                        }

                    } else if (action.equalsIgnoreCase("edit")) {
                        if (!ctrl.getMySql().consultaEstudiante(id)) {
                            String salida = "<h1>El estudiante no existe </h1>";
                            out.println(salida);
                            out.println("<button>");
                            out.println("<a href=index.html>volver al inicio</a>");
                            out.println("</button>");
                        } else {
                            ctrl.getMySql().editarEstudiante(id, nombre, apellido, usuario, contrasena);
                            out.println("El estudiante fue editado correctamente");
                            out.println(ctrl.getMySql().busquedaEstudiante(id));
                            out.println("<button>");
                            out.println("<a href=index.html>volver al inicio</a>");
                            out.println("</button>");
                        }
                    } else if (action.equalsIgnoreCase("Delete")) {
                        ctrl.getMySql().borrarEstudiante(id);
                        out.println("El estudiante fue eliminado correctamente");
                        out.println("<button>");
                        out.println("<a href=index.html>volver al inicio</a>");
                        out.println("</button>");
                    } else if (action.equalsIgnoreCase("Search")) {
                        out.println(ctrl.getMySql().busquedaEstudiante(id));
                        out.println("<button>");
                        out.println("<a href=index.html>volver al inicio</a>");
                        out.println("</button>");
                    }
                %>
            </section>
            <footer>
                Creadores: Estudiantes de la Univesidad de Cundinamarca &copy;2022
            </footer>
        </div>
    </body>
</html>
