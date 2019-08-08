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


<table border="1">
    <tr>

    </tr>
    <c:forEach var="user" items="${user}">
        <tr>
            <td>${user.firstName}</td>
            <td>${user.lastName}</td>
            <td>${user.email}</td>
            <td>${user.phoneNumber}</td>
            <td><a href="http://localhost:8080/barbershop_war_exploded/user/login/panel/details/delete/${user.id}">Delete</a> </td>
            <td><a href="http://localhost:8080/barbershop_war_exploded/user/login/panel/details/update/${user.id}">Update</a> </td>
        </tr>
    </c:forEach>

</table>



</body>
</html>
