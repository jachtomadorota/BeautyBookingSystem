<%--
  Created by IntelliJ IDEA.
  User: dorotajachtoma
  Date: 04.08.19
  Time: 11:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
    <title>Add/Update services</title>
    <style>
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
    form
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
    }
    </style>
</head>
<body>

<%@include file="header.jsp"%>

<form:form method="post" modelAttribute="service" frame="box">

    <label for="id"></label>
    <form:input path="id" id="id" type="hidden"/>

    <label for="nameId">Name</label>
    <form:input path="name" id="nameId" type="text"/>
    <form:errors path="name" element="div"></form:errors>
    <br><br>
    <label for="priceId">Price</label>
    <form:input path="price" id="priceId" type="text"/>
    <form:errors path="name" element="div"></form:errors>
    <br><br>
    <label for="timerId">Time</label>
    <form:input path="time" id="timerId" type="text"/>
    <form:errors path="time" element="div"></form:errors>
    <br><br>

    <input type="submit" value="Submit">
</form:form>

</body>
</html>
