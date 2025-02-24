<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.edumanage.Model.Student" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Formulaire d'ajout d'étudiants</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body { background-color: #f1f3f5; height: 100vh; display: flex; justify-content: center; align-items: center; }
    .container { background-color: #ffffff; padding: 25px; border-radius: 10px; box-shadow: 0 0 15px rgba(0, 0, 0, 0.1); width: 100%; max-width: 500px; }
    h2 { color: #007bff; margin-bottom: 20px; font-size: 24px; }
    .form-label { font-weight: 600; }
    .form-control, .form-select { border-radius: 8px; height: 40px; font-size: 16px; }
    .btn-primary { width: 100%; padding: 12px; font-size: 16px; border-radius: 8px; }
    .btn-primary:hover { background-color: #0056b3; }
  </style>
</head>
<body>
<div class="container">
  <h2 class="text-center">Ajouter un étudiant</h2>
  <form action="Student/<%= request.getAttribute("student") == null ? "insert" : "edit" %>" method="post">
    <% if (request.getAttribute("student") != null) { %>
    <input type="hidden" name="id" value="<%= ((Student) request.getAttribute("student")).getId() %>">
    <% } %>
    <div class="row mb-3">
      <div class="col-md-6">
        <label for="nom" class="form-label">Nom</label>
        <input type="text" class="form-control" id="nom" name="nom" placeholder="Nom"
               value="<%= request.getAttribute("student") == null ? "" : ((Student) request.getAttribute("student")).getNom() %>" required>
      </div>
      <div class="col-md-6">
        <label for="prenom" class="form-label">Prénom</label>
        <input type="text" class="form-control" id="prenom" name="prenom" placeholder="Prénom"
               value="<%= request.getAttribute("student") == null ? "" : ((Student) request.getAttribute("student")).getPrenom() %>" required>
      </div>
    </div>
    <div class="mb-3">
      <label for="dateNaissance" class="form-label">Date de naissance</label>
      <input type="date" class="form-control" id="dateNaissance" name="date_naissance"
             value="<%= request.getAttribute("student") == null ? "" : ((Student) request.getAttribute("student")).getDate_naissance() %>" required>
    </div>
    <div class="mb-3">
      <label for="email" class="form-label">Email</label>
      <input type="email" class="form-control" id="email" name="email" placeholder="Email"
             value="<%= request.getAttribute("student") == null ? "" : ((Student) request.getAttribute("student")).getEmail() %>" required>
    </div>
    <button type="submit" class="btn btn-primary">
      <%= request.getAttribute("student") == null ? "Ajouter l'étudiant" : "Mettre à jour" %>
    </button>
  </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>