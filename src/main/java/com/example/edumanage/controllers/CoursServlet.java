package com.example.edumanage.controllers;

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
    private CoursDAO coursDAO;

    @Override
    public void init() {
        coursDAO = new CoursDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) action = "list";

        switch (action) {
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

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Cours existingCours = coursDAO.getCoursById(id);
        request.setAttribute("cours", existingCours);
        request.getRequestDispatcher("listCours.jsp").forward(request, response);
    }

    private void listCours(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Cours> listCours = coursDAO.getAllCours();
        request.setAttribute("listCours", listCours);
        request.getRequestDispatcher("listCours.jsp").forward(request, response);
    }

    private void deleteCours(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        coursDAO.deleteCours(id);
        response.sendRedirect("cours");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            int duration = Integer.parseInt(request.getParameter("duration"));

            Cours newCours = new Cours(title, description, duration);
            coursDAO.addCours(newCours);
        } else {
            int id = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            int duration = Integer.parseInt(request.getParameter("duration"));

            Cours cours = new Cours(id, title, description, duration);
            coursDAO.updateCours(cours);
        }

        response.sendRedirect("cours");
    }
}