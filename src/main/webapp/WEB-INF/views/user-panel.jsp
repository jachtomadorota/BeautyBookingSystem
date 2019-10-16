<%--
  Created by IntelliJ IDEA.
  User: dorotajachtoma
  Date: 07.08.19
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<html>
<head>
    <title>User Panel</title>
    <link href="<c:url value="/static/css/user-panel.css" />" rel="stylesheet">

</head>
<body>
<%@include file="header.jsp"%>

<br/>
<br/>

<div class="contain-box">
    <b> <p align="center"><a href="http://localhost:8080/barbershop_war_exploded/user/login/panel/reservation">Reservations</a></p>
        <p align="center"><a href="http://localhost:8080/barbershop_war_exploded/user/login/panel/details">Account Details</a> </p>
        <p align="center"><a href="http://localhost:8080/barbershop_war_exploded/logout">Logout</a> </p>
    </b>
</div>




</body>
</html>
