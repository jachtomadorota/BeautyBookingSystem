<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorotajachtoma
  Date: 28.07.19
  Time: 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Homepage</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <style>
        .contain-box
        {
            margin-left: 23%;
            position: center;
            width: 700px;
            margin-bottom: 14%;
            height: 500px;
            padding: 80px 40px;
            background: rgba(0,0,0,.5);
        }
        p{
            color: #aaaaaa;
            align-items: center;

        }
    </style>
</head>
<body>
<%@include file="header.jsp"%>

<br/>
<br/>
<br/>
<br/>
<br/>
<c:forEach var="barbershops" items="${barbershops}">

<div class="contain-box">
<b>    <p align="center">Name :  ${barbershops.name}</p>
             <p align="center">Address :  ${barbershops.address}</p>
             <p align="center">City :  ${barbershops.city}</p>
             <p align="center">Phone Number :  ${barbershops.phoneNumber}</p>
             <p align="center">Email  :  ${barbershops.email}</p>
             <p align="center">Open at  ${barbershops.open}</p>
             <p align="center">Close at ${barbershops.close}</p>
            <p align="center"><a href="http://localhost:8080/barbershop_war_exploded/user/login/panel/barbershop/reservation/${barbershops.id}">Make reservation</a> </p>
</b>
</div>
</c:forEach>

</body>
</html>
