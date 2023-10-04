<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/125cf097bb.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Fredericka+the+Great&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/customerPanel.css" type="text/css">
</head>
<body class="home">
<div class="my-grid-container">
    <div class="container w-60 my-gird">
        <h1 class="menu-text">M E N U</h1>
        <h3>PIZZA</h3>
        <table class="table table-striped table-hover home-table">
            <tr>
                <th class="col-3">name</th>
                <th class="col-5">short description</th>
                <th class="col-1">price</th>
                <th class="col-3"></th>
            </tr>
            <c:forEach items="${pizzaList}" var="item">
                <tr>
                    <td>${item.name}</td>
                    <td>${item.shortDescription}</td>
                    <td>${item.price}</td>
                    <td>
                        <a href='<c:url value='/addToCart'><c:param name='itemId' value='${item.id}'/></c:url>'
                           class="btn btn-primary">add to order<i class="fa-solid fa-pizza-slice fa-beat"></i></a>
                        <a href='<c:url value='/item/details'><c:param name='itemId' value='${item.id}'/></c:url>'
                           class="btn btn-warning">details<i class="fa-solid fa-circle-info fa-shake"></i></a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <h3>PASTA</h3>
        <table class="table table-striped table-hover home-table">
            <tr>
                <th class="col-3">name</th>
                <th class="col-5">short description</th>
                <th class="col-1">price</th>
                <th class="col-3"></th>
            </tr>
            <c:forEach items="${pastaList}" var="item">
                <tr>
                    <td>${item.name}</td>
                    <td>${item.shortDescription}</td>
                    <td>${item.price}</td>
                    <td>
                        <a href='<c:url value='/addToCart'><c:param name='itemId' value='${item.id}'/></c:url>'
                           class="btn btn-primary">add to order<i class="fa-solid fa-pizza-slice fa-beat"></i></a>
                        <a href='<c:url value='/item/details'><c:param name='itemId' value='${item.id}'/></c:url>'
                           class="btn btn-warning">details<i class="fa-solid fa-circle-info fa-shake"></i></a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <h3>DESSERT</h3>
        <table class="table table-striped table-hover home-table">
            <tr>
                <th class="col-3">name</th>
                <th class="col-5">short description</th>
                <th class="col-1">price</th>
                <th class="col-3"></th>
            </tr>
            <c:forEach items="${dessertList}" var="item">
                <tr>
                    <td>${item.name}</td>
                    <td>${item.shortDescription}</td>
                    <td>${item.price}</td>
                    <td>
                        <a href='<c:url value='/addToCart'><c:param name='itemId' value='${item.id}'/></c:url>'
                           class="btn btn-primary">add to order<i class="fa-solid fa-pizza-slice fa-beat"></i></a>
                        <a href='<c:url value='/item/details'><c:param name='itemId' value='${item.id}'/></c:url>'
                           class="btn btn-warning">details<i class="fa-solid fa-circle-info fa-shake"></i></a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <h3>DRINKS</h3>
        <table class="table table-striped table-hover home-table">
            <tr>
                <th class="col-3">name</th>
                <th class="col-5">short description</th>
                <th class="col-1">price</th>
                <th class="col-3"></th>
            </tr>
            <c:forEach items="${drinksList}" var="item">
                <tr>
                    <td>${item.name}</td>
                    <td>${item.shortDescription}</td>
                    <td>${item.price}</td>
                    <td>
                        <a href='<c:url value='/addToCart'><c:param name='itemId' value='${item.id}'/></c:url>'
                           class="btn btn-primary">add to order<i class="fa-solid fa-pizza-slice fa-beat"></i></a>
                        <a href='<c:url value='/item/details'><c:param name='itemId' value='${item.id}'/></c:url>'
                           class="btn btn-warning">details<i class="fa-solid fa-circle-info fa-shake"></i></a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <button class="btn btn-success"><a href="/cart" class="text-white text-decoration-none">order summary<i class="fa-solid fa-basket-shopping fa-bounce"></i></a></button>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>
