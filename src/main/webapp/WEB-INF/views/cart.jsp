<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cart</title>
</head>
<body>

<div>
    <c:forEach items="${cart.itemList}" var="item">
        <h2 style="display: inline">${item.name}</h2>
        <a href='<c:url value='/removeFromCart'><c:param name='itemId' value='${item.id}'/></c:url>'>delete</a>
        <h2>${item.price}</h2>
    </c:forEach>
   <button><a href="/removeAllFromCart">remove all dishes from the order</a></button>
    <h1>total order value:${sum}</h1>
</div>

<form action="/order/agreed" method="post">
    <input type="hidden" name="sum" value="${sum}">
    choose your table color:
    <select name="placeId">
        <c:forEach items="${placeList}" var="place">
            <option value="${place.id}">${place.color}</option>
        </c:forEach>
    </select>
    <button type="submit">confirm</button>
</form>
</body>
</html>