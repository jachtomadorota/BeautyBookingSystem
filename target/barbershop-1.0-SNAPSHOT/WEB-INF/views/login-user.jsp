<%--
  Created by IntelliJ IDEA.
  User: dorotajachtoma
  Date: 28.07.19
  Time: 16:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Login as a user</title>
</head>
<body>

<form:form method="post" modelAttribute="user">

    <div class="container">

        <h3 class="header">Logowanie</h3>

        <div class="card">
            <div class="card-body">

                <div class="form-group">
                    <label for="emailId">Email:</label>
                    <form:input type="text" path="email" id="emailId" class="form-control"/>
                    <form:errors path="email" element="div" cssClass="error"/>
                </div>

                <div class="form-group">
                    <label for="passwordId">Password:</label>
                    <form:input type="password" path="password" id="passwordId" class="form-control"/>
                    <form:errors path="password" element="div" cssClass="error"/>
                </div>
                <input type="submit" class="btn btn-primary" value="Login">

            </div>
        </div>

    </div>
</form:form>

</body>
</html>
