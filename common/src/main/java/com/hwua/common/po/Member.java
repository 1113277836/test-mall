package com.hwua.common.po;

public class Member {
    private Integer id;
    private String username;
    private String password;
    private String idNumber;
    private String tel;
    private String status;
    private String isput;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getIdNumber() {
        return idNumber;
    }

    public void setIdNumber(String idNumber) {
        this.idNumber = idNumber;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getIsput() {
        return isput;
    }

    public void setIsput(String isput) {
        this.isput = isput;
    }

    @Override
    public String toString() {
        return "Member{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", idNumber='" + idNumber + '\'' +
                ", tel='" + tel + '\'' +
                ", status='" + status + '\'' +
                ", isput='" + isput + '\'' +
                '}';
    }
}
