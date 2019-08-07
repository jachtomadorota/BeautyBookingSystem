<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorotajachtoma
  Date: 29.07.19
  Time: 20:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Barbers' List</title>
</head>
<body>

<table border="1">
    <tr>
        <th>Name</th>

    </tr>
    <c:forEach var="barber" items="${barber}">
        <tr>
            <td>${barber.name}</td>
            <td><a href="http://localhost:8080/barbershop_war_exploded/barbershop/login/panel/barber/update/${barber.id}">Edytuj</a> </td>
            <td><a href="http://localhost:8080/barbershop_war_exploded/barbershop/login/panel/barber/delete/${barber.id}">Usuń</a> </td>
        </tr>
    </c:forEach>

</table>
<h3><a href="http://localhost:8080/barbershop_war_exploded/barbershop/login/panel/barber/add">Dodaj</a> </h3>

</body>
</html>
