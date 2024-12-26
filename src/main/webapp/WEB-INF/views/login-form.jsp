<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Log in</title>
    <script src="https://kit.fontawesome.com/125cf097bb.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/login.css">
</head>
<body class="login-container">
<div class="container">
    <h1 class="login-header">LOG IN</h1>
    <div class="img"></div>
    <form action="/login" method="post" class="login-form">
        <input name="username" placeholder="Username" class="form-item">
        <input type="password" name="password" placeholder="Password" class="form-item">
        <button type="submit" class="form-item">Log in</button>
    </form>
    <c:if test="${not empty param.error}">
        <div class="error-message">
            <i class="fa-solid fa-circle-exclamation"></i>
            <p>Invalid username or password. Please try again.</p>
        </div>
    </c:if>
</div>
</body>
</html>
