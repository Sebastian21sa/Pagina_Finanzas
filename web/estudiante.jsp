<%-- 
    Document   : estudiante
    Created on : 26/10/2022, 10:36:41 AM
    Author     : Sebastian Sanchez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar</title>
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
            form{
                width: 100%;
                background: green;
                color: white;
                border: 1px solid black;
                text-align: center;
                line-height: 10px;
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
                <h1>Registro de estudiantes</h1>
            </header>
            <section id="content">
                <form action="financierojsp.jsp" method="POST">
                    <table>
                        <tr>
                            <td>Id estudiante</td>
                            <td><input type="text" name="studentId" /></td>
                        </tr>
                        <tr>
                            <td>Nombre</td>
                            <td><input type="text" name="nombre"/></td>
                        </tr>
                        <tr>
                            <td>Apellido</td>
                            <td><input type="text" name="apellido"/></td>
                        </tr>
                        <tr>
                            <td>Usuario</td>
                            <td><input type="text" name="usuario"/></td>
                        </tr>
                        <tr>
                            <td>Contraseña</td>
                            <td><input type="text" name="contrasena"/></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="submit" name="action" value="Add" />
                                <input type="submit" name="action" value="Edit" />
                                <input type="submit" name="action" value="Delete" />
                                <input type="submit" name="action" value="Search" />
                                <button>
                                    <a href="index.html">Volver</a>
                                </button>
                            </td>
                        </tr>
                    </table>
                </form>
            </section>
            <footer>
                Creadores: Estudiantes de la Univesidad de Cundinamarca &copy;2022
            </footer>
        </div>
    </body>
</html>
