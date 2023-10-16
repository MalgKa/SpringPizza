<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/addItem.css" type="text/css">
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
        <div class="form-box-radio">
            <label for="available">available</label>
            <form:radiobutton path="availability" value="Y" checked="checked" id="available"/>

            <label for="unavailable">unavailable</label>
            <form:radiobutton path="availability" value="N" id="unavailable"/>

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