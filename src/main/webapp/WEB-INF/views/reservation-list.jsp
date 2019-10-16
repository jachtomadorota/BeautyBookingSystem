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
    <link href="<c:url value="/static/css/reservation-list.css" />" rel="stylesheet">

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
        <p align="center">Price : ${reservation.service.price}PLN</p>
    </b>
</div>
</c:forEach>



</body>
</html>
