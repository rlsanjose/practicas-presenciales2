<%@ page import="com.svalero.thecuriousfeather.dao.Database" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.svalero.thecuriousfeather.dao.ShopDao" %>
<%@ page import="com.svalero.thecuriousfeather.domain.Shop" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    try {
        Database.connect();
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        throw new RuntimeException();
    }

    int shop_id = Integer.parseInt(request.getParameter("id"));
    Shop shop = Database.jdbi.withExtension(ShopDao.class, dao -> dao.getShopById(shop_id));

%>

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
        <a class="navbar-brand" href="index.jsp">The curious feather</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="management.jsp">Management</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="shops.jsp">All shops</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <h3 class="text-center mb-4">Shop Detail</h3>

    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <img src="https://cdn-icons-png.flaticon.com/512/5609/5609501.png" class="card-img-top" alt="Shop Image">
                <div class="card-body">
                    <h5 class="card-title text-center"><%=shop.getCity()%></h5>
                    <p class="card-text text-center"><%=shop.getAddress()%></p>
                    <p class="card-text text-center"><%=shop.getOpening_hours()%></p>
                    <a href="remove-shop?id=<%=shop.getShop_id()%>" class="btn btn-danger">Delete</a>
                </div>
            </div>
        </div>
    </div>
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