<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorotajachtoma
  Date: 07.08.19
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Barber's List</title>
</head>
<body>
<table border="1">
    <tr>
        <th>Name</th>

    </tr>
    <c:forEach var="barber" items="${barber}">
        <tr>
            <td>${barber.name}</td>
            <td><a href="http://localhost:8080/barbershop_war_exploded/user/login/panel/barbershop/reservation/${id}/${barber.id}">Reservation</a> </td>
        </tr>
    </c:forEach>

</table>

</body>
</html>
