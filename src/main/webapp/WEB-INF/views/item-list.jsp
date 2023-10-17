<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>item list</title>
</head>
<body>
<table cellspacing="2" border="1">
    <tr>
        <th>id</th>
        <th>name</th>
        <th>short description</th>
        <th>description</th>
        <th>price</th>
        <th>type</th>
        <th>availability</th>
        <th>img url</th>
    </tr>
    <c:forEach items="${items}" var="item">
        <tr>
            <td>${item.id}</td>
            <td>${item.name}</td>
            <td>${item.shortDescription}</td>
            <td>${item.description}</td>
            <td>${item.price}</td>
            <td>${item.type}</td>
            <td>${item.availability}</td>
            <td>${item.imgUrl}</td>
            <td><a href="/admin/delete?id=${item.id}">delete</a></td>
            <td><a href="/admin/update?id=${item.id}">update</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>