/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Scotiabank.loginVO;

/**
 *
 * @author Daniel Contreras
 */
public class NuevoLoginVO {
    private String Correo;
    private String Password;
    private String Password2;
    private String Cedula;

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getPassword2() {
        return Password2;
    }

    public void setPassword2(String Password2) {
        this.Password2 = Password2;
    }

    public String getCedula() {
        return Cedula;
    }

    public void setCedula(String Cedula) {
        this.Cedula = Cedula;
    }
}
