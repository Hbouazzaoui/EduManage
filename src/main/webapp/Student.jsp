<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.edumanage.controllers.StudentServlet" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Information Table</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 900px;
        }
        .table-container {
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }
        .table th {
            background-color: #007bff;
            color: white;
        }
        .table-hover tbody tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <div class="table-container">
        <h2 class="text-center mb-4"><i class="fas fa-user-graduate"></i> Student Information</h2>
        <table class="table table-hover table-bordered text-center">
            <thead>
            <tr>
                <th>Nom</th>
                <th>Prénom</th>
                <th>Date de Naissance</th>
                <th>Email</th>
                <th>Cours</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>Doe</td>
                <td>John</td>
                <td>1990-05-15</td>
                <td>john.doe@example.com</td>
                <td>Mathematics</td>
            </tr>
            <tr>
                <td>Smith</td>
                <td>Jane</td>
                <td>1992-08-25</td>
                <td>jane.smith@example.com</td>
                <td>Physics</td>
            </tr>
            <tr>
                <td>Brown</td>
                <td>Chris</td>
                <td>1991-03-30</td>
                <td>chris.brown@example.com</td>
                <td>Chemistry</td>
            </tr>
            <!-- Add more rows as needed -->
            </tbody>
        </table>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
</html>