/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.RegistrationDBContext;
import entity.Registration;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import entity.User;

/**
 *
 * @author nocol
 */
@WebServlet(name = "RegisterLicenseController", urlPatterns = {"/registerCar"})
public class RegisterLicenseController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null || user.getIsAdmin() == 1) {
            req.setAttribute("message", "You need to login with user account");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
        req.getRequestDispatcher("registration-form.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
//        if (user != null || user.getIsAdmin() == 1) {
//            req.setAttribute("message", "You need to login with user account");
//            req.getRequestDispatcher("login.jsp").forward(req, resp);
//        }
//        String 
        String raw_fullname = req.getParameter("fullname");
        String raw_nameOfCar = req.getParameter("nameOfCar");
        RegistrationDBContext dbRegis = new RegistrationDBContext();
        Registration regis = new Registration();
        regis.setUsername(user);
        regis.setFullname(raw_fullname);
        regis.setNameOfCar(raw_nameOfCar);

        dbRegis.insert(regis);
        resp.sendRedirect("regisListUser");
    }

}
