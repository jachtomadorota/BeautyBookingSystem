<%--
  Created by IntelliJ IDEA.
  User: dorotajachtoma
  Date: 03.08.19
  Time: 09:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Barbershop Details</title>
    <style>
        .contain-box
        {
            margin-left: 23%;
            position: center;
            width: 700px;
            margin-bottom: 14%;
            height: 400px;
            padding: 80px 40px;
            background: rgba(0,0,0,.5);
        }
        p{
            color: #aaaaaa;
            align-items: center;

        }
    </style>
</head>
<body>
<%@include file="header.jsp"%>
<br/>
<br/>
<c:forEach var="barbershops" items="${barbershops}">

    <div class="contain-box">
        <b>    <p align="center">Name  : ${barbershops.name}</p>
            <p align="center">Address  : ${barbershops.address}</p>
            <p align="center">City  : ${barbershops.city}</p>
            <p align="center">Phone Number  : ${barbershops.phoneNumber}</p>
            <p align="center">Email  : ${barbershops.email}</p>
            <p align="center">Open at : ${barbershops.open}</p>
            <p align="center">Close at  : ${barbershops.close}</p>
            <p align="center"><a href="http://localhost:8080/barbershop_war_exploded/barbershop/login/panel/details/update/${barbershops.id}">Update</a> </p>
        </b>
    </div>
</c:forEach>
<br/>
<br/>
<c:forEach var="service" items="${service}">

    <div class="contain-box">
        <b> <p align="center">Name   : ${service.name}</p>
            <p align="center">Price  : ${service.price}</p>
            <p align="center">Time  : ${service.time} min</p>
            <p align="center"><a href="http://localhost:8080/barbershop_war_exploded/user/login/panel/barbershop/reservation/${barbershopId}/${service.id}">Make reservation</a> </p>
        </b>
    </div>

</c:forEach>

</body>
</html>
