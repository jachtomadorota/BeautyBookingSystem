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
        .contain-box
        {
            margin-left: 38%;
            position: center;
            width: 300px;
            margin-bottom: 14%;
            height: 30px;
            padding: 80px 40px;
            background: rgba(0,0,0,.5);
            align-items: center;
        }
        p{
            color: #aaaaaa;
            align-items: center;
            margin-bottom: 10%;
        }
        a{
            align-items: center;
            color: ;
        }
    </style>
</head>
<body>
<%@include file="header.jsp"%>
<br/>
<br/>
<c:forEach var="slot" items="${slots}">

    <div class="contain-box">
        <b><p align="center"> <a href="http://localhost:8080/barbershop_war_exploded/user/login/panel/barbershop/reservation/${barbershopId}/${serviceId}/${dateId}/${slot.id}" onclick="return confirm('Are you sure you want to make reservation')" style="color:#aaaaaa">${slot.time}</a>
        </p>
        </b>
    </div>

</c:forEach>

</body>
</html>
