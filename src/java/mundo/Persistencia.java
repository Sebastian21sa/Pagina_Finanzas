/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package mundo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Persistencia {

    private MySql persis;

    public Persistencia() {
        persis = new MySql();
    }

    public MySql getPersis() {
        return persis;
    }

    public boolean consultaEstudiante(String id) {
        String con = "";
        boolean estado = false;
        ResultSet rst;
        try {
            rst = persis.select("Select id from Estudiante where id='" + id + "'");
            while (rst.next()) {
                con += rst.getString("id");
            }
            if (con.equals(id)) {
                estado = true;
            }
        } catch (SQLException ex) {
            System.out.println("¡ERROR! consultEstado" + ex);
        }
        return estado;
    }

    public void InsertarEstudiante(String id, String nombre, String apellido, String usuario, String contrasena) throws SQLException {
        persis.update("insert into Estudiante (id, nombre, apellido, usuario, contraseña) values('" + id + "','" + nombre + "','" + apellido + "','" + usuario + "','" + contrasena + "')");
    }

    public boolean verificarContraseña(String usuario, String contraseña) {
        String con = "";
        boolean estado = false;
        ResultSet rst;
        try {
            rst = persis.select("Select contraseña from Estudiante where usuario='" + usuario + "'");
            while (rst.next()) {
                con += rst.getString("contraseña");
            }
            if (con.equals(contraseña)) {
                estado = true;
            }
        } catch (SQLException ex) {
            System.out.println("¡ERROR! consultEstado" + ex);
        }
        return estado;
    }

    public void InsertarEconomia(String id, String ingresos, String egresos, String ahorros, String id_estudiante) throws SQLException {
        persis.update("insert into Economia (id, ingresos, egresos, ahorros, id_estudiante) values('" + id + "','" + ingresos + "','" + egresos + "','" + ahorros + "','" + id_estudiante + "')");
    }

    public String busquedaEconomia(String id_estudiante) {
        String ingresos = "";
        String egresos = "";
        String ahorros = "";
        ResultSet rst;
        try {
            rst = persis.select("Select * from Economia where id_estudiante='" + id_estudiante + "'");
            while (rst.next()) {
                ingresos += rst.getString("ingresos");
                egresos += rst.getString("egresos");
                ahorros += rst.getString("ahorros");
            }
        } catch (SQLException ex) {
            System.out.println("¡ERROR! consultEstado" + ex);
        }
        return "id_estudiante: " + id_estudiante + "\n ingresos: " + ingresos + "\n egresos: " + egresos + "\n ahorros: " + ahorros;
    }

    public boolean existeEconomia(String id) {
        String con = "";
        boolean m = false;
        ResultSet rst;
        try {
            rst = persis.select("Select id_estudiante from Economia where id_estudiante='" + id + "'");
            while (rst.next()) {
                con += rst.getString("id_estudiante");
            }
            if (con.equalsIgnoreCase(id)) {
                m = true;
            }
        } catch (SQLException ex) {
            System.out.println("¡ERROR! consultEstado" + ex);
        }
        return m;
    }

    public String buscarEstudiante(String usuario) {
        String con = "";
        ResultSet rst;
        try {
            rst = persis.select("Select id from Estudiante where usuario='" + usuario + "'");
            while (rst.next()) {
                con += rst.getString("id");
            }
        } catch (SQLException ex) {
            System.out.println("¡ERROR! consultEstado" + ex);
        }
        return con;
    }

    public boolean validarEconomia(String id) {
        String con = "";
        boolean m = false;
        ResultSet rst;
        try {
            rst = persis.select("Select id from Economia where id='" + id + "'");
            while (rst.next()) {
                con += rst.getString("id");
            }
            if (con.equalsIgnoreCase(id)) {
                m = true;
            }
        } catch (SQLException ex) {
            System.out.println("¡ERROR! consultEstado" + ex);
        }
        return m;
    }

    public void editarEstudiante(String id, String nombre, String apellido, String usuario, String contrasena) throws SQLException {
        persis.update("UPDATE Estudiante SET nombre = '" + nombre + "' WHERE id = '" + id + "'");
        persis.update("UPDATE Estudiante SET apellido = '" + apellido + "' WHERE id = '" + id + "'");
        persis.update("UPDATE Estudiante SET usuario = '" + usuario + "' WHERE id = '" + id + "'");
        persis.update("UPDATE Estudiante SET contraseña = '" + contrasena + "' WHERE id = '" + id + "'");
    }

    public String busquedaEstudiante(String id) {
        String ids = "";
        String nombre = "";
        String apellido = "";
        String usuario = "";
        String contrasena = "";
        ResultSet rst;
        try {
            rst = persis.select("Select * from Estudiante where id='" + id + "'");
            while (rst.next()) {
                ids += rst.getString("id");
                nombre += rst.getString("nombre");
                apellido += rst.getString("apellido");
                usuario += rst.getString("usuario");
                contrasena += rst.getString("contraseña");
            }
        } catch (SQLException ex) {
            System.out.println("¡ERROR! consultEstado" + ex);
        }
        return "id: " + ids + "\n nombre: " + nombre + "\n apellido: " + apellido + "\n usuario: " + usuario + "\n contraseña: " + contrasena;
    }

    public void borrarEstudiante(String id) throws SQLException {
        persis.update("delete from Estudiante where id ='" + id + "'");
    }

    public void editarEconomia(String id, String ingresos, String egresos, String ahorros) throws SQLException {
        persis.update("UPDATE Economia SET ingresos = '" + ingresos + "' WHERE id = '" + id + "'");
        persis.update("UPDATE Economia SET egresos = '" + egresos + "' WHERE id = '" + id + "'");
        persis.update("UPDATE Economia SET ahorros = '" + ahorros + "' WHERE id = '" + id + "'");
    }

    public void borrarEconomia(String id) throws SQLException {
        persis.update("delete from Economia where id ='" + id + "'");
    }

    public String encontrarEconomia(String id) {
        String ingresos = "";
        String egresos = "";
        String ahorros = "";
        ResultSet rst;
        try {
            rst = persis.select("Select * from Economia where id='" + id + "'");
            while (rst.next()) {
                ingresos += rst.getString("ingresos");
                egresos += rst.getString("egresos");
                ahorros += rst.getString("ahorros");
            }
        } catch (SQLException ex) {
            System.out.println("¡ERROR! consultEstado" + ex);
        }
        return "id: " + id + "ingresos: " + ingresos + " egresos: " + egresos + "ahorros: " + ahorros;
    }

}
