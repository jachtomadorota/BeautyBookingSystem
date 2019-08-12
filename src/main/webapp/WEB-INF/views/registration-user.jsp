<%--
  Created by IntelliJ IDEA.
  User: dorotajachtoma
  Date: 28.07.19
  Time: 12:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Registration as a User</title>
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
            margin-top: 4%;
            position: center;
            width: 550px;
            margin-left: 30%;
            margin-bottom: 14%;
            height: 850px;
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
<div class="contact-form">
<h2 align="center">Sign up</h2>
<form:form method="post" modelAttribute="user" align="center" id="formDiv">

    <form:input path="id" id="id" type="hidden" class="form-control"/>
    <form:errors path="id" element="div"></form:errors>

        <div class="form-group">
            <label for="firstNameId">First Name</label>
    <form:input path="firstName" id="firstNameId" type="text" class="form-control"/>
    <form:errors path="firstName" element="div"></form:errors>/
        </div>

        <div class="form-group">

             <label for="lastNameId">Last Name</label>
    <form:input path="lastName" id="lastNameId" type="text" />
    <form:errors path="lastName" element="div"></form:errors>
        </div>
        <div class="form-group">

             <label for="emailId">Email</label>
    <form:input path="email" id="emailId" type="email" />
    <form:errors path="email" element="div"></form:errors>
        </div>

            <div class="form-group">

            <label for="passwordId">Password</label>
    <form:input path="password" id="passwordId" type="password"/>
    <form:errors path="password" element="div"></form:errors>
        </div>

    <div class="form-group">
            <label for="phoneNumberId">Phone Number</label>
    <form:input path="phoneNumber" id="phoneNumberId" type="text" />
    <form:errors path="phoneNumber" element="div"></form:errors>
    </div>

        <div class="form-group">
            <input type="submit" value="Submit" >
        </div>
</form:form>
</div>

</body>
</html>
