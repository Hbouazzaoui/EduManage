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
                <a href="edit?id=<%= student.getId() %>"><button type="button" class="btn btn-warning btn-sm">
                    <i class="fas fa-edit"></i> Edit
                </button></a>
                <!-- Delete Button -->
                <a href="delete?id=<%= student.getId() %>" class="btn btn-danger btn-sm">
                    <i class="fas fa-trash"></i> Delete
                </a>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="5" class="text-center">No students available.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <!-- Add Student Button -->
    <div class="text-center mt-4">
        <a href="new" class="btn btn-success"><i class="fas fa-plus"></i> Add Student</a>
    </div>
</div>
<a href="enrollStudent.jsp"></a>
<!-- Bootstrap and jQuery Scripts -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>