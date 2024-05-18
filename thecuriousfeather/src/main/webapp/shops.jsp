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

<div class="album py-5 bg-light">
    <div class="container" id="shops-container">
        <!-- Here goes the shops' cards -->
        <%
            try {
                Database.connect();
            } catch (Exception e) {
                e.printStackTrace();
            }

            List<Shop> shopList = new ArrayList<>();
            shopList = Database.jdbi.withExtension(ShopDao.class, dao -> dao.getAllShops());

            for (Shop shop : shopList) {

                %>
        <div class="col">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h2 class="shop-city"><%=shop.getCity()%></h2>
                    <p class="shop-address">Address: <%=shop.getAddress()%></p>
                    <p class="shop-hours">Opening Hours: <%=shop.getOpening_hours()%> </p>
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="btn-group">
                            <a href="shop-detail.jsp?id=<%=shop.getShop_id()%>" class="btn btn-sm btn-outline-secondary">View Details</a>
                            <a href="remove-shop?id=<%= shop.getShop_id()%>" class="btn btn-sm btn-outline-secondary">Remove</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        %>

    </div>
</div>

<%--<script>--%>
<%--    document.addEventListener("DOMContentLoaded", function() {--%>
<%--        const shopsData = [--%>
<%--            { name: "City Name 1", address: "123 Main St", hours: "Monday-Friday 10am-9pm" },--%>
<%--            { name: "City Name 2", address: "456 Elm St", hours: "Monday-Friday 9am-8pm" },--%>
<%--            { name: "City Name 3", address: "789 Oak St", hours: "Monday-Friday 11am-10pm" },--%>
<%--        ];--%>

<%--        const shopsContainer = document.getElementById("shops-container");--%>

<%--        // HTML--%>
<%--        shopsData.forEach(shop => {--%>
<%--            const shopHTML = `--%>
<%--                <div class="col">--%>
<%--                    <div class="card shadow-sm">--%>
<%--                        <div class="card-body">--%>
<%--                            <h2 class="shop-name">${shop.name}</h2>--%>
<%--                            <p class="shop-address">Address: ${shop.address}</p>--%>
<%--                            <p class="shop-hours">Opening Hours: ${shop.hours}</p>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            `;--%>
<%--            shopsContainer.insertAdjacentHTML("beforeend", shopHTML);--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>

</body>
<footer class="bg-dark text-white text-center p-3 mt-4">
    <p>&copy; 2024 The curious feather. All rights reserved.</p>
</footer>
</html>