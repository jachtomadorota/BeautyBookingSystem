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
            form{
                width: 500px;
                align-items: center;
            }
            #formDiv{
                align-items: center;
            }
            p{
                align-items: center;
            }
        </style>
</head>
<body>
<%@include file="header.jsp"%>

<br/>
<br/>
<h3 align="center">Sign up</h3>
<div align="center" id="formDiv">
<form:form method="post" modelAttribute="barbershop" align="center">

    <form:input path="id" id="idId" type="hidden" class="form-control"/>
    <form:errors path="id" element="div"></form:errors>

    <div class="form-group">
        <label for="addressId">Address</label>

    <form:input path="address" id="addressId" type="text" class="form-control"/>
    <form:errors path="address" element="div"></form:errors>
    </div>


    <div class="form-group">
        <label for="cityId">City</label>

    <form:input path="city" id="cityId" type="text" class="form-control"/>
    <form:errors path="city" element="div"></form:errors>
    </div>

    <div class="form-group">
        <label for="nameId">Name</label>

    <form:input path="name" id="nameId" type="text" class="form-control"/>
    <form:errors path="name" element="div"></form:errors>
    </div>

    <div class="form-group">
        <label for="phoneNumberId">Phone Number</label>

    <form:input path="phoneNumber" id="phoneNumberId" type="text" class="form-control"/>
    <form:errors path="phoneNumber" element="div"></form:errors>
    </div>

    <div class="form-group">
        <label for="openId">Open</label>

    <form:input path="open" id="openId" type="text" class="form-control"/>
    <form:errors path="open" element="div"></form:errors>
    </div>

    <div class="form-group">
        <label for="closeId">Close</label>

    <form:input path="close" id="closeId" type="text" class="form-control"/>
    <form:errors path="close" element="div"></form:errors>
    </div>

    <div class="form-group">
        <label for="workId">Work on saturdays</label>

        <form:checkbox path="workInSaturdays" id="workId" class="form-control"/>
        <form:errors path="address" element="div"></form:errors>
    </div>

    <div class="form-group">
        <label for="nipId">Nip</label>

    <form:input path="nip" id="nipId" type="text" class="form-control"/>
    <form:errors path="nip" element="div"></form:errors>
    </div>

    <div class="form-group">
        <label for="descriptionId">Description</label>

    <form:textarea path="description" id="descriptionId" type="text" class="form-control"/>
    <form:errors path="description" element="div"></form:errors>
    </div>

    <div class="form-group">
        <label for="passwordId">Password</label>

    <form:input path="password" id="passwordId" type="password" class="form-control"/>
    <form:errors path="password" element="div"></form:errors>
    </div>


    <div class="form-group">
        <label for="emailId">Email</label>

    <form:input path="email" id="emailId" type="email" class="form-control"/>
    <form:errors path="email" element="div"></form:errors>
    </div>

    <div class="form-group">
        <input type="submit" class="btn btn-default" value="Submit">
    </div>

</form:form>
</div>

</body>
</html>
