<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/125cf097bb.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/css/error.css" type="text/css">
</head>
<body class="error-page">
<div class="error-container">
    <img src="../img/warning-sign.png" alt="warning">
    <h1 class="error-cause">${error}</h1>
    <c:choose>
        <c:when test="${status==500}">
            <h1>It looks like we broke something, We're fixing it as fast as we can</h1>
            <a href="/home" class="btn btn-success"> Go to home page <i
                    class="fa-solid fa-arrow-rotate-left fa-spin fa-spin-reverse"></i></a>
        </c:when>
        <c:when test="${status==404}">
            <h1>The page you're looking for doesn't exist.You might have mistyped the URL</h1>
            <a href="/home" class="btn btn-success"> Go to home page <i
                    class="fa-solid fa-arrow-rotate-left fa-spin fa-spin-reverse"></i></a>
        </c:when>
        <c:otherwise>
            <h1>${message}</h1>
            <c:if test="${not empty backlink}">
                <a href="${backlink}" class="btn btn-success"> Back <i
                        class="fa-solid fa-arrow-rotate-left fa-spin fa-spin-reverse"></i></a>
            </c:if>
            <c:if test="${empty backlink}">
                <a href="/home" class="btn btn-success"> Go to home page <i
                        class="fa-solid fa-arrow-rotate-left fa-spin fa-spin-reverse"></i></a>
            </c:if>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>
