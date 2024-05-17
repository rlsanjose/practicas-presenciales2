<%@ page import="com.svalero.thecuriousfeather.dao.Database" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.svalero.thecuriousfeather.domain.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.svalero.thecuriousfeather.dao.ProductDao" %>
<%@ page import="com.svalero.thecuriousfeather.domain.Shop" %>
<%@ page import="com.svalero.thecuriousfeather.dao.ShopDao" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>The curious feather</title>
    <link rel="icon" type="image/x-icon" href="favicon.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.html">The curious feather</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.html">Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="stationary.html">Stationary</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="shops.html">All shops</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <div id="filters" class="mb-3">
        <input type="text" id="name-filter" class="form-control" placeholder="Search by name">
        <button id="search-button" class="btn btn-primary mt-2">Search</button>
    </div>

    <h3>Page
        <select name="pagina" id="pagina" class="form-select w-auto d-inline-block" onchange="(this.value)">
            <script>
                for (let i = 1; i <= 3; i++) {
                    document.write(`<option value="${i}">${i}</option>`);
                }
            </script>
        </select>
    </h3>

    <div id="resultado"></div>
</div>
<script>
    $(document).ready(function(){
        $(".navbar-toggler").click(function(){
            $("#navbarNav").toggleClass("show");
        });
    });
</script>
</body>
<footer class="bg-dark text-white text-center p-3 mt-4">
    <p>&copy; 2024 The curious feather. All rights reserved.</p>
</footer>
</html>