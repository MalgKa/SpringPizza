<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/125cf097bb.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/css/cart.css" type="text/css">
</head>
<body class="cart">
<div class="d-flex flex-column justify-content-center align-items-center cart-container">
    <h1 class="mb-5">summary of your order: ${sum} zł</h1>
    <div class="w-50">
        <table class="table table-hover">
            <c:forEach items="${sortedItemList}" var="item">
                <tr>
                    <td>${item.name}</td>
                    <td>${item.price}</td>
                    <td><a href='<c:url value='/removeFromCart'><c:param name='itemId' value='${item.id}'/></c:url>'
                           class="btn btn-primary">delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <div class="control-buttons">
            <a href="/removeAllFromCart" class="btn btn-danger cart-link">remove all dishes from the order<i
                    class="fa-solid fa-trash"></i></a>
            <a href="/home" class="btn btn-success">back to menu<i
                    class="fa-solid fa-arrow-rotate-left fa-spin fa-spin-reverse"></i></a>
        </div>
    </div>
    <div class="confirmation">
        <form action="/cart/agreed" method="post">
            <input type="hidden" name="sum" value="${sum}">
            <h2 class="d-inline">choose your table below:</h2>
            <div class="my-card">
                <input class=place1 type="radio" name="placeId" value="${placeList[0].id}" checked="checked">
                <input class=place2 type="radio" name="placeId" value="${placeList[1].id}">
                <input class=place3 type="radio" name="placeId" value="${placeList[2].id}">
                <input class=place4 type="radio" name="placeId" value="${placeList[3].id}">
                <input class=place5 type="radio" name="placeId" value="${placeList[4].id}">
                <input class=place6 type="radio" name="placeId" value="${placeList[5].id}">
                <input class=place7 type="radio" name="placeId" value="${placeList[6].id}">
                <input class=place8 type="radio" name="placeId" value="${placeList[7].id}">
                <input class=place9 type="radio" name="placeId" value="${placeList[8].id}">
            </div>
            <button type="submit" class="btn btn-info cart-link confirm">confirm<i class="fa-solid fa-check"></i></button>
        </form>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>