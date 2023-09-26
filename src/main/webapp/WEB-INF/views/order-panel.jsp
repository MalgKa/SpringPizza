<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/main.css" type="text/css">
</head>
<body class="order-panel">
<h1>Admin Panel</h1>
<table cellspacing="3" border="2">
    <tr>
        <th>order id</th>
        <th>time</th>
        <th>place</th>
        <th>status</th>
        <th>sum</th>
        <th>action</th>
    </tr>
    <c:forEach items="${orderList}" var="order">
        <tr>
            <td>${order.id}</td>
            <td>${order.orderTime}</td>
            <td>${order.place.color}</td>
            <td>${order.status.name}</td>
            <td>${order.sum}</td>
            <td>
                <button>details</button>
                <button>change status</button>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
