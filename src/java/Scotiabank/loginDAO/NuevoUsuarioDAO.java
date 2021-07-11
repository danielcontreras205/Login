/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Scotiabank.loginDAO;

import ConexionSQL.ConexionSQL;
import Scotiabank.loginVO.NuevoUsuarioVO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Daniel Contreras
 */
public class NuevoUsuarioDAO {
    
        private String usuariovo;

    public NuevoUsuarioDAO(String usuariovo) {
        this.usuariovo = usuariovo;
    }
    
    public boolean Insertar(NuevoUsuarioVO NuevoUsuarioVO) throws SQLException, Exception {
        boolean exito = false; 
    ConexionSQL cc = new ConexionSQL();
    Connection cn = cc.Conectar();
        try {
            PreparedStatement pps = cn.prepareStatement("INSERT INTO persona (cedula,fecha_nacimiento,primer_nombre,segundo_nombre,primer_apellido,segundo_apellido,Telefono1,Telefono2) VALUES (?,?,?,?,?,?,?,?)");

            pps.setString(1, NuevoUsuarioVO.getCedula());
            pps.setString(2, NuevoUsuarioVO.getFechaNacimiento());
            pps.setString(3, NuevoUsuarioVO.getPriNombre());
            pps.setString(4, NuevoUsuarioVO.getSeguNombre());
            pps.setString(5, NuevoUsuarioVO.getPriApellido());
            pps.setString(6, NuevoUsuarioVO.getSegunApellido());
            pps.setString(7, NuevoUsuarioVO.getTel1());
            pps.setString(8, NuevoUsuarioVO.getTel2());
            
            pps.executeUpdate();
            exito = true;

            System.out.println("insertar" + exito);

        } catch (SQLException ex) {
            System.out.println("insertar" + ex);
        } 
        return exito;
    }
}
