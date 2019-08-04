<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorotajachtoma
  Date: 03.08.19
  Time: 09:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <c:forEach var="barbershop" items="${barbershop}">
        <tr>
            <td>${barbershop.address}</td>
            <td>${barbershop.city}</td>
            <td>${barbershop.phoneNumber}</td>
            <td>${barbershop.email}</td>
            <td>${barbershop.description}</td>
            <td>${barbershop.nip}</td>
            <td>${barbershop.open}</td>
            <td>${barbershop.close}</td>
        </tr>
    </c:forEach>
</table>



</body>
</html>
