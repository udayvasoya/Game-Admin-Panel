package model;

public class Admin_login {
    private String adminname;
    private String password;

    public Admin_login(String adminname, String password) {
        this.adminname = adminname;
        this.password = password;
    }

    public String getAdminname() {
        return adminname;
    }

    public void setAdminname(String adminname) {
        this.adminname = adminname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
