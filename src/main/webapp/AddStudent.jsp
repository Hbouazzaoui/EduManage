<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.edumanage.controllers.StudentServlet" %>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Formulaire d'ajout d'étudiants</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Styles personnalisés -->
  <style>
    body {
      background-color: #f1f3f5;
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .container {
      background-color: #ffffff;
      padding: 25px;
      border-radius: 10px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 500px; /* Form width */
    }
    h2 {
      color: #007bff;
      margin-bottom: 20px;
      font-size: 24px;
    }
    .form-label {
      font-weight: 600;
    }
    .form-control, .form-select {
      border-radius: 8px;
      height: 40px;
      font-size: 16px;
    }
    .form-select {
      padding: 8px 12px;
      border: 1px solid #ccc;
      transition: border-color 0.3s;
    }
    .form-select:focus {
      border-color: #007bff;
      box-shadow: 0 0 0 0.25rem rgba(0, 123, 255, 0.25);
    }
    .btn-primary {
      width: 100%;
      padding: 12px;
      font-size: 16px;
      border-radius: 8px;
    }
    .btn-primary:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>

<div class="container">
  <h2 class="text-center">Ajouter un étudiant</h2>
  <form>
    <!-- Nom et Prénom -->
    <div class="row mb-3">
      <div class="col-md-6">
        <label for="nom" class="form-label">Nom</label>
        <input type="text" class="form-control" id="nom" placeholder="Nom" required>
      </div>
      <div class="col-md-6">
        <label for="prenom" class="form-label">Prénom</label>
        <input type="text" class="form-control" id="prenom" placeholder="Prénom" required>
      </div>
    </div>

    <!-- Date de naissance -->
    <div class="mb-3">
      <label for="dateNaissance" class="form-label">Date de naissance</label>
      <input type="date" class="form-control" id="dateNaissance" required>
    </div>

    <!-- Email -->
    <div class="mb-3">
      <label for="email" class="form-label">Email</label>
      <input type="email" class="form-control" id="email" placeholder="Email" required>
    </div>

    <!-- Cours -->
    <div class="mb-3">
      <label class="form-label">Cours</label>
      <select class="form-select form-select-sm" aria-label=".form-select-sm example">
        <option value="math">Mathématiques</option>
        <option value="physique">Physique</option>
        <option value="chimie">Chimie</option>
        <option value="informatique">Informatique</option>
        <option value="histoire">Histoire</option>
      </select>
    </div>

    <!-- Bouton de soumission -->
    <button type="submit" class="btn btn-primary">Ajouter l'étudiant</button>
  </form>
</div>

<!-- Bootstrap JS (optionnel, pour certaines fonctionnalités) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
