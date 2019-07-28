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
</head>
<body>

<form:form method="post" modelAttribute="user">
    <label for="firstNameId">First Name</label>
    <form:input path="firstName" id="firstNameId" type="text"/>
    <form:errors path="firstName" element="div"></form:errors>
    <br><br>
    <label for="lastNameId">Last Name</label>
    <form:input path="lastName" id="lastNameId" type="text"/>
    <form:errors path="lastName" element="div"></form:errors>
    <br><br>
    <label for="emailId">Email</label>
    <form:input path="email" id="emailId" type="email"/>
    <form:errors path="email" element="div"></form:errors>
    <br>
    <br><br>
    <label for="passwordId">Password</label>
    <form:input path="password" id="passwordId" type="password"/>
    <form:errors path="password" element="div"></form:errors>
    <br>
    <br><br>
    <label for="phoneNumberId">Phone Number</label>
    <form:input path="phoneNumber" id="phoneNumberId" type="text"/>
    <form:errors path="phoneNumber" element="div"></form:errors>
    <br>
    <input type="submit" value="Submit">
</form:form>

</body>
</html>
