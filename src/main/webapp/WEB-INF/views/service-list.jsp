<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorotajachtoma
  Date: 04.08.19
  Time: 09:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Services</title>
</head>
<body>
<%@include file="header.jsp"%>

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
            <td><a href="http://localhost:8080/barbershop_war_exploded/barbershop/login/panel/service/update/${service.id}" onclick="return confirm('Are you sure you want to update service?');">Update</a> </td>
            <td><a href="http://localhost:8080/barbershop_war_exploded/barbershop/login/panel/service/delete/${service.id}" onclick="return confirm('Are you sure you want to delete service?');">Delete</a> </td>
        </tr>
    </c:forEach>

</table>
<h3><a href="http://localhost:8080/barbershop_war_exploded/barbershop/login/panel/service/add">Dodaj</a> </h3>

</body>
</html>
