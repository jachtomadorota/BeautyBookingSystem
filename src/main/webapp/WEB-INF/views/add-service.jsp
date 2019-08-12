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
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
            -webkit-filter: blur(10px);
            -ms-filter: blur(10px);
            filter: blur(10px);
        }
        .contact-form
        {
            margin-left: 30%;
            position: center;
            width: 550px;
            margin-bottom: 14%;
            height: 600px;
            padding: 80px 40px;
            background: rgba(0,0,0,.5);
        }
        .contact-form input
        {
            width: 100%;
            margin-bottom: 20px;
        }
        .contact-form input[type="text"],
        .contact-form input[type="password"],
        .contact-form input[type="textarea"]
        {
            border: none;
            border-bottom: 1px solid #fff;
            background: transparent;
            outline: none;
            height: 40px;
            color: #fff;
            font-size: 16px;
        }

        .contact-form input[type="submit"] {
            height: 30px;
            color: #fff;
            font-size: 15px;
            background: red;
            cursor: pointer;
            border-radius: 25px;
            border: none;
            outline: none;
            margin-top: 15%;
        }
        .contact-form label{
            color: #aaaaaa;
        }
        h2 {
            margin: 0;
            padding: 0 0 20px;
            color: #fff;
            text-align: center;
            text-transform: uppercase;
        }
    </style>
</head>
<body>

<%@include file="header.jsp"%>
<br/>
<br/>
<div class="contact-form">
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
</div>
</body>
</html>
