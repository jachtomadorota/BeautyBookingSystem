<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorotajachtoma
  Date: 29.07.19
  Time: 21:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List of Barbershops</title>
    <link href="<c:url value="/static/css/barbershop-details.css" />" rel="stylesheet">

</head>
<body>

<%@include file="header.jsp"%>

<br/>
<br/>
<c:forEach var="barbershops" items="${barbershops}">

    <div class="contain-box">
        <b>    <p align="center">Name :  ${barbershops.name}</p>
            <p align="center">Address :  ${barbershops.address}</p>
            <p align="center">City :  ${barbershops.city}</p>
            <p align="center">Phone Number :  ${barbershops.phoneNumber}</p>
            <p align="center">Email  :  ${barbershops.email}</p>
            <p align="center">Open at  ${barbershops.open}</p>
            <p align="center">Close at ${barbershops.close}</p>
            <p align="center"><a href="http://localhost:8080/barbershop_war_exploded/user/login/panel/barbershop/reservation/${barbershops.id}">Make Reservation</a> </p>
        </b>
    </div>
</c:forEach>


</body>
</html>
