<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.edumanage.Model.Student" %>
<%@ page import="com.example.edumanage.Model.Cours" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Inscrire un Étudiant à un Cours</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f8f9fc;
      padding: 2rem;
    }
    .form-container {
      max-width: 600px;
      margin: auto;
      background: white;
      padding: 2rem;
      border-radius: 15px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    }
  </style>
</head>
<body>
<div class="form-container">
  <h2 class="text-center mb-4">Inscrire un Étudiant à un Cours</h2>
  <form action="${pageContext.request.contextPath}/enroll-student" method="post">
    <div class="mb-3">
      <label for="student" class="form-label">Sélectionner un Étudiant</label>
      <select class="form-select" id="student" name="studentId" required>
        <option value="">Choisir un étudiant...</option>
        <% List<Student> students = (List<Student>) request.getAttribute("students");
          for (Student student : students) { %>
        <option value="<%= student.getId() %>"><%= student.getFirstName() %> <%= student.getLastName() %></option>
        <% } %>
      </select>
    </div>
    <div class="mb-3">
      <label for="course" class="form-label">Sélectionner un Cours</label>
      <select class="form-select" id="course" name="courseId" required>
        <option value="">Choisir un cours...</option>
        <% List<Cours> courses = (List<Cours>) request.getAttribute("courses");
          for (Cours course : courses) { %>
        <option value="<%= course.getId() %>"><%= course.getTitle() %></option>
        <% } %>
      </select>
    </div>
    <button type="submit" class="btn btn-primary w-100">Inscrire</button>
  </form>
</div>
</body>
</html>