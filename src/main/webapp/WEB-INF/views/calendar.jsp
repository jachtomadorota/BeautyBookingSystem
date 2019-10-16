<%--
  Created by IntelliJ IDEA.
  User: dorotajachtoma
  Date: 04.08.19
  Time: 18:41
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE HTML>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8">
    <title>Choose date</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        var dateToday = new Date();
        var work = ${work};
        $(function() {
            $( "#datepicker" ).datepicker({
                numberOfMonths: 3,
                showButtonPanel: true,
                minDate: dateToday,
                changeYear : false,
                maxDate: new Date('12/31/2019'),
                stepMonths: 1,
                beforeShowDay: function(date) {
                    if(work === true) {
                        var day = date.getDay();
                        return [(day != 0), ''];
                        }else{
                        var day = date.getDay();
                        return [(day != 0 && day != 6),'']
                    }
                    }

            });
        });
    </script>
    <link href="<c:url value="/static/css/calendar.css" />" rel="stylesheet">

</head>
<body>
<%@include file="header.jsp"%>

<br/><br/><br/>
<div class="datepicker">
<form method="post" align="center" >
    <input type="text" id="datepicker" name="date"/>
    <input type="submit" value="confirm"/>
</form>
</div>


</body>
</html>