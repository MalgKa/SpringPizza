<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>order panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/orderPanel.css" type="text/css">
</head>
<body class="order-panel">

<div class="container container-center w-50">
    <a href="/home" class="btn btn-home">MENU</a>
    <h1 class="mb-5 admin-panel-text">Admin Panel</h1>
    <div class="d-md-flex flex-row gap-4 order-panel-flex mb-2">

        <a href="/order/panel" class="btn btn-dark col text-decoration-none text-white fw-bold">All</a>

        <a href="/order/panel?statusId=${statusList[0].id}"
           class=" btn btn-success col text-decoration-none link-body-emphasis fw-bold tt" data-bs-placement="top"
           data-bs-custom-class="custom-tooltip" title="${statusList[0].description}">${statusList[0].name}</a>

        <a href="/order/panel?statusId=${statusList[1].id}"
           class="btn btn-warning col text-decoration-none link-body-emphasis fw-bold tt" data-bs-placement="top"
           data-bs-custom-class="custom-tooltip" title="${statusList[1].description}">${statusList[1].name}</a>

        <a href="/order/panel?statusId=${statusList[2].id}"
           class="btn btn-info col text-decoration-none link-body-emphasis fw-bold tt" data-bs-placement="top"
           data-bs-custom-class="custom-tooltip" title="${statusList[2].description}">${statusList[2].name}</a>

        <a href="/order/panel?statusId=${statusList[3].id}"
           class="btn btn-danger col text-decoration-none link-body-emphasis fw-bold tt" data-bs-placement="top"
           data-bs-custom-class="custom-tooltip" title="${statusList[3].description}">${statusList[3].name}</a>


    </div>
    <table class="table table-striped table-hover opacity-75 order-panel-table">
        <thead>
        <tr>
            <th scope="col">order id</th>
            <th scope="col">time</th>
            <th scope="col">place</th>
            <th scope="col">status</th>
            <th scope="col">sum</th>
            <th scope="col">action</th>
            <th scope="col">change Status</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${orderList}" var="order">
            <tr>
                <c:choose>
                    <c:when test="${orderToedit !=null and orderToedit.id==order.id}">
                        <form:form method="post" modelAttribute="orderToedit">
                            <td>${order.id}</td>
                            <td><form:input path="orderTime" class="order-input"/></td>
                            <td><form:select path="place.id" items="${placeList}" itemValue="id" itemLabel="color"
                                             class="order-select place"/></td>
                            <td><form:select path="status.id" items="${statusList}" itemValue="id" itemLabel="name"
                                             class="order-select status"/></td>
                            <td><form:input path="sum" class="order-input sum"/></td>
                            <form:hidden path="id"/>
                            <form:hidden path="itemList"/>;
                            <td><form:button class="btn btn-danger btn-sm" name="edit">save</form:button>
                                <a href="/order/panel"
                                   class="btn btn-info btn-sm text-decoration-none text-white">back</a>
                            </td>
                            <td><a href="/order/changeStatus?statusId=${statusList[1].id}&orderId=${order.id}"
                                   class="btn btn-warning btn-sm text-decoration-none text-dark">${statusList[1].name}</a>
                                <a href="/order/changeStatus?statusId=${statusList[2].id}&orderId=${order.id}"
                                   class="btn btn-info btn-sm text-decoration-none text-dark">${statusList[2].name}</a>
                                <a href="/order/changeStatus?statusId=${statusList[3].id}&orderId=${order.id}"
                                   class="btn btn-danger btn-sm text-decoration-none text-dark">${statusList[3].name}</a>
                                <a href="/order/discount?orderId=${order.id}&sumOfOrder=${order.sum}"
                                   class="btn btn-secondary btn-sm text-decoration-none text-white">discount 10%</a>
                            </td>
                        </form:form>
                    </c:when>

                    <c:otherwise>
                        <td>${order.id}</td>
                        <td class="timestamp">${order.orderTimeFormatted}</td>
                        <td>${order.place.color}</td>
                        <td class="establishedStatus">${order.status.name}</td>
                        <td>${order.sum}</td>
                        <td>
                            <a href="/order/items?orderId=${order.id}"
                               class="btn btn-secondary btn-sm text-decoration-none">details</a>

                            <a href="/order/panel?orderToEditId=${order.id}"
                               class="btn btn-success btn-sm text-decoration-none link-light">edit</a>
                        <td>

                            <a href="/order/changeStatus?statusId=${statusList[1].id}&orderId=${order.id}"
                               class="btn btn-warning btn-sm text-decoration-none text-dark">${statusList[1].name}</a>
                            <a href="/order/changeStatus?statusId=${statusList[2].id}&orderId=${order.id}"
                               class="btn btn-info btn-sm text-decoration-none text-dark">${statusList[2].name}</a>
                            <a href="/order/changeStatus?statusId=${statusList[3].id}&orderId=${order.id}"
                               class="btn btn-danger btn-sm text-decoration-none text-dark">${statusList[3].name}</a>
                            <a href="/order/discount?orderId=${order.id}&sumOfOrder=${order.sum}"
                               class="btn btn-secondary btn-sm text-decoration-none text-white">discount 10%</a>
                        </td>

                    </c:otherwise>

                </c:choose>
            </tr>
        </c:forEach>

        </tbody>
    </table>
    <div class="d-flex flex-row">
        <a href="/admin/addItem" class="btn btn-info btn-sm text-decoration-none text-white">add item</a>
        <a href="/admin/itemList" class="btn btn-light btn-sm text-decoration-none text-dark">items in the menu</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
<script src="/test.js"></script>
</body>
</html>
