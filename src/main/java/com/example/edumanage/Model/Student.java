package com.example.edumanage.Model;

import java.sql.Date;

public class Student {
    private int id;
    private String nom;
    private String prenom;
    private String email;
    private Date date_naissance;

    public Student(int id, String nom, String prenom, String email, Date date_naissance) {}

    public Student(String nom, String prenom, String email, Date date_naissance) {
        this.nom = nom;
        this.prenom = prenom;
        this.email = email;
        this.date_naissance = date_naissance;
    }

    public Student(String nom, String prenom, String email, String date_naissance) {
        this.nom = nom;
        this.prenom = prenom;
        this.email = email;
        this.date_naissance = Date.valueOf(date_naissance); // Convert String to SQL Date
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }

    public String getPrenom() { return prenom; }
    public void setPrenom(String prenom) { this.prenom = prenom; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public Date getDate_naissance() { return date_naissance; }
    public void setDate_naissance(Date date_naissance) { this.date_naissance = date_naissance; }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", nom='" + nom + '\'' +
                ", prenom='" + prenom + '\'' +
                ", email='" + email + '\'' +
                ", date_naissance='" + date_naissance + '\'' +
                '}';
    }
}
