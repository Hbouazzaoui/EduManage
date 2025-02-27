package com.example.edumanage.controllers;

import com.example.edumanage.DAO.StudentDAO;
import com.example.edumanage.DAO.CoursDAO;
import com.example.edumanage.Model.Student;
import com.example.edumanage.Model.Cours;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/enroll")
public class StudentCourseServlet extends HttpServlet {
    private StudentDAO studentDAO;
    private CoursDAO courseDAO;

    @Override
    public void init() throws ServletException {
        studentDAO = new StudentDAO();
        courseDAO = new CoursDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer la liste des étudiants et des cours
        List<Student> students = null;
        try {
            students = studentDAO.selectAllUsers();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        List<Cours> courses = courseDAO.getAllCours();

        // Envoyer les listes à la JSP
        request.setAttribute("students", students);
        request.setAttribute("courses", courses);

        // Redirection vers la page JSP
        request.getRequestDispatcher("enrollStudent.jsp").forward(request, response);
    }
}
