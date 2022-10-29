<%-- 
    Document   : listado
    Created on : 26/10/2022, 11:04:27 AM
    Author     : Sebastian Sanchez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingreso Economia</title>
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
                <h1>Llena tu economia</h1>
            </header>
            <section id="content">
                <form action="datos.jsp" method="POST">
                    <table>
                        <tr>
                            <td>Id:</td>
                            <td><input type="text" name="id" /></td>
                        </tr>
                        <tr>
                            <td>Ingresos recibidos:</td>
                            <td><input type="text" name="ingresos" /></td>
                        </tr>
                        <tr>
                            <td>Gastos:</td>
                            <td><input type="text" name="egresos"/></td>
                        </tr>
                        <tr>
                            <td>Ahorros realizados:</td>
                            <td><input type="text" name="ahorros"/></td>
                        </tr>
                        <tr>
                            <td>Id del estudiante:</td>
                            <td><input type="text" name="id_estudiante" /></td>
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
