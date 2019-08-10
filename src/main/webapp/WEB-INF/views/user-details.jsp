<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorotajachtoma
  Date: 04.08.19
  Time: 13:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Details</title>
</head>
<body>
<%@include file="header.jsp"%>


<table class="table table-borderless table-dark">
    <tr>

    </tr>
    <c:forEach var="user" items="${user}">
        <tr>
            <td>${user.firstName}</td>
            <td>${user.lastName}</td>
            <td>${user.email}</td>
            <td>${user.phoneNumber}</td>
            <td><a href="http://localhost:8080/barbershop_war_exploded/user/login/panel/details/delete/${user.id}" onclick="return confirm('Are you sure you want to delete account?');">Delete</a> </td>
            <td><a href="http://localhost:8080/barbershop_war_exploded/user/login/panel/details/update/${user.id}" onclick="return confirm('Are you sure you want to update account?');">Update</a> </td>
        </tr>
    </c:forEach>

</table>


</body>
</html>
