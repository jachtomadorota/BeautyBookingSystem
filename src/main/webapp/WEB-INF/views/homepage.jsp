<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorotajachtoma
  Date: 28.07.19
  Time: 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Homepage</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <style>
       table {
           height: 10em;
           display: flex;
           align-items: center;
           justify-content: center
       }
    </style>
</head>
<body>
<%@include file="header.jsp"%>

<br/>
<br/>
<br/>
<br/>
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

</body>
</html>
