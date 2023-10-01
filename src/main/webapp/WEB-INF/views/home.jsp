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
<div class="my-grid-container">
    <div class="container w-60 my-gird">
        <h1 class="menu-text">M E N U</h1>
        <h3>pizza</h3>
        <table class="table">
            <tr>
                <th>name</th>
                <th>short description</th>
                <th>price</th>
                <th>action</th>
            </tr>
            <c:forEach items="${pizzaList}" var="item">
                <tr>
                    <td>${item.name}</td>
                    <td>${item.shortDescription}</td>
                    <td>${item.price}</td>
                    <td>
                        <a href='<c:url value='/addToCart'><c:param name='itemId' value='${item.id}'/></c:url>'
                           class="btn btn-primary">add to order</a>
                        <a href='<c:url value='/item/details'><c:param name='itemId' value='${item.id}'/></c:url>'
                           class="btn btn-warning">details</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <h3>drink</h3>
        <table class="table">
            <tr>
                <th>name</th>
                <th>short description</th>
                <th>price</th>
                <th>action</th>
            </tr>
            <c:forEach items="${drinksList}" var="item">
                <tr>
                    <td>${item.name}</td>
                    <td>${item.shortDescription}</td>
                    <td>${item.price}</td>
                    <td>
                        <a href='<c:url value='/addToCart'><c:param name='itemId' value='${item.id}'/></c:url>'
                           class="btn btn-primary">add to order</a>
                        <a href='<c:url value='/item/details'><c:param name='itemId' value='${item.id}'/></c:url>'
                           class="btn btn-warning">details</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <h3>desert</h3>
        <table class="table">
            <tr>
                <th>name</th>
                <th>short description</th>
                <th>price</th>
                <th>action</th>
            </tr>
            <c:forEach items="${dessertList}" var="item">
                <tr>
                    <td>${item.name}</td>
                    <td>${item.shortDescription}</td>
                    <td>${item.price}</td>
                    <td>
                        <a href='<c:url value='/addToCart'><c:param name='itemId' value='${item.id}'/></c:url>'
                           class="btn btn-primary">add to order</a>
                        <a href='<c:url value='/item/details'><c:param name='itemId' value='${item.id}'/></c:url>'
                           class="btn btn-warning">details</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <h3>pasta</h3>
        <table class="table">
            <tr>
                <th>name</th>
                <th>short description</th>
                <th>price</th>
                <th>action</th>
            </tr>
            <c:forEach items="${pastaList}" var="item">
                <tr>
                    <td>${item.name}</td>
                    <td>${item.shortDescription}</td>
                    <td>${item.price}</td>
                    <td>
                        <a href='<c:url value='/addToCart'><c:param name='itemId' value='${item.id}'/></c:url>'
                           class="btn btn-primary">add to order</a>
                        <a href='<c:url value='/item/details'><c:param name='itemId' value='${item.id}'/></c:url>'
                           class="btn btn-warning">details</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <button class="btn btn-success"><a href="/cart" class="text-white text-decoration-none">order summary</a></button>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>
