<%--
  Created by IntelliJ IDEA.
  User: dorotajachtoma
  Date: 30.07.19
  Time: 20:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Barbershop panel</title>
</head>
<body>
<%@include file="header.jsp"%>


<nav class="navbar navbar-expand-sm bg-dark navbar-dark">

    <ul class="navbar-nav">
        <li class="nav-item active">
            <a class="nav-link" href="http://localhost:8080/barbershop_war_exploded/barbershop/login/panel/reservations">Reservations</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="http://localhost:8080/barbershop_war_exploded/barbershop/login/panel/services">Your Services</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="http://localhost:8080/barbershop_war_exploded/barbershop/login/panel/details">Account Details</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="http://localhost:8080/barbershop_war_exploded/logout">Logout</a>
        </li>
    </ul>



</nav>

</body>
</html>
