/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Scotiabank.loginDAO;

import ConexionSQL.ConexionSQL;
import Scotiabank.loginVO.NuevoLoginVO;
import Scotiabank.loginVO.NuevoUsuarioVO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Daniel Contreras
 */
public class NuevoLoginDAO {
            private String usuariovo;

    public NuevoLoginDAO(String usuariovo) {
        this.usuariovo = usuariovo;
    }
    
    public boolean Insertar(NuevoLoginVO NuevoLoginVO) throws SQLException, Exception {
    boolean exito = false; 
    ConexionSQL cc = new ConexionSQL();
    Connection cn = cc.Conectar();
        try {
            PreparedStatement pps = cn.prepareStatement("INSERT INTO login (cedula_persona,correo,password) VALUES (?,?,?)");

            pps.setString(1, NuevoLoginVO.getCedula());
            pps.setString(2, NuevoLoginVO.getCorreo());
            pps.setString(3, NuevoLoginVO.getPassword());
            
            pps.executeUpdate();
            exito = true;

            System.out.println("insertar" + exito);

        } catch (SQLException ex) {
            System.out.println("insertar" + ex);
        } 
        return exito;
    }
    
    public List<NuevoLoginVO> ListaPersona(String correo, String password) throws Exception {
        boolean exito = false;
        List<NuevoLoginVO> lista = null;
        ConexionSQL ManejadorConexiones = new ConexionSQL();
        ConexionSQL Conexion = (ConexionSQL) ManejadorConexiones.Conectar();
        StringBuilder sql = new StringBuilder();
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try{
            
        sql.append("SELECT * FROM login log WHERE log.correo ='").append(correo).append("' and log.password = '").append(password).append("'"); 

            ps = Conexion.getCon().prepareStatement(sql.toString());
            rs = ps.executeQuery();
            if (rs.isBeforeFirst()) {
                lista = new ArrayList<NuevoLoginVO>();
                while (rs.next()) {
                    NuevoLoginVO NuevoLoginVO = new NuevoLoginVO();
                    NuevoLoginVO.setCedula(rs.getString("cedula_persona"));
                    NuevoLoginVO.setCorreo(rs.getString("correo"));
                    NuevoLoginVO.setPassword(rs.getString("password"));
                    
                    
                    lista.add(NuevoLoginVO);
                    exito = true;
                }
            }
        }
        catch (SQLException ex) {
            System.out.println("insertar" + ex);
        } 
        return lista;
    }
    
        public boolean buscar(String correo, String password) throws Exception {
        
        NuevoLoginVO consulta = null;
        boolean exito = false; 
        
        ConexionSQL cc = new ConexionSQL();
        Connection cn = cc.Conectar();
        String cap = " ";
        String sql = "SELECT per.* FROM persona per, login log WHERE log.correo ='"+ correo + "' and log.password = '" + password + "'";
        
        try{  
            List<NuevoUsuarioVO> lista = null;
            lista = new ArrayList<NuevoUsuarioVO>();                    
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            NuevoUsuarioVO NuevoUsuarioVO = new NuevoUsuarioVO();
            while (rs.next()) {
                cap = rs.getString("cedula");
                NuevoUsuarioVO.setCedula(rs.getString("cedula"));
                NuevoUsuarioVO.setFechaNacimiento(rs.getString("fecha_nacimiento"));
                NuevoUsuarioVO.setPriNombre(rs.getString("primer_nombre"));
                NuevoUsuarioVO.setSeguNombre(rs.getString("segundo_nombre"));
                NuevoUsuarioVO.setPriApellido(rs.getString("primer_apellido"));
                NuevoUsuarioVO.setSegunApellido(rs.getString("segundo_apellido"));
                NuevoUsuarioVO.setTel1(rs.getString("Telefono1"));
                NuevoUsuarioVO.setTel2(rs.getString("Telefono2"));
                lista.add(NuevoUsuarioVO);
                exito = true;
            }

        }
        catch (SQLException ex) {
            System.out.println("insertar" + ex);
        } 
        return exito;
    }
    public List<NuevoUsuarioVO> ListaPersona(String email) throws Exception {

        List<NuevoUsuarioVO> lista = null;
        ConexionSQL cc = new ConexionSQL();
        Connection cn = cc.Conectar();
        String cap = " ";
        String sql = "SELECT per.* FROM persona per, login log WHERE log.correo LIKE '%" + email + "%' and per.cedula = log.cedula_persona";
        NuevoUsuarioVO NuevoUsuarioVO = new NuevoUsuarioVO();

        try {
            lista = new ArrayList<NuevoUsuarioVO>();
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                NuevoUsuarioVO.setCedula(rs.getString("cedula"));
                NuevoUsuarioVO.setFechaNacimiento(rs.getString("fecha_nacimiento"));
                NuevoUsuarioVO.setPriNombre(rs.getString("primer_nombre"));
                NuevoUsuarioVO.setSeguNombre(rs.getString("segundo_nombre"));
                NuevoUsuarioVO.setPriApellido(rs.getString("primer_apellido"));
                NuevoUsuarioVO.setSegunApellido(rs.getString("segundo_apellido"));
                NuevoUsuarioVO.setTel1(rs.getString("Telefono1"));
                NuevoUsuarioVO.setTel2(rs.getString("Telefono2"));
                lista.add(NuevoUsuarioVO);
            }
        } catch (SQLException ex) {
            System.out.println("error " + ex.getMessage());
        }
        return lista;
    }
        
        
}
