<%--
  Created by IntelliJ IDEA.
  User: Dev
  Date: 2/19/2025
  Time: 10:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.edumanage.Model.Cours" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Cours</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
        }
        .card {
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
        }
        .card:hover {
            transform: scale(1.02);
        }
        .btn-custom {
            background-color: #007bff;
            color: white;
            border-radius: 5px;
        }
        .btn-custom:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <h3 class="text-center mb-4"><i class="fas fa-book"></i> Liste des Cours</h3>

    <div class="row">
        <%
            List<Cours> coursList = (List<Cours>) request.getAttribute("coursList");
            if (coursList != null && !coursList.isEmpty()) {
                for (Cours cours : coursList) {
        %>
        <div class="col-md-4 mb-4">
            <div class="card p-3">
                <div class="card-body">
                    <h5 class="card-title"><i class="fas fa-chalkboard-teacher"></i> <%= cours.getTitle() %></h5>
                    <p class="card-text"><%= cours.getDescription() %></p>
                    <p><i class="fas fa-clock"></i> Durée: <strong><%= cours.getDuration() %>h</strong></p>
                    <a href="editCours?id=<%= cours.getId() %>" class="btn btn-warning btn-sm"><i class="fas fa-edit"></i> Modifier</a>
                    <a href="deleteCours?id=<%= cours.getId() %>" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i> Supprimer</a>
                </div>
            </div>
        </div>
        <%
            }
        } else {
        %>
        <div class="col-12 text-center">
            <p class="text-muted">Aucun cours disponible.</p>
        </div>
        <%
            }
        %>
    </div>

    <div class="text-center mt-4">
        <a href="createCoursForm.jsp" class="btn btn-custom"><i class="fas fa-plus"></i> Ajouter un Cours</a>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
