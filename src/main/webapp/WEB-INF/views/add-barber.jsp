<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: dorotajachtoma
  Date: 28.07.19
  Time: 19:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Barber</title>
</head>
<body>

<form:form method="post" modelAttribute="barber">

    <label for="id"></label>
    <form:input path="id" id="id" type="hidden"/>

    <label for="nameId">Name</label>
    <form:input path="name" id="nameId" type="text"/>
    <form:errors path="name" element="div"></form:errors>
    <br><br>

    <input type="submit" value="Submit">
</form:form>


</body>
</html>
