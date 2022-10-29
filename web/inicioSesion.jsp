<%-- 
    Document   : inicioSesion
    Created on : 26/10/2022, 10:57:59 AM
    Author     : Sebastian Sanchez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio sesion</title>
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
                height: 100%;
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
                text-align: center;
                line-height: 10px;
            }
            form{
                background: green;
                color: white;
                text-align: center;
                border: 1px solid black;
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
                <h1>INICIO DE SESION</h1>
            </header>
            <section id="content">
                <form action="economia.jsp" method="POST">
                    <table>
                        <tr>
                            <td>Usuario:</td>
                            <td><input type="text" name="usuario"></td>
                        </tr>
                        <tr>
                        <br>
                        <td>Contraseña:</td>
                        <td><input type="text" name="contrasena"></td>
                        </tr>
                        <td colspan="2">
                            <input type="submit" name="action" value="ingresar">
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
