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
        </tr>
    </c:forEach>
</table>

</body>
</html>
