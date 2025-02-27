<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
  <title>Inscription Étudiant</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 20px;
    }
    h1 {
      color: #333;
    }
    form {
      max-width: 400px;
      margin: 0 auto;
      padding: 20px;
      border: 1px solid #ccc;
      border-radius: 5px;
      background-color: #f9f9f9;
    }
    label {
      display: block;
      margin-bottom: 8px;
      font-weight: bold;
    }
    select, button {
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }
    button {
      background-color: #4CAF50;
      color: white;
      font-size: 16px;
      cursor: pointer;
    }
    button:hover {
      background-color: #45a049;
    }
  </style>
</head>
<body>
<h1>Inscription d'un étudiant à un cours</h1>

<!-- Vérification que les listes ne sont pas vides -->
<c: if test="${empty students or empty courses}">
  <p style="color: red;">Aucun étudiant ou cours disponible.</p>
</c: if>

<form action="/enroll" method="post">
  <label for="studentId">Étudiant:</label>
  <select id="studentId" name="studentId" required>
    <option value="">Sélectionnez un étudiant</option>
    <c: forEach items="${students}" var="student">
      <option value="${student.id}">${student.nom} ${student.prenom}</option>
    </c:forEach>
  </select>
  <br>

  <label for="courseId">Cours:</label>
  <select id="courseId" name="courseId" required>
    <option value="">Sélectionnez un cours</option>
    <c: forEach items="${courses}" var="course">
      <option value="${course.id}">${course.titre}</option>
    </c: forEach>
  </select>
  <br>

  <button type="submit">Inscrire</button>
</form>
</body>
</html>
