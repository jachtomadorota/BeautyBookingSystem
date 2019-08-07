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


</body>
</html>
