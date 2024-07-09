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

/**
 *
 * @author nocol
 */
@WebServlet(name = "EvaluteRegisController", urlPatterns = {"/evalute"})
public class EvaluteRegisController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RegistrationDBContext dbRegis = new RegistrationDBContext();
        String raw_id = req.getParameter("id");
        String raw_status = req.getParameter("status");
        try {
            int id = Integer.parseInt(raw_id);
            Registration regisExists = dbRegis.get(id);
            if (regisExists == null) {
                resp.sendRedirect("regisListAdmin");
            }
            int status = Integer.parseInt(raw_status);
            Registration regis = new Registration();
            regis.setId(id);
            if (status == 0) {
                status = -1;
            }
            regis.setAccepted(status);
            dbRegis.update(regis);
        } catch (Exception e) {
            resp.sendRedirect("regisListAdmin");
        }
        resp.sendRedirect("regisListAdmin");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RegistrationDBContext dbRegis = new RegistrationDBContext();
        String raw_status = req.getParameter("status");

        int status = -1;

    }

}
