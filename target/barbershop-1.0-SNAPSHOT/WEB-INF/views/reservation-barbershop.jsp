<%--
  Created by IntelliJ IDEA.
  User: dorotajachtoma
  Date: 25.08.19
  Time: 08:36
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Reservations</title>
    <link href="<c:url value="/static/css/registration-barbershop.css" />" rel="stylesheet">

</head>
<body>

<%@include file="header.jsp"%>
<br/>
<br/>


<c:forEach var="reservation" items="${reservations}">

    <div class="contain-box">
        <b>    <p align="center">Barbershop : ${reservation.user.firstName}</p>
            <p align="center">Address : ${reservation.user.lastName}</p>
            <p align="center">City  : ${reservation.user.email}</p>
            <p align="center">Date: ${reservation.user.phoneNumber}</p>
            <p align="center">Hour  : ${reservation.slot.time}</p>
            <p align="center">Service : ${reservation.service.name}</p>
            <p align="center">Duration : ${reservation.service.time}</p>
            <p align="center">Price : ${reservation.service.price}</p>
        </b>
    </div>
</c:forEach>



</body>
</html>
