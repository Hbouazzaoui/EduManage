package com.example.edumanage.DAO;

import com.example.edumanage.Model.Cours;
import com.example.edumanage.Model.Student;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentCourseDAO {
    private Connection connection;

    public StudentCourseDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/etud_cours", "root", "");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Assigner un cours à un étudiant
    public void enrollStudentInCourse(int studentId, int courseId) {
        String query = "INSERT INTO student_courses (student_id, course_id) VALUES (?, ?)";

        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, studentId);
            stmt.setInt(2, courseId);
            stmt.executeUpdate();
            System.out.println("Étudiant inscrit au cours avec succès !");
        } catch (SQLException e) {
            System.out.println("Erreur lors de l'inscription de l'étudiant: " + e.getMessage());
        }
    }

    // Récupérer les cours d'un étudiant
    public List<Cours> getCoursesByStudentId(int studentId) {
        List<Cours> courses = new ArrayList<>();
        String query = "SELECT c.* FROM cours c JOIN student_courses sc ON c.id = sc.course_id WHERE sc.student_id = ?";

        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, studentId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Cours course = new Cours(rs.getInt("id"), rs.getString("titre"), rs.getString("description"), rs.getInt("duree"));
                    courses.add(course);
                }
            }
        } catch (SQLException e) {
            System.out.println("Erreur lors de la récupération des cours: " + e.getMessage());
        }
        return courses;
    }

    // Récupérer les étudiants inscrits à un cours
    public List<Student> getStudentsByCourseId(int courseId) {
        List<Student> students = new ArrayList<>();
        String query = "SELECT e.* FROM etudiant e JOIN student_courses sc ON e.id = sc.student_id WHERE sc.course_id = ?";

        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, courseId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Student student = new Student(rs.getInt("id"), rs.getString("nom"), rs.getString("prenom"), rs.getString("email"), rs.getDate("date_naissance"));
                    students.add(student);
                }
            }
        } catch (SQLException e) {
            System.out.println("Erreur lors de la récupération des étudiants: " + e.getMessage());
        }
        return students;
    }
}
