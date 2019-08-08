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
</head>
<body>


<table border="1">
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
    <c:forEach var="barbershops" items="${barbershop}">
        <tr>
            <td>${barbershops.address}</td>
            <td>${barbershops.city}</td>
            <td>${barbershops.phoneNumber}</td>
            <td>${barbershops.email}</td>
            <td>${barbershops.description}</td>
            <td>${barbershops.nip}</td>
            <td>${barbershops.open}</td>
            <td>${barbershops.close}</td>
            <td><a href="http://localhost:8080/barbershop_war_exploded/user/login/panel/barbershop/reservation/${barbershops.id}">Zarezerwuj wizytę</a> </td>
        </tr>
    </c:forEach>
</table>


</body>
</html>
