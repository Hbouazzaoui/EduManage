
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
//    // Constructor
//    public StudentCourseDAO() {
//        this.connection = Connection.connection();
//        createTableIfNotExists();
//    }
//
//
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
//
//    public void unenrollStudentFromCourse(int studentId, int courseId) {
//        String query = "DELETE FROM StudentCourses WHERE student_id = ? AND course_id = ?";
//
//        try (PreparedStatement stmt = connection.prepareStatement(query)) {
//            stmt.setInt(1, studentId);
//            stmt.setInt(2, courseId);
//            stmt.executeUpdate();
//            System.out.println("Étudiant désinscrit du cours avec succès !");
//        } catch (SQLException e) {
//            System.out.println("Erreur lors de la désinscription de l'étudiant: " + e.getMessage());
//        }
//    }
//
//    public List<Cours> getCoursesByStudentId(int studentId) {
//        List<Cours> courses = new ArrayList<>();
//        String query = "SELECT c.* FROM Courses c " +
//                "JOIN StudentCourses sc ON c.id = sc.course_id " +
//                "WHERE sc.student_id = ?";
//
//        try (PreparedStatement stmt = connection.prepareStatement(query)) {
//            stmt.setInt(1, studentId);
//            try (ResultSet rs = stmt.executeQuery()) {
//                while (rs.next()) {
//                    Cours course = new Cours(
//                            rs.getInt("id"),
//                            rs.getString("title"),
//                            rs.getString("description")
//                    );
//                    courses.add(course);
//                }
//            }
//        } catch (SQLException e) {
//            System.out.println("Erreur lors de la récupération des cours: " + e.getMessage());
//        }
//        return courses;
//    }
//}
