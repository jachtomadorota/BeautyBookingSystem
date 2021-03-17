<%--
  Created by IntelliJ IDEA.
  User: dorotajachtoma
  Date: 04.08.19
  Time: 11:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Add/Update services</title>

        <link href="<c:url value="/static/css/add-service.css" />" rel="stylesheet">


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
