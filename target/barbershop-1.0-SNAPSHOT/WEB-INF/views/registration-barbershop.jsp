<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <link href="<c:url value="/static/css/registration-barbershop.css" />" rel="stylesheet">

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
