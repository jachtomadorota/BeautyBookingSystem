<%--
  Created by IntelliJ IDEA.
  User: dorotajachtoma
  Date: 07.08.19
  Time: 19:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<html>
<head>
    <title>Searching</title>
    <link href="<c:url value="/static/css/search.css" />" rel="stylesheet">

</head>
<body>
<%@include file="header.jsp"%>
<div class="contact-form">

      <form method="post" align="center" class="form-group" >
          <label for="formGroupExampleInput">City </label>
        <input id="formGroupExampleInput"  type="text" name="city">

         <input type="submit" value="Search" class="btn btn-dark" >

      </form>
</div>
<br/>
<br/>
<br/>
<br/>
<br/>



</body>
</html>
