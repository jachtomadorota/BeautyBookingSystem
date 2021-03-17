<%--
  Created by IntelliJ IDEA.
  User: dorotajachtoma
  Date: 30.07.19
  Time: 20:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Barbershop panel</title>
    <link href="<c:url value="/static/css/barbershop-panel.css" />" rel="stylesheet">

</head>
<body>
<%@include file="header.jsp"%>

<br/>
<br/>

    <div class="contain-box">
        <b> <p align="center"><a href="http://localhost:8080/barbershop_war_exploded/barbershop/login/panel/reservations">Reservations</a></p>
           <p align="center"><a href="http://localhost:8080/barbershop_war_exploded/barbershop/login/panel/details">Account Details</a> </p>
            <p align="center"><a href="http://localhost:8080/barbershop_war_exploded/barbershop/login/panel/services">Your services</a> </p>
            <p align="center"><a href="http://localhost:8080/barbershop_war_exploded/logout">Logout</a> </p>
        </b>
    </div>



</body>
</html>
