<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorotajachtoma
  Date: 07.08.19
  Time: 16:59
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
            <td><a href="http://localhost:8080/barbershop_war_exploded/user/login/panel/barbershop/reservation/${barbershopId}/${service.id}">Choose</a> </td>
        </tr>
    </c:forEach>

</table>

</body>
</html>
