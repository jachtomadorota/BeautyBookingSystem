<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorotajachtoma
  Date: 04.08.19
  Time: 14:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Reservations</title>
    <style>
        .contain-box
        {
            margin-top: 10%;
            margin-left: 23%;
            position: center;
            width: 700px;
            margin-bottom: 14%;
            height: 500px;
            padding: 80px 40px;
            background: rgba(0,0,0,.5);
        }
        p{
            color: #aaaaaa;
            align-items: center;

        }
        nav{
            align-items: center;
        }
    </style>
</head>
<body>
<%@include file="header.jsp"%>
<br/>
<br/>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">

    <ul class="navbar-nav">
        <li class="nav-item active">
            <a class="nav-link" href="http://localhost:8080/barbershop_war_exploded/user/login/panel/reservation">Reservations</a>
        </li>
        <li class="nav-item active">
            <a class="nav-link" href="http://localhost:8080/barbershop_war_exploded/user/login/panel/details">Account Details</a>
        </li>
        <li class="nav-item active">
            <a class="nav-link" href="http://localhost:8080/barbershop_war_exploded/logout">Logout</a>
        </li>
    </ul>

</nav>

    <c:forEach var="reservation" items="${reservation}">

<div class="contain-box">
    <b>    <p align="center">Barbershop : ${reservation.barbershop.name}</p>
        <p align="center">Address : ${reservation.barbershop.address}</p>
        <p align="center">City  : ${reservation.barbershop.city}</p>
        <p align="center">Date: ${reservation.date.day}</p>
        <p align="center">Hour  : ${reservation.slot.time}</p>
        <p align="center">Service : ${reservation.service.name}</p>
        <p align="center">Duration : ${reservation.service.time}</p>
        <p align="center">Price : ${reservation.service.price}</p>
    </b>
</div>
</c:forEach>



</body>
</html>
