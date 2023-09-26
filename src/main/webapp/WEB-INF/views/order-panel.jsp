<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
            <c:choose>
                <c:when test="${orderToedit !=null and orderToedit.id==order.id}">
                    <form:form method="post" modelAttribute="orderToedit">
                        <td>${order.id}</td>
                        <td><form:input path="orderTime"/></td>
                        <td><form:input path="place.color"/></td>
                        <td><form:input path="status.name"/></td>
                        <td><form:input path="sum"/></td>
                        <td><form:button name="edit"/>save changes
                            <form:button><a href="/order/panel">back</a></form:button>
                        </td>
                    </form:form>
                </c:when>

               <c:otherwise>
                   <td>${order.id}</td>
                   <td>${order.orderTime}</td>
                   <td>${order.place.color}</td>
                   <td>${order.status.name}</td>
                   <td>${order.sum}</td>
                   <td>
                       <button><a href="/items/order?orderId=${order.id}">details</a></button>
                       <button><a href="/order/panel?orderId=${order.id}">edit</a></button>
                   </td>
               </c:otherwise>

            </c:choose>
        </tr>
    </c:forEach>


</table>
</body>
</html>
