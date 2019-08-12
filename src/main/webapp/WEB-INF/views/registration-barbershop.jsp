<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: dorotajachtoma
  Date: 28.07.19
  Time: 12:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration Barbershop</title>
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
                height: 1400px;
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
    <h2 align="center">Sign up</h2>

<form:form method="post" modelAttribute="barbershop" align="center">

    <form:input path="id" id="idId" type="hidden" />
    <form:errors path="id" element="div"></form:errors>

    <div class="form-group">
        <label for="addressId">Address</label>

    <form:input path="address" id="addressId" type="text" />
    <form:errors path="address" element="div"></form:errors>
    </div>


    <div class="form-group">
        <label for="cityId">City</label>

    <form:input path="city" id="cityId" type="text"/>
    <form:errors path="city" element="div"></form:errors>
    </div>

    <div class="form-group">
        <label for="nameId">Name</label>

    <form:input path="name" id="nameId" type="text" />
    <form:errors path="name" element="div"></form:errors>
    </div>

    <div class="form-group">
        <label for="phoneNumberId">Phone Number</label>

    <form:input path="phoneNumber" id="phoneNumberId" type="text" />
    <form:errors path="phoneNumber" element="div"></form:errors>
    </div>

    <div class="form-group">
        <label for="openId">Open</label>

    <form:input path="open" id="openId" type="text"/>
    <form:errors path="open" element="div"></form:errors>
    </div>

    <div class="form-group">
        <label for="closeId">Close</label>

    <form:input path="close" id="closeId" type="text"/>
    <form:errors path="close" element="div"></form:errors>
    </div>

    <div class="form-group">
        <label for="workId">Work on saturdays</label>

        <form:checkbox path="workInSaturdays" id="workId" />
        <form:errors path="address" element="div"></form:errors>
    </div>

    <div class="form-group">
        <label for="nipId">Nip</label>

    <form:input path="nip" id="nipId" type="text" />
    <form:errors path="nip" element="div"></form:errors>
    </div>

    <div class="form-group">
        <label for="descriptionId">Description</label>

    <form:textarea path="description" id="descriptionId" type="text" rows="5" cols="40"/>
    <form:errors path="description" element="div"></form:errors>
    </div>

    <div class="form-group">
        <label for="passwordId">Password</label>

    <form:input path="password" id="passwordId" type="password"/>
    <form:errors path="password" element="div"></form:errors>
    </div>


    <div class="form-group">
        <label for="emailId">Email</label>

    <form:input path="email" id="emailId" type="email"/>
    <form:errors path="email" element="div"></form:errors>
    </div>

    <div class="form-group">
        <input type="submit" value="Submit">
    </div>

</form:form>
</div>

</body>
</html>
