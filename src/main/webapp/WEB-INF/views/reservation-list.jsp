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
</head>
<body>

<table border="1">

    <c:forEach var="reservation" items="${reservation}">
        <tr>
            <td>${reservation.user.firstName}</td>
            <td>${reservation.user.email}</td>
            <td>${reservation.user.phoneNumber}</td>
            <td>${reservation.user.toString()}</td>
            <td>${reservation.barbershop.address}</td>
            <td>${reservation.barbershop.city}</td>
            <td>${reservation.barbershop.email}</td>
            <td>${reservation.barber.name}</td>
        </tr>
    </c:forEach>

</table>
<h3><a href="http://localhost:8080/barbershop_war_exploded/barbershop/login/panel/barber/add">Dodaj</a> </h3>


</body>
</html>
