<%--
  Created by IntelliJ IDEA.
  User: dorotajachtoma
  Date: 25.08.19
  Time: 08:36
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
