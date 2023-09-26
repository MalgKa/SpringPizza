<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Items view</title>
</head>
<body>
<h1>Items in order:</h1>
<ul>
  <c:forEach var="item" items="${items}">
    <li>${item.name} - ${item.price} ${item.shortDescription}</li>
  </c:forEach>
</ul>
</body>
</html>