<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.edumanage.Model.Student" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cartes des Étudiants</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Style personnalisé pour les cartes */
        .card {
            margin-bottom: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
        }
        .card:hover {
            transform: scale(1.05);
        }
        .card-title {
            font-size: 1.25rem;
            font-weight: bold;
        }
        .card-text {
            font-size: 0.9rem;
            color: #555;
        }
    </style>
</head>
<body>

<a href="Student/">aaaaaaaaa</a>
<a href="cours">aaaaaaaaa</a>
<div class="container mt-5">
    <h1 class="text-center mb-4">EduManage</h1>
    <div class="row">
        <%
            // Retrieve the list of students from the request attribute
            List<Student> studentList = (List<Student>) request.getAttribute("liststudent");
            if (studentList != null && !studentList.isEmpty()) {
                for (Student student : studentList) {
        %>
        <!-- Carte pour chaque étudiant -->
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">
                        <a href="Student/edit?id=<%= student.getId() %>"><%= student.getNom() %></a>
                    </h5>
                    <p class="card-text"><strong>Prénom:</strong> <%= student.getPrenom() %></p>
                    <p class="card-text"><strong>Date de Naissance:</strong> <%= student.getDate_naissance() %></p>
                    <p class="card-text"><strong>Email:</strong> <%= student.getEmail() %></p>
                    <p class="card-text"><strong>Cours:</strong> Mathématiques</p> <!-- Replace with actual course data if available -->
                </div>
            </div>
        </div>
        <%
            }
        } else {
        %>
        <!-- Message si aucun étudiant n'est disponible -->
        <div class="col-12 text-center">
            <p>Aucun étudiant disponible.</p>
        </div>
        <%
            }
        %>
    </div>
</div>

<!-- Bootstrap JS et dépendances -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>