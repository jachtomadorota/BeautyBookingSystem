<%--
  Created by IntelliJ IDEA.
  User: dorotajachtoma
  Date: 07.08.19
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Panel</title>
    <style>

        body:before{
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
            -webkit-filter: blur(10px);
            -ms-filter: blur(10px);
            filter: blur(10px);
        }
        .contain-box
        {
            margin-left: 30%;
            position: center;
            width: 550px;
            margin-bottom: 14%;
            height: 300px;
            padding: 80px 40px;
            background: rgba(0,0,0,.5);
        }

    </style>
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
