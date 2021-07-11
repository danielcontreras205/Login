/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ConexionSQL;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;
import java.sql.SQLException;

public class ConexionSQL {

    public Connection getCon() {
        return con;
    }

    public void setCon(Connection con) {
        this.con = con;
    }
    private Connection con;
    public String db = "scotiabank";
    public String url = "jdbc:mysql://localhost/" + db;
    public String user = "root";
    public String pass = "";

    public Connection Conectar() {
        Connection link = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            link = DriverManager.getConnection(this.url, this.user, this.pass);
        } catch (Exception e) {

            JOptionPane.showMessageDialog(null, "Error de Conexion:\n1) Conecte xammp");
            System.out.println("Bien");
        }
        return link;
    }

    public Connection conexionMySql() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public Connection conexionPostgreSql() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
