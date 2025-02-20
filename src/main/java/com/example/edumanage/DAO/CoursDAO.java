package com.example.edumanage.DAO;

import com.example.edumanage.Model.Cours;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CoursDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/etud_cours";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    public CoursDAO() {}

    // Méthode pour établir la connexion à la base de données
    protected Connection getConnection() throws SQLException {
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    // Ajouter un cours
    public void addCours(Cours cours) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_COURS_SQL)) {
            preparedStatement.setString(1, cours.getTitle());
            preparedStatement.setString(2, cours.getDescription());
            preparedStatement.setInt(3, cours.getDuration());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Erreur lors de l'ajout du cours: " + e.getMessage());
        }
    }

    // Récupérer un cours par ID
    public Cours getCoursById(int id) {
        Cours cours = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_COURS_BY_ID)) {
            preparedStatement.setInt(1, id);
            try (ResultSet rs = preparedStatement.executeQuery()) {
                if (rs.next()) {
                    String title = rs.getString("title");
                    String description = rs.getString("description");
                    int duration = rs.getInt("duration");
                    cours = new Cours(id, title, description, duration);
                }
            }
        } catch (SQLException e) {
            System.out.println("Erreur lors de la récupération du cours: " + e.getMessage());
        }
        return cours;
    }

    // Récupérer tous les cours
    public List<Cours> getAllCours() {
        List<Cours> coursList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_COURS);
             ResultSet rs = preparedStatement.executeQuery()) {
            while (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("title");
                String description = rs.getString("description");
                int duration = rs.getInt("duration");
                coursList.add(new Cours(id, title, description, duration));
            }
        } catch (SQLException e) {
            System.out.println("Erreur lors de la récupération des cours: " + e.getMessage());
        }
        return coursList;
    }

    // Mettre à jour un cours.
    public void updateCours(Cours cours) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_COURS_SQL)) {
            preparedStatement.setString(1, cours.getTitle());
            preparedStatement.setString(2, cours.getDescription());
            preparedStatement.setInt(3, cours.getDuration());
            preparedStatement.setInt(4, cours.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Erreur lors de la mise à jour du cours: " + e.getMessage());
        }
    }

    // Supprimer un cours
    public void deleteCours(int id) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_COURS_SQL)) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Erreur lors de la suppression du cours: " + e.getMessage());
        }
    }
}
