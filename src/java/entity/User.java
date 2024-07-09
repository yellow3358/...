/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.Date;

/**
 *
 * @author nocol
 */
public class User {

    private String username;
    private String password;
    private String displayName;
    private String email;
    private Date dob;
    private String phoneNumber;
    private Date registedAt;
    private Date lastLogin;
    private int isAdmin;

    public User() {
    }

    public User(String username, String password, String displayName, String email, Date dob, String phoneNumber, Date registedAt, Date lastLogin) {
        this.username = username;
        this.password = password;
        this.displayName = displayName;
        this.email = email;
        this.dob = dob;
        this.phoneNumber = phoneNumber;
        this.registedAt = registedAt;
        this.lastLogin = lastLogin;
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

    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Date getRegistedAt() {
        return registedAt;
    }

    public void setRegistedAt(Date registedAt) {
        this.registedAt = registedAt;
    }

    public Date getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(Date lastLogin) {
        this.lastLogin = lastLogin;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

}
