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
    <style>
        body{
            margin: 0;
            padding: 0;
        }
        body:before{
            content: '';
            position: fixed;
            width: 100vw;
            height: 100vh;
            background-position: center center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
            -webkit-filter: blur(10px);
            -moz-filter: blur(10px);
            -o-filter: blur(10px);
            -ms-filter: blur(10px);
            filter: blur(10px);
        }
        .contact-form
        {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            width: 400px;
            height: 500px;
            padding: 80px 40px;
            box-sizing: border-box;
            background: rgba(0,0,0,.5);
            align-items: center;
        }

    </style>
</head>
<body>
<%@include file="header.jsp"%>
<table  class="contact-form" align="center">
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
