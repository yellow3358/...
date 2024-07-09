/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import entity.User;
import java.sql.Date;

/**
 *
 * @author nocol
 */
public class Registration {

    private int id;
    private User username;
    private String fullname;
    private String nameOfCar;
    private String codeCar;
    private int accepted;
    private Date createdAt;

    public Registration() {
    }

    public Registration(int id, User username, String fullname, String nameOfCar, String licenseCar, Date createdAt) {
        this.id = id;
        this.username = username;
        this.fullname = fullname;
        this.nameOfCar = nameOfCar;
        this.codeCar = licenseCar;
        this.createdAt = createdAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUsername() {
        return username;
    }

    public void setUsername(User username) {
        this.username = username;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getNameOfCar() {
        return nameOfCar;
    }

    public void setNameOfCar(String nameOfCar) {
        this.nameOfCar = nameOfCar;
    }

    public String getCodeCar() {
        return codeCar;
    }

    public void setCodeCar(String codeCar) {
        this.codeCar = codeCar;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public int getAccepted() {
        return accepted;
    }

    public void setAccepted(int accepted) {
        this.accepted = accepted;
    }

}
