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
@WebServlet(name = "RegistrationListAdminController", urlPatterns = {"/regisListAdmin"})
public class RegistrationListAdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RegistrationDBContext dbRegis = new RegistrationDBContext();
        User user = (User) req.getSession().getAttribute("user");
        if (user == null || user.getIsAdmin() == 0) {
            req.setAttribute("message", "You need to login with admin account");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }

        ArrayList<Registration> regises = dbRegis.list();
        req.setAttribute("regises", regises);
        req.getRequestDispatcher("registration-list-admin.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

}
