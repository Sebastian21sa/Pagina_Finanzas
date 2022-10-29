<%-- 
    Document   : datos
    Created on : 26/10/2022, 03:03:18 PM
    Author     : Sebastian Sanchez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controlador.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos</title>
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
                <h1>Herramientas Economia</h1>
            </header>
            <section id="content">
                <% Controlador ctrl = Control.getCtrl();
                    String m = "";
                    ctrl.connect();
                    String action = request.getParameter("action");
                    String ingresos = request.getParameter("ingresos");
                    String egresos = request.getParameter("egresos");
                    String ahorros = request.getParameter("ahorros");
                    int ing = Integer.parseInt(ingresos);
                    int gas = Integer.parseInt(egresos);
                    int aho = Integer.parseInt(ahorros);

                    String id_estudiante = request.getParameter("id_estudiante");
                    String id = request.getParameter("id");
                    if (action.equalsIgnoreCase("Add")) {
                        if (!ctrl.getMySql().validarEconomia(id)) {
                            ctrl.getMySql().InsertarEconomia(id, ingresos, egresos, ahorros, id_estudiante);
                            out.println("Economia creada con exito");
                            String salida = "<br>" + ctrl.getMySql().busquedaEconomia(id_estudiante);
                            out.println("<br>" + salida + "<br>");
                            if (gas < (ing * 0.6)) {
                                out.println("<br> Tus finanzas son estables por el momento, gastas menos del 60% de tus ingresos, procura no incrementar tus gastos.");
                            } else if (gas >= (ing * 0.6) && gas < (ing * 0.8)) {
                                out.println("<br> Usuario con cuidado tus gastos son mas del 60% y menor de tu 80% de tus ingresos, recuerda que debes dejar parte de tu dinero por emergencias, PROCURA mantenerte de la misma manera");
                            } else if (gas >= (ing * 0.8) && gas <= (ing)) {
                                out.println("<br> Usuario estas gastando mas del 80% de tu dinero,aunque no estas quedando en numeros rojos ya que no gastas mas de tus ingresos igualmente debes tener MUCHO cuidado");
                            } else if (gas > ing) {
                                out.println("<br> Usuario estas quedando en numeros rojos, estas gastando mas de lo que ganas y por ende estas quedando en quiebra, DEBES empezar a buscar una alternativa para equilibrar tus finanzas");
                            }
                            if (aho > (ing * 0.6)) {
                                out.println("<br> Muy bien usuario estas ahorrando mas del 60% de tus ingresos, procura invertir ese dinero, para incrementarlo.");
                            } else if (aho <= (ing * 0.4)) {
                                out.println("<br> Super usuario estas ahorrando eso es un gran merito");
                            } else if (aho == 0) {
                                out.println("<br> Oye usuario procura empezar ahorra asi sea un poco, para que tengas dinero para tus emergencias");
                            }
                            out.println("<button>");
                            out.println("<a href=index.html>aceptar</a>");
                            out.println("</button>");
                        } else {
                            String salida = "<br> <h1>La economia ya esta registrada</h1>";
                            out.println(salida);
                            out.println("<button>");
                            out.println("<a href=index.html>aceptar</a>");
                            out.println("</button>");
                        }

                    } else if (action.equalsIgnoreCase("Edit")) {
                        if (ctrl.getMySql().validarEconomia(id)) {
                            ctrl.getMySql().editarEconomia(id, ingresos, egresos, ahorros);
                            out.println("<br> Se edito la economia correctamente");
                            out.println("<br>" + ctrl.getMySql().encontrarEconomia(id) + "<br>");
                            out.println("<button>");
                            out.println("<a href=index.html>volver al inicio</a>");
                            out.println("</button>");
                        } else {
                            out.println("<br> La economia no existe");
                            out.println("<button>");
                            out.println("<a href=index.html>volver al inicio</a>");
                            out.println("</button>");
                        }
                    } else if (action.equalsIgnoreCase("delete")) {
                        ctrl.getMySql().borrarEconomia(id);
                        out.println("<br> La economia fue eliminada correctamente");
                        out.println("<button>");
                        out.println("<a href=index.html>volver al inicio</a>");
                        out.println("</button>");
                    } else if (action.equalsIgnoreCase("Search")) {
                        out.println("<br>" + ctrl.getMySql().encontrarEconomia(id) + "<br>");
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
