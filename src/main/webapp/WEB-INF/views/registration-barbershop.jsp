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
</head>
<body>

<form:form method="post" modelAttribute="barbershop">
    <label for="enabledId"></label>
    <form:input path="enabled" id="enabledId" type="hidden"/>
    <label for="addressId">Address</label>
    <form:input path="address" id="addressId" type="text"/>
    <form:errors path="address" element="div"></form:errors>
    <br><br>
    <label for="cityId">City</label>
    <form:input path="city" id="cityId" type="text"/>
    <form:errors path="city" element="div"></form:errors>
    <br><br>
    <br><br>
    <label for="phoneNumberId">Phone Number</label>
    <form:input path="phoneNumber" id="phoneNumberId" type="text"/>
    <form:errors path="phoneNumber" element="div"></form:errors>
    <br>
    <br><br>
    <label for="openId">Open</label>
    <form:input path="open" id="openId" type="time" value="08:00:00"/>
    <form:errors path="open" element="div"></form:errors>
    <br>
    <br><br>
    <label for="closeId">Close</label>
    <form:input path="close" id="closeId" type="time" value="08:00:00"/>
    <form:errors path="close" element="div"></form:errors>
    <br>
    <br><br>
    <label for="nipId">Nip</label>
    <form:input path="nip" id="nipId" type="text"/>
    <form:errors path="nip" element="div"></form:errors>
    <br>
    <br><br>
    <label for="descriptionId">Description</label>
    <form:textarea path="description" id="descriptionId" type="text"/>
    <form:errors path="password" element="div"></form:errors>
    <br>
    <br><br>
    <label for="passwordId">Password</label>
    <form:input path="password" id="passwordId" type="password"/>
    <form:errors path="password" element="div"></form:errors>
    <br>

    <input type="submit" value="Submit">
</form:form>


</body>
</html>
