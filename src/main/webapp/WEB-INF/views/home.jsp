<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="/main.css" type="text/css">
</head>
<body class="home">

<div class="container container-center w-50">
<table class="table">
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
                <a href='<c:url value='/addToCart'><c:param name='itemId' value='${item.id}'/></c:url>' class="btn btn-primary">add to order</a>
                <a href='<c:url value='/item/details'><c:param name='itemId' value='${item.id}'/></c:url>' class="btn btn-warning">details</a>
            </td>
        </tr>
    </c:forEach>
</table>
<button><a href="/cart">order summary</a></button>
    </div>
</body>
</html>
