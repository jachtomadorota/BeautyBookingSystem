<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dorotajachtoma
  Date: 12.08.19
  Time: 21:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Access Denied</title>
    <style>
        body{
            background-image: url("https://www.tailoredbarberco.com/wp-content/uploads/sites/312/2018/03/barber-background.jpg");
            background-repeat: no-repeat;
            background-position: center;
            background-size:cover;
        }
        body:before{
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
            -webkit-filter: blur(10px);
            -ms-filter: blur(10px);
            filter: blur(10px);
        }
        .contact-form
        {
            margin-left: 25%;
            position: center;
            width: 550px;
            margin-bottom: 14%;
            height: 100px;
            padding: 80px 40px;
            background: rgba(0,0,0,.5);
        }
        h2 {
            margin: 0;
            padding: 0 0 20px;
            color: #fff;
            text-align: center;
        }
        h3{
            color: #fff;
            text-align: center;
        }
    </style>
</head>
<body>
<br/><br/>
<div class="contact-form">

<h2>Sorry, you do not have permission to view this page</h2>
<h3>
Click <a href="http://localhost:8080/barbershop_war_exploded/">here</a>
to go back to the Homepage.
</h3>
</div>
</body>
</html>
