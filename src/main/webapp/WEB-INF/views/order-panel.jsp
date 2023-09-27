<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>Title</title>
    <%--    <meta charset="utf-8">--%>
    <%--    <meta name="viewport" content="width=device-width, initial-scale=1">--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="/main.css" type="text/css">
</head>
<body class="order-panel">

<div class="container container-center w-50">
    <h1 class="mb-5 admin-panel-text">Admin Panel</h1>
    <div class="d-md-flex flex-row gap-4 order-panel-flex mb-2">

        <a href="/order/panel" class="btn btn-dark col text-decoration-none text-white">All</a>

        <a href="/order/panel?statusId=${statusList[0].id}"
           class=" btn btn-success col text-decoration-none link-body-emphasis">${statusList[0].name}</a>

        <a href="/order/panel?statusId=${statusList[1].id}"
           class="btn btn-warning col text-decoration-none link-body-emphasis">${statusList[1].name}</a>

        <a href="/order/panel?statusId=${statusList[2].id}"
           class="btn btn-info col text-decoration-none link-body-emphasis">${statusList[2].name}</a>

        <a href="/order/panel?statusId=${statusList[3].id}"
           class="btn btn-danger col text-decoration-none link-body-emphasis">${statusList[3].name}</a>


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
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${orderList}" var="order">
            <tr>
                <c:choose>
                    <c:when test="${orderToedit !=null and orderToedit.id==order.id}">
                        <form:form method="post" modelAttribute="orderToedit">
                            <td>${order.id}</td>
                            <td><form:input path="orderTime"/></td>
                            <td><form:select path="place.id" items="${placeList}" itemValue="id"
                                             itemLabel="color"/></td>
                            <td><form:select path="status.id" items="${statusList}" itemValue="id"
                                             itemLabel="name"/></td>
                            <td><form:input path="sum"/></td>
                            <form:hidden path="id"/>
                            <form:hidden path="itemList"/>;
                            <td><form:button class="btn btn-danger" name="edit">save changes</form:button>
                                <a href="/order/panel" class="btn btn-info link dark text-decoration-none text-white">back</a>
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
                            <a href="/items/order?orderId=${order.id}"
                               class="btn btn-warning text-decoration-none link-body-emphasis">details</a>

                            <a href="/order/panel?orderToEditId=${order.id}"
                               class="btn btn-success text-decoration-none link-light">edit</a>
                        </td>
                    </c:otherwise>

                </c:choose>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>
