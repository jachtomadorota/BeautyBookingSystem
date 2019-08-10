<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorotajachtoma
  Date: 07.08.19
  Time: 17:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Choose hour</title>
</head>
<body>
<%@include file="header.jsp"%>

<table class="table table-borderless table-dark">
    <tr>

    </tr>
    <c:forEach var="hour" items="${hours}">
        <tr>
            <td>${hour.hour}</td>
            <td><a href="http://localhost:8080/barbershop_war_exploded//user/login/panel/barbershop/${barbershopId}/${barberId}/${serviceId}/${dateId}/${hour.id}">Reservation</a> </td>
        </tr>
    </c:forEach>

</table>



</body>
</html>
