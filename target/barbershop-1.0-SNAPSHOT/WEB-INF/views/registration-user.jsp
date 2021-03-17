<%--
  Created by IntelliJ IDEA.
  User: dorotajachtoma
  Date: 28.07.19
  Time: 12:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<html>
<head>
    <title>Registration as a User</title>
    <link href="<c:url value="/static/css/registration-user.css" />" rel="stylesheet">

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
