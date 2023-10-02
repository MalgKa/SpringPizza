<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Items view</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  <link rel="stylesheet" href="/orderPanel.css" type="text/css">
</head>
<body class="order-panel">
<div class="container container-center w-50">
  <h1>Items in order:</h1>
  <ul>
    <c:forEach var="item" items="${items}">
      <li>${item.name} - ${item.price} ${item.shortDescription}</li>
    </c:forEach>
  </ul>
</div>

</body>
</html>