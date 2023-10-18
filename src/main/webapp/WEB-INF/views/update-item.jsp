<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>update item</title>
    <link rel="stylesheet" href="/css/addItem.css" type="text/css">
</head>
<body class="add-item">
<div class="wrapper">
    <form:form method="post" modelAttribute="item">
        <h2>Change item</h2>
        <div class="form-box">
            <label>name: </label>
            <form:input path="name"/>
            <form:errors path="name"/>
            <p class="error-text">this field cannot be empty</p>
        </div>
        <div class="form-box">
            <label for="shortdescription">short description:</label>
            <form:input path="shortDescription" id="shortdescription"/>
            <form:errors path="shortDescription"/>
            <p class="error-text">this field cannot be empty</p>
        </div>
        <div class="form-box">
            <label for="description">description:</label>
            <form:textarea path="description" id="description"/>
            <form:errors path="description"/>
            <p class="error-text">this field cannot be empty</p>
        </div>

        <div class="form-box">
            <label for="price">price:</label>
            <form:input path="price" id="price"/>
            <form:errors path="price"/>
            <p class="error-text">this field cannot be empty</p>
        </div>

        <div class="form-box">
            <label for="type">type:</label>
            <form:input path="type" id="type"/>
            <form:errors path="type"/>
            <p class="error-text">this field cannot be empty</p>
        </div>

        <div class="form-box">
            <label for="imgUrl">imgUrl</label>
            <form:input path="imgUrl" id="imgUrl"/>
            <p class="error-text">error</p>
        </div>
        <div class="form-box-radio">
            <label for="available">available</label>
            <form:radiobutton path="availability" value="Y" id="available"/>

            <label for="unavailable">unavailable</label>
            <form:radiobutton path="availability" value="N" id="unavailable"/>

        </div>

        <div class="control-buttons">
            <a href="/order/panel" class="back">order panel</a>
            <a href="/admin/itemList" class="back">back</a>
            <button type="submit" class="save">save</button>
        </div>
        <div class="popup">
            <h3>the dish has been changed:)</h3>
        </div>

    </form:form>

</div>
<script src="/itemform.js"></script>
</body>
</html>
