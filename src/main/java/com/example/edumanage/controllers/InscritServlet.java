package com.example.edumanage.controllers;

import com.example.edumanage.DAO.StudentCourseDAO;
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
import java.util.List;

@WebServlet("/enroll-student")
public class InscritServlet extends HttpServlet {
    private StudentCourseDAO studentCourseDAO;
    private StudentDAO studentDAO;
    private CoursDAO coursDAO;

    @Override
    public void init() {
        studentCourseDAO = new StudentCourseDAO();
        studentDAO = new StudentDAO();
        coursDAO = new CoursDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer la liste des étudiants et des cours
        List<Student> students = studentDAO.getAllStudents();
        List<Cours> courses = coursDAO.getAllCours();

        request.setAttribute("students", students);
        request.setAttribute("courses", courses);

        // Afficher la page JSP
        request.getRequestDispatcher("enrollStudent.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        int courseId = Integer.parseInt(request.getParameter("courseId"));

        // Enregistrer l'inscription dans la base de données
        studentCourseDAO.enrollStudentInCourse(studentId, courseId);

        // Rediriger vers une page de confirmation ou la liste des inscriptions
        response.sendRedirect("enrolled-students");
    }
}