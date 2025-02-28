package com.example.edumanage.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("Login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");


        if("admin".equals(username) && "123".equals(password)){
        HttpSession session = req.getSession();
        session.setAttribute("isLoggedin", true);
        session.setAttribute("username", username);
            response.sendRedirect("index.jsp");
        }else{
            response.sendRedirect("Login.jsp?error=true");
        }
    }
}
