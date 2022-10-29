/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controlador;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import mundo.Persistencia;

public class Controlador {

    private Persistencia mySql;

    public Controlador() {
        mySql = new Persistencia();
    }

    /* Metodos de comportamiento */
    public Connection connect() {
        return mySql.getPersis().connect();
    }

    public void update(String sql) throws SQLException {
        mySql.getPersis().update(sql);
    }

    public ResultSet select(String sql) throws SQLException {
        return mySql.getPersis().select(sql);
    }

    public void closeConnection() throws SQLException {
        mySql.getPersis().closeConnection();
    }

    public Persistencia getMySql() {
        return mySql;
    }

}
