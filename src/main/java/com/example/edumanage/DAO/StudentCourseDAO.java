//package com.example.edumanage.DAO;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.SQLException;
//import java.sql.Statement;
//
//public class StudentCourseDAO {
//    private Connection connection;
//
//    public StudentCourseDAO() {
//        this.connection = DatabaseConnection.getConnection();
//        createTableIfNotExists();
//    }
//
//    // create Table If Not Exists
//    private void createTableIfNotExists() {
//        String createTableSQL = "CREATE TABLE IF NOT EXISTS StudentCourses ("
//                + "student_id INT, "
//                + "course_id INT, "
//                + "PRIMARY KEY (student_id, course_id), "
//                + "FOREIGN KEY (student_id) REFERENCES Students(id), "
//                + "FOREIGN KEY (course_id) REFERENCES Courses(id)"
//                + ")";
//
//        try (Statement stmt = connection.createStatement()) {
//            stmt.executeUpdate(createTableSQL);
//            System.out.println("Table 'StudentCourses' is ready.");
//        } catch (SQLException e) {
//            System.out.println("Erreur lors de la création de la table StudentCourses: " + e.getMessage());
//        }
//    }
//
//    // enroll Student In Course
//    public void enrollStudentInCourse(int studentId, int courseId) {
//        String query = "INSERT INTO StudentCourses (student_id, course_id) VALUES (?, ?)";
//
//        try (PreparedStatement stmt = connection.prepareStatement(query)) {
//            stmt.setInt(1, studentId);
//            stmt.setInt(2, courseId);
//            stmt.executeUpdate();
//            System.out.println("Étudiant inscrit au cours avec succès !");
//        } catch (SQLException e) {
//            System.out.println("Erreur lors de l'inscription de l'étudiant: " + e.getMessage());
//        }
//    }
//}