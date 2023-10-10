<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <head>
        <title>Title</title>
        <%--    <meta charset="utf-8">--%>
        <%--    <meta name="viewport" content="width=device-width, initial-scale=1">--%>
<%--        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"--%>
<%--              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"--%>
<%--              crossorigin="anonymous">--%>
        <link rel="stylesheet" href="/addItem.css" type="text/css">
    </head>
</head>
<body class="add-item">
<div class="wrapper">
<form:form method="post" modelAttribute="item" action="/admin/addItem">
    <h2>ADD DISH TO THE MENU</h2>
    <div class="form-box">
        <label for="name">name: </label>
        <form:input path="name" id="name" placeholder="name of the dish"/>
        <p class="error-text">this field cannot be empty</p>
    </div>
    <div class="form-box">
        <label for="shortdescription">short description:</label>
        <form:input path="shortDescription" id="shortdescription" placeholder="short description of the dish"/>
        <p class="error-text">this field cannot be empty</p>
    </div>
    <div class="form-box">
        <label for="description">description:</label>
        <form:textarea path="description" id="description" placeholder="description of the dish with details"/>
        <p class="error-text">this field cannot be empty</p>
    </div>

    <div class="form-box">
        <label for="price">price:</label>
        <form:input path="price" id="price" placeholder="0.00"/>
        <p class="error-text">this field cannot be empty</p>
    </div>

    <div class="form-box">
        <label for="type">type:</label>
        <form:input path="type" id="type" placeholder="drink / pizza / pasta"/>
        <p class="error-text">this field cannot be empty</p>
    </div>

    <div class="form-box">
        <label for="imgUrl">imgUrl</label>
        <form:input path="imgUrl" id="imgUrl" value="/img/"/>
        <p class="error-text">error</p>
    </div>
    <div class="control-buttons">
        <a href="/order/panel" class="back">back</a>
        <button type="submit" class="save">save</button>
    </div>
<div class="popup">
    <h3>the dish has been saved in the menu :)</h3>
</div>

</form:form>

</div>

<script src="/itemform.js"></script>
</body>
</html>
