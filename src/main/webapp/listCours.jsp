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
        table {
            background-color: white;
        }
    </style>
</head>
<body>

<div class="container">
    <h3 class="text-center mb-4"><i class="fas fa-book"></i> Liste des Cours</h3>

    <table class="table table-bordered table-striped">
        <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Description</th>
            <th>Durée (h)</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <% List<Cours> coursList = (List<Cours>) request.getAttribute("listCours");
            if (coursList != null && !coursList.isEmpty()) {
                for (Cours cours : coursList) { %>
        <tr>
            <td><%= cours.getId() %></td>
            <td><%= cours.getTitle() %></td>
            <td><%= cours.getDescription() %></td>
            <td><%= cours.getDuration() %></td>
            <td>
                <button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#editModal<%= cours.getId() %>">
                    <i class="fas fa-edit"></i> Modifier
                </button>
                <a href="cours?action=delete&id=<%= cours.getId() %>" class="btn btn-danger btn-sm">
                    <i class="fas fa-trash"></i> Supprimer
                </a>
            </td>
        </tr>
        <!-- Edit Modal -->
        <div class="modal fade" id="editModal<%= cours.getId() %>" tabindex="-1" role="dialog" aria-labelledby="editModalLabel<%= cours.getId() %>" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editModalLabel<%= cours.getId() %>">Modifier le Cours</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="cours" method="post">
                            <input type="hidden" name="action" value="edit">
                            <input type="hidden" name="id" value="<%= cours.getId() %>">
                            <div class="form-group">
                                <label for="title<%= cours.getId() %>">Titre</label>
                                <input type="text" class="form-control" id="title<%= cours.getId() %>" name="title" value="<%= cours.getTitle() %>" required>
                            </div>
                            <div class="form-group">
                                <label for="description<%= cours.getId() %>">Description</label>
                                <textarea class="form-control" id="description<%= cours.getId() %>" name="description" rows="3" required><%= cours.getDescription() %></textarea>
                            </div>
                            <div class="form-group">
                                <label for="duration<%= cours.getId() %>">Durée (h)</label>
                                <input type="number" class="form-control" id="duration<%= cours.getId() %>" name="duration" value="<%= cours.getDuration() %>" required>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                                <button type="submit" class="btn btn-primary">Enregistrer</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%   }
        } else { %>
        <tr>
            <td colspan="5" class="text-center">Aucun cours disponible.</td>
        </tr>
        <% } %>
        </tbody>
    </table>

    <div class="text-center mt-4">
        <a href="CreateServlet.jsp" class="btn btn-success"><i class="fas fa-plus"></i> Ajouter un Cours</a>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>