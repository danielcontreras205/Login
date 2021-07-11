/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Scotiabank.loginVO;
import java.sql.Timestamp;

/**
 *
 * @author Daniel Contreras
 */
public class NuevoUsuarioVO {
    private String usuariprin;
    private String Cedula;
    private String FechaNacimiento;
    private String PriNombre;
    private String SeguNombre;
    private String PriApellido;
    private String SegunApellido;
    private String Tel1;
    private String Tel2;

    public String getCedula() {
        return Cedula;
    }

    public void setCedula(String Cedula) {
        this.Cedula = Cedula;
    }

    public String getFechaNacimiento() {
        return FechaNacimiento;
    }

    public void setFechaNacimiento(String FechaNacimiento) {
        this.FechaNacimiento = FechaNacimiento;
    }

    public String getPriNombre() {
        return PriNombre;
    }

    public void setPriNombre(String PriNombre) {
        this.PriNombre = PriNombre;
    }

    public String getSeguNombre() {
        return SeguNombre;
    }

    public void setSeguNombre(String SeguNombre) {
        this.SeguNombre = SeguNombre;
    }

    public String getPriApellido() {
        return PriApellido;
    }

    public void setPriApellido(String PriApellido) {
        this.PriApellido = PriApellido;
    }

    public String getSegunApellido() {
        return SegunApellido;
    }

    public void setSegunApellido(String SegunApellido) {
        this.SegunApellido = SegunApellido;
    }
    
    public String getTel1() {
        return Tel1;
    }

    public void setTel1(String Tel1) {
        this.Tel1 = Tel1;
    }

    public String getTel2() {
        return Tel2;
    }

    public void setTel2(String Tel2) {
        this.Tel2 = Tel2;
    }


    public String getUsuariprin() {
        return usuariprin;
    }

    public void setUsuariprin(String usuariprin) {
        this.usuariprin = usuariprin;
    }
    
}
