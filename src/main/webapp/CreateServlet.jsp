<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Créer un Cours</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
  <style>
    body {
      background-color: #f8f9fa;
    }
    .container {
      max-width: 600px;
      background: white;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
      margin-top: 50px;
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
  <h3 class="text-center mb-4"><i class="fas fa-book"></i> Ajouter un Nouveau Cours</h3>
  <form action="CoursServlet" method="post">
    <div class="form-group">
      <%--@declare id="title"--%><label for="title"><i class="fas fa-font"></i> Titre du Cours</label>
      <input type="text" class="form-control" name="title" placeholder="Ex: Développement Web" required>
    </div>

    <div class="form-group">
      <%--@declare id="description"--%><label for="description"><i class="fas fa-align-left"></i> Description</label>
      <textarea class="form-control" name="description" rows="4" placeholder="Brève description du cours..." required></textarea>
    </div>

    <div class="form-group">
      <%--@declare id="duration"--%><label for="duration"><i class="fas fa-clock"></i> Durée (en heures)</label>
      <input type="number" class="form-control" name="duration" placeholder="Ex: 20" required>
    </div>

    <button type="submit" class="btn btn-custom btn-block"><i class="fas fa-plus"></i> Ajouter Cours</button>
  </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
