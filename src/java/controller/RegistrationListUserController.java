/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.RegistrationDBContext;
import entity.Registration;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 *
 * @author nocol
 */
@WebServlet(name = "RegistrationListUserController", urlPatterns = {"/regisListUser"})
public class RegistrationListUserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null || user.getIsAdmin() == 1) {
            req.setAttribute("message", "You need to login with user account");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }

        RegistrationDBContext dbRegis = new RegistrationDBContext();
        ArrayList<Registration> regises = dbRegis.listRegistrationByUsername(user.getUsername());
        req.setAttribute("regises",regises);
        req.getRequestDispatcher("registration-list-user.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

}
