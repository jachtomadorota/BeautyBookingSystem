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
    <style>
        .contain-box {
            margin-top: 10%;
            margin-left: 23%;
            position: center;
            width: 700px;
            margin-bottom: 14%;
            height: 400px;
            padding: 80px 40px;
            background: rgba(0,0,0,.5);
        }
        p{
            color: #aaaaaa;
            align-items: center;

        }
        nav{
            align-items: center;
        }
    </style>
</head>
<body>
<%@include file="header.jsp"%>
<br/>
<br/>

<c:forEach var="user" items="${user}">

    <div class="contain-box">
        <b>    <p align="center">First name: ${user.firstName}</p>
            <p align="center">Last Name : ${user.lastName}</p>
            <p align="center">Phone number : ${user.phoneNumber}</p>
            <p align="center">Email : ${user.email}</p>
            <p align="center"><a href="http://localhost:8080/barbershop_war_exploded/user/login/panel/details/delete/${user.id}" onclick="return confirm('Are you sure you want to delete account?');">Delete</a> </p>
            <p align="center"><a href="http://localhost:8080/barbershop_war_exploded/user/login/panel/details/update/${user.id}" onclick="return confirm('Are you sure you want to update account?');">Update</a> </p>
        </b>
    </div>
</c:forEach>



</body>
</html>
