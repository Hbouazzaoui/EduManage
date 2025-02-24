package com.example.edumanage.DAO;

import com.example.edumanage.Model.Cours;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CoursDAO {
    private Connection connection;

    public CoursDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/etud_cours", "root", "");

            System.out.println("Connected to database");

            // Create table if it doesn't exist
            String createTableSQL = "CREATE TABLE IF NOT EXISTS Cours ("
                    + "id INT AUTO_INCREMENT PRIMARY KEY, "
                    + "Title VARCHAR(255) NOT NULL, "
                    + "Description VARCHAR(255) NOT NULL, "
                    + "Duration INT NOT NULL "
                    + ")";

            try (Statement statement = connection.createStatement()) {
                statement.executeUpdate(createTableSQL);
                System.out.println("Table 'Cours' is ready.");
            }

        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Database connection error: " + e.getMessage());
            e.printStackTrace();
        }
    }

    // Add new course
    public void addCours(Cours cours) {
        String query = "INSERT INTO Cours (Title, Description, Duration) VALUES (?, ?, ?)";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, cours.getTitle());
            preparedStatement.setString(2, cours.getDescription());
            preparedStatement.setInt(3, cours.getDuration());
            preparedStatement.executeUpdate();
            System.out.println("Cours ajouté avec succès !");
        } catch (SQLException e) {
            System.out.println("Erreur lors de l'ajout du cours: " + e.getMessage());
        }
    }

    // Get course by ID
    public Cours getCoursById(int id) {
        Cours cours = null;
        String query = "SELECT * FROM Cours WHERE id = ?";

        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    cours = new Cours(
                            rs.getInt("id"),
                            rs.getString("Title"),
                            rs.getString("Description"),
                            rs.getInt("Duration")
                    );
                }
            }
        } catch (SQLException e) {
            System.out.println("Erreur lors de la récupération du cours: " + e.getMessage());
        }
        return cours;
    }

    // Get all courses
    public List<Cours> getAllCours() {
        List<Cours> listCours = new ArrayList<>();
        String query = "SELECT * FROM Cours";

        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Cours cours = new Cours(
                        rs.getInt("id"),
                        rs.getString("Title"),
                        rs.getString("Description"),
                        rs.getInt("Duration")
                );
                listCours.add(cours);
            }
        } catch (SQLException e) {
            System.out.println("Erreur lors de la récupération des cours: " + e.getMessage());
        }
        return listCours;
    }

    // Update course
    public void updateCours(Cours cours) {
        String query = "UPDATE Cours SET Title = ?, Description = ?, Duration = ? WHERE id = ?";

        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, cours.getTitle());
            stmt.setString(2, cours.getDescription());
            stmt.setInt(3, cours.getDuration());
            stmt.setInt(4, cours.getId());
            stmt.executeUpdate();
            System.out.println("Cours mis à jour avec succès !");
        } catch (SQLException e) {
            System.out.println("Erreur lors de la mise à jour du cours: " + e.getMessage());
        }
    }

    // Delete course
    public void deleteCours(int id) {
        String query = "DELETE FROM Cours WHERE id = ?";

        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
            System.out.println("Cours supprimé avec succès !");
        } catch (SQLException e) {
            System.out.println("Erreur lors de la suppression du cours: " + e.getMessage());
        }
    }
}