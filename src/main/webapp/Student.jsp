<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.edumanage.Model.Student" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Information Table</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .container { max-width: 900px; }
        .table-container { background: #ffffff; padding: 20px; border-radius: 10px; box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1); }
        .table th { background-color: #007bff; color: white; }
        .table-hover tbody tr:hover { background-color: #f1f1f1; }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="table-container">
        <h2 class="text-center mb-4">Student Information</h2>
        <table class="table table-hover table-bordered text-center">
            <thead>
            <tr>
                <th>Nom</th>
                <th>Prénom</th>
                <th>Date de Naissance</th>
                <th>Email</th>
                <th>Cours</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Student> studentList = (List<Student>) request.getAttribute("liststudent");
                if (studentList != null) {
                    for (Student student : studentList) {
            %>
            <tr>
                <td><%= student.getNom() %></td>
                <td><%= student.getPrenom() %></td>
                <td><%= student.getDate_naissance() %></td>
                <td><%= student.getEmail() %></td>
                <td><!-- Ajouter les cours ici --></td>
            </tr>
            <%
                    }
                }
            %>
            </tbody>
        </table>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>