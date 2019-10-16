<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorotajachtoma
  Date: 04.08.19
  Time: 09:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Services</title>
    <link href="<c:url value="/static/css/service.list.css" />" rel="stylesheet">

</head>
<body>
<%@include file="header.jsp"%>
<br/>
<br/>
<h3 align="center"><a href="http://localhost:8080/barbershop_war_exploded/barbershop/login/panel/service/add">Add new service</a> </h3>
<br/>
<c:forEach var="service" items="${service}">

    <div class="contain-box">
        <b> <p align="center">Name   : ${service.name}</p>
            <p align="center">Price  : ${service.price}PLN</p>
            <p align="center">Time  : ${service.time} min</p>
        </b>
    </div>

</c:forEach>


</body>
</html>
