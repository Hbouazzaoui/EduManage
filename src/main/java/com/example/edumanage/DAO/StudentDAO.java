package com.example.edumanage.DAO;

import com.example.edumanage.Model.Student;

import java.sql.*;

public class StudentDAO {
    private Connection connection;

    public StudentDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/etud_cours", "root", "");

            if (this.connection == null) {
                throw new SQLException("Failed to establish database connection!");
            }
            try (Statement statement = connection.createStatement()) {
                String createTableSQL = "CREATE TABLE IF NOT EXISTS etudiant (" +
                        "id INT AUTO_INCREMENT PRIMARY KEY, " +
                        "nom VARCHAR(100) NOT NULL, " +
                        "prenom VARCHAR(100) NOT NULL, " +
                        "email VARCHAR(255) NOT NULL, " +
                        "date_naissance DATE  NOT NULL, " +
                        ");";

                statement.executeUpdate(createTableSQL);
                System.out.println("Table 'person' created successfully");
            }

        } catch (ClassNotFoundException e) {
            System.err.println("MySQL JDBC Driver not found!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Database connection error: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public void AddStudent(Student student){
        if (connection == null) {
            System.err.println("Database connection is not initialized!");
            return;
        }
        String query = "INSERT INTO etudiant(nom, prenom, email, date_naissance) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, student.getNom());
            stmt.setString(2, student.getPrenom());
            stmt.setString(3, student.getEmail());
            stmt.setString(4, student.getDate_naissance());
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error inserting person: " + e.getMessage());
            e.printStackTrace();
        }
    }


    }
