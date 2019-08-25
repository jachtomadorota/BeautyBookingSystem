<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorotajachtoma
  Date: 08.08.19
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <style>
        body{
            background-image: url("https://www.tailoredbarberco.com/wp-content/uploads/sites/312/2018/03/barber-background.jpg");
            background-repeat: no-repeat;
            background-position: center;
            background-size:cover;
            background-attachment: fixed;
        }
        li{

            margin: 20px 30px 10px ;
        }
    </style>
    <link rel="shortcut icon" type="image/x-icon" href="https://www.nicepng.com/png/detail/204-2046609_barber-logos-de-barber-png.png" />

</head>
<body>

<div class="container-fluid" >
<nav class="nav justify-content-center">
<nav class="navbar navbar-expand-sm bg-dark navbar-dark" align="center">

    <ul class="navbar-nav">
        <li class="nav-item active">
            <a class="nav-link" href="http://localhost:8080/barbershop_war_exploded/">Homepage</a>
        </li>
        <li class="nav-item active">
            <a class="nav-link" href="http://localhost:8080/barbershop_war_exploded/user/registration">Sign up as user</a>
        </li>
        <li class="nav-item active">
            <a class="nav-link" href="http://localhost:8080/barbershop_war_exploded/barbershop/registration">Sign up as barbershop</a>
        </li>
        <li class="nav-item active">
            <a class="nav-link" href="http://localhost:8080/barbershop_war_exploded/login">Login</a>
        </li>
        <li class="nav-item active">
            <a class="nav-link" href="http://localhost:8080/barbershop_war_exploded/logout">Logout</a>
        </li>
        <li class="nav-item active">
            <a class="nav-link" href="http://localhost:8080/barbershop_war_exploded/search">Search</a>
        </li>
        <li class="nav-item active">
            <a class="nav-link" href="http://localhost:8080/barbershop_war_exploded/barbershop/login/panel">Barbershop Settings</a>
        </li>
        <li class="nav-item active">
            <a class="nav-link" href="http://localhost:8080/barbershop_war_exploded/user/login/panel">User Settings</a>
        </li>
    </ul>


</nav>
</nav>
</div>


</body>
</html>
