<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.edumanage.Model.Student" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Information Table</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <style>
        body { background-color: #f8f9fa; }
        .container { max-width: 900px; margin-top: 50px; }
        .table-container { background: #ffffff; padding: 20px; border-radius: 10px; box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1); }
        .table th { background-color: #007bff; color: white; }
        .table-hover tbody tr:hover { background-color: #f1f1f1; }
    </style>
</head>
<body>
<div class="container">
    <h2 class="text-center mb-4"><i class="fas fa-users"></i> Student Information</h2>
    <table class="table table-bordered table-striped">
        <thead class="thead-dark">
        <tr>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Date de Naissance</th>
            <th>Email</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Student> studentList = (List<Student>) request.getAttribute("liststudent");
            if (studentList != null && !studentList.isEmpty()) {
                for (Student student : studentList) {
        %>
        <tr>
            <td><%= student.getNom() %></td>
            <td><%= student.getPrenom() %></td>
            <td><%= student.getDate_naissance() %></td>
            <td><%= student.getEmail() %></td>
            <td>
                <!-- Edit Button with Modal Trigger -->
                <button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="Student/update?id=<%= student.getId() %>">
                    <i class="fas fa-edit"></i> Edit
                </button>
                <!-- Delete Button -->
                <a href="Student/delete?id=<%= student.getId() %>" class="btn btn-danger btn-sm">
                    <i class="fas fa-trash"></i> Delete
                </a>
            </td>
        </tr>

<%--        <!-- Edit Modal for Each Student -->--%>
<%--        <div class="modal fade" id="editModal<%= student.getId() %>" tabindex="-1" role="dialog" aria-labelledby="editModalLabel<%= student.getId() %>" aria-hidden="true">--%>
<%--            <div class="modal-dialog" role="document">--%>
<%--                <div class="modal-content">--%>
<%--                    <div class="modal-header">--%>
<%--                        <h5 class="modal-title" id="editModalLabel<%= student.getId() %>">Edit Student Information</h5>--%>
<%--                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                            <span aria-hidden="true">&times;</span>--%>
<%--                        </button>--%>
<%--                    </div>--%>
<%--                    <div class="modal-body">--%>
<%--                        <form action="edit" method="post">--%>
<%--                            <input type="hidden" name="id" value="<%= student.getId() %>">--%>
<%--                            <div class="form-group">--%>
<%--                                <label for="nom<%= student.getId() %>">Nom</label>--%>
<%--                                <input type="text" class="form-control" id="nom<%= student.getId() %>" name="nom" value="<%= student.getNom() %>" required>--%>
<%--                            </div>--%>
<%--                            <div class="form-group">--%>
<%--                                <label for="prenom<%= student.getId() %>">Prénom</label>--%>
<%--                                <input type="text" class="form-control" id="prenom<%= student.getId() %>" name="prenom" value="<%= student.getPrenom() %>" required>--%>
<%--                            </div>--%>
<%--                            <div class="form-group">--%>
<%--                                <label for="date_naissance<%= student.getId() %>">Date de Naissance</label>--%>
<%--                                <input type="date" class="form-control" id="date_naissance<%= student.getId() %>" name="date_naissance" value="<%= student.getDate_naissance() %>" required>--%>
<%--                            </div>--%>
<%--                            <div class="form-group">--%>
<%--                                <label for="email<%= student.getId() %>">Email</label>--%>
<%--                                <input type="email" class="form-control" id="email<%= student.getId() %>" name="email" value="<%= student.getEmail() %>" required>--%>
<%--                            </div>--%>
<%--                            <div class="modal-footer">--%>
<%--                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--%>
<%--                                <button type="submit" class="btn btn-primary">Save changes</button>--%>
<%--                            </div>--%>
<%--                        </form>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <%--%>
<%--            }--%>
<%--        } else {--%>
<%--        %>--%>
<%--        <tr>--%>
<%--            <td colspan="5" class="text-center">No students available.</td>--%>
<%--        </tr>--%>
<%--        <%--%>
<%--            }--%>
<%--        %>--%>
        </tbody>
    </table>

    <!-- Add Student Button -->
    <div class="text-center mt-4">
        <a href="new" class="btn btn-success"><i class="fas fa-plus"></i> Add Student</a>
    </div>
</div>

<!-- Bootstrap and jQuery Scripts -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>