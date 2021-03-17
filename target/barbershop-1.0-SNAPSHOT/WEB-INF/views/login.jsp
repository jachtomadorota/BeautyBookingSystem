<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <title>Login</title>
    <link href="<c:url value="/static/css/login.css" />" rel="stylesheet">

    <script>
        var login = "${loged}";
        function myFunction() {
            if (login === false) {
            var popup = document.getElementById("myPopup");
            popup.classList.toggle("show");
        }
        }
    </script>
</head>
<body>
<%@include file="header.jsp"%>

<br/>
<br/>
<br/>
<div class="contact-form">

<form name='f' action="login" method='POST' class="form-group" >

    <p align="center">Email</p>
    <label for="formGroupExampleInput1"></label>
            <input type='text' name='username' id="formGroupExampleInput1" value='' placeholder="Enter Email" >

    <p align="center">Password</p>
            <label for="formGroupExampleInput"></label>
            <input type='password' id="formGroupExampleInput"  name='password' placeholder="Enter Password" />
    <p><input name="submit" class="btn btn-dark" type="submit" value="Login" /></p>
</form>
</div>

</body>
</html>