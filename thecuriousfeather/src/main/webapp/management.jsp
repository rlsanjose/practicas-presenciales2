<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Management - TCF</title>
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
<h2>Product Registration Form</h2>
<form id="product-form" action="add-product" method="post">
    <h3>Register product</h3>
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" required><br>
    <label for="price">Price:</label>
    <input type="number" id="price" name="price" min="0" step="0.01" required><br>
    <label for="stock">Stock:</label>
    <input type="number" id="stock" name="stock" min="0" required><br>
    <label for="image_url">Image URL:</label>
    <input type="url" id="image_url" name="image_url" required><br>
    <input type="submit" value="Register product">
</form>

<h2>Shop Registration Form</h2>

<!-- Shop registration form -->
<form id="shop-form" action="add-shop" method="post">
    <h3>Register Shop</h3>
    <label for="address">Address:</label>
    <input type="text" id="address" name="address" required><br>
    <label for="city">City:</label>
    <input type="text" id="city" name="city" required><br>
    <label for="opening_hours">Opening Hours:</label>
    <input type="text" id="opening_hours" name="opening_hours" required><br>
    <input type="submit" value="Register Shop">
</form>
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