package com.example.edumanage.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import com.example.edumanage.DAO.CoursDAO;
import com.example.edumanage.Model.Cours;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/cours")
public class CoursServlet extends HttpServlet {
    private CoursDAO CoursDAO;

    @Override
    public void init() {
        CoursDAO = new CoursDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "new":
                showNewForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteCours(request, response);
                break;
            default:
                listCours(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "insert";
        }

        switch (action) {
            case "insert":
                insertCours(request, response);
                break;
            case "update":
                updateCours(request, response);
                break;
            default:
                response.sendRedirect("cours");
                break;
        }
    }

    private void listCours(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Cours> listCours = CoursDAO.getAllCours();
        request.setAttribute("coursList", listCours);
        request.getRequestDispatcher("listCours.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("createCoursForm.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Cours existingCours = CoursDAO.getCoursById(id);
        request.setAttribute("cours", existingCours);
        request.getRequestDispatcher("updateCoursForm.jsp").forward(request, response);
    }

    private void insertCours(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        int duration = Integer.parseInt(request.getParameter("duration"));

        Cours newCours = new Cours(title, description, duration);
        CoursDAO.addCours(newCours);
        response.sendRedirect("cours");
    }

    private void updateCours(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        int duration = Integer.parseInt(request.getParameter("duration"));

        Cours cours = new Cours(id, title, description, duration);
        CoursDAO.updateCours(cours);
        response.sendRedirect("cours");
    }

    private void deleteCours(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        CoursDAO.deleteCours(id);
        response.sendRedirect("cours");
    }
}

