<%--
  Created by IntelliJ IDEA.
  User: Fatima ezzahra
  Date: 2/19/2025
  Time: 11:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<div class="container mt-5">
    <h1 class="text-center mb-4">EduManage</h1>
    <div class="row">
        <!-- Carte 1 -->
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">John Doe</h5>
                    <p class="card-text"><strong>Prénom:</strong> John</p>
                    <p class="card-text"><strong>Date de Naissance:</strong> 1990-05-15</p>
                    <p class="card-text"><strong>Email:</strong> john.doe@example.com</p>
                    <p class="card-text"><strong>Cours:</strong> Mathématiques</p>
                </div>
            </div>
        </div>

        <!-- Carte 2 -->
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Jane Smith</h5>
                    <p class="card-text"><strong>Prénom:</strong> Jane</p>
                    <p class="card-text"><strong>Date de Naissance:</strong> 1992-08-25</p>
                    <p class="card-text"><strong>Email:</strong> jane.smith@example.com</p>
                    <p class="card-text"><strong>Cours:</strong> Physique</p>
                </div>
            </div>
        </div>

        <!-- Carte 3 -->
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Chris Brown</h5>
                    <p class="card-text"><strong>Prénom:</strong> Chris</p>
                    <p class="card-text"><strong>Date de Naissance:</strong> 1991-03-30</p>
                    <p class="card-text"><strong>Email:</strong> chris.brown@example.com</p>
                    <p class="card-text"><strong>Cours:</strong> Chimie</p>
                </div>
            </div>
        </div>

        <!-- Ajoutez plus de cartes ici -->
    </div>
</div>

<!-- Bootstrap JS et dépendances -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
