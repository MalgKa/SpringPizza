<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Items view</title>
  <link rel="stylesheet" href="/css/orderDetails.css" type="text/css">
</head>
<body class="order-details">
<div class="wrapper">
  <div class="title">
    <p>Items in order: ${orderId}</p>
  </div>
  <div class="items-card">
    <c:forEach var="item" items="${items}">
      <li>${item.name} - ${item.price} zł <span>(${item.shortDescription})</span></li>
    </c:forEach>
  </div>
</div>
<a href="/order/panel" class="link-btn">back</a>
</body>
</html>