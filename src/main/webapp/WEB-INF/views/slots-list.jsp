<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorotajachtoma
  Date: 08.08.19
  Time: 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Slots</title>
</head>
<body>
<%@include file="header.jsp"%>

<table  class="table table-borderless table-dark">
    <tr>

    </tr>
    <c:forEach var="slot" items="${slots}">
        <tr>
            <td><a href="http://localhost:8080/barbershop_war_exploded/user/login/panel/barbershop/reservation/${barbershopId}/${serviceId}/${dateId}/${slot.id}" onclick="return confirm('Are you sure you want to make reservation')">${slot.time}</a></td>
        </tr>
    </c:forEach>

</table>


</body>
</html>