<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cart</title>
</head>
<body>

<div>
    <c:forEach items="${cart.itemList}" var="item">
        <h2>${item.name}</h2>
        <h2>${item.price}</h2>
    </c:forEach>
    <h1>${sum}</h1>
</div>


<%--form z numerem stolika--%>
</body>
</html>