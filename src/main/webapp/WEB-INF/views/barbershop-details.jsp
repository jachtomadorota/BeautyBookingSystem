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
</head>
<body>
<%@include file="header.jsp"%>

<table class="table table-borderless table-dark">
    <tr>
        <th>Address</th>
        <th>City</th>
        <th>Phone Number</th>
        <th>Email</th>
        <th>Description</th>
        <th>NIP</th>
        <th>Open</th>
        <th>Close</th>


    </tr>
    <c:forEach var="barbershops" items="${barbershops}">
        <tr>
            <td>${barbershops.address}</td>
            <td>${barbershops.city}</td>
            <td>${barbershops.phoneNumber}</td>
            <td>${barbershops.email}</td>
            <td>${barbershops.description}</td>
            <td>${barbershops.nip}</td>
            <td>${barbershops.open}</td>
            <td>${barbershops.close}</td>
        </tr>
    </c:forEach>
</table>
<br/>
<table class="table table-borderless table-dark">
    <tr>
        <th>Address</th>
        <th>City</th>
        <th>Phone Number</th>
        <th>Email</th>
        <th>Open</th>
        <th>Close</th>
    </tr>
    <c:forEach var="barbershops" items="${barbershops}">
        <tr>
            <td>${barbershops.address}</td>
            <td>${barbershops.city}</td>
            <td>${barbershops.phoneNumber}</td>
            <td>${barbershops.email}</td>
            <td>${barbershops.open}</td>
            <td>${barbershops.close}</td>
            <td><a href="http://localhost:8080/barbershop_war_exploded/user/login/panel/barbershop/reservation/${barbershops.id}">Zarezerwuj wizytę</a> </td>
        </tr>
    </c:forEach>


</table>

<table class="table table-borderless table-dark">
    <tr>
        <th>Name</th>
        <th>Price</th>

    </tr>
    <c:forEach var="service" items="${service}">
        <tr>
            <td>${service.name}</td>
            <td>${service.price}</td>
            <td>${service.time}</td>
            <td><a href="http://localhost:8080/barbershop_war_exploded//user/login/panel/barbershop/reservation/${barbershopId}/${service.id}"> Zarezerwuj </a> </td>
        </tr>
    </c:forEach>

</table>


</body>
</html>
