<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table>
    <tr>
        <th>name</th>
        <th>short description</th>
        <th>price</th>
        <th>action</th>
    </tr>
    <c:forEach items="${items}" var="item">
        <tr>
            <td>${item.name}</td>
            <td>${item.shortDescription}</td>
            <td>${item.price}</td>
            <td>
                <button><a href='<c:url value='/addToCart'><c:param name='itemId' value='${item.id}'/></c:url>'>add to order</a></button>
                <button><a href='<c:url value='/item/details'><c:param name='itemId' value='${item.id}'/></c:url>'>details</a></button>
            </td>
        </tr>
    </c:forEach>
</table>
<button><a href="/cart">order summary</a></button>
</body>
</html>
