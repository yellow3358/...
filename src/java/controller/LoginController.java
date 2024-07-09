/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import dal.UserDBContext;
import entity.User;

/**
 *
 * @author nocol
 */
@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        UserDBContext dbUser = new UserDBContext();
        User user = dbUser.getUserByUsernameAndPassword(username, password);
        if (user == null) {
            req.setAttribute("message", "Wrong email or password");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        } else {
            req.getSession().removeAttribute("user");
            req.getSession().setAttribute("user", user);
            if(user.getIsAdmin() == 0){
                resp.sendRedirect("regisListUser");
            }else{
                resp.sendRedirect("regisListAdmin");
            }
        }
    }

}
