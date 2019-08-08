<%--
  Created by IntelliJ IDEA.
  User: dorotajachtoma
  Date: 07.08.19
  Time: 21:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Reservation</title>
</head>
<body><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<form:form method="post" modelAttribute="reservation">

    <label for="Id"></label>
    <form:input path="id" id="Id" type="hidden"/>
    <br><br>
    <label for="userId">User</label>
    <form:input path="user.id" id="userId" type="hidden" itemValue="id" items="${user.id}"/>
    <form:errors path="user" element="div"></form:errors>
    <br><br>
    <label for="barbershopId"></label>
    <form:input path="barbershop.id" id="barbershopId" type="hidden" itemValue="id" items="${barbershop.id}"/>
    <form:errors path="barbershop" element="div"></form:errors>
    <br><br>
    <br><br>
    <label for="barberId">Barber</label>
    <form:select path="barber.id" items="${barbers}" itemLabel="name" itemValue="id" id="barberId"/>
    <form:errors path="barber" element="div"></form:errors>
    <br>
    <br><br>
    <label for="serviceId">Service</label>
    <form:select path="service.id" items="${services}" itemLabel="name" itemValue="id" id="serviceId"/>
    <form:errors path="service" element="div"></form:errors>
    <br>
    <br><br>
    <div class="input-append date form_datetime">
        <input size="16" type="text" value="" readonly>
        <span class="add-on"><i class="icon-th"></i></span>
    </div>

    <script type="text/javascript">
        $(".form_datetime").datetimepicker({
            format: "dd MM yyyy - hh:ii"
        });
    </script>

    <input type="submit" value="Submit">
</form:form>


</body>
</html>
