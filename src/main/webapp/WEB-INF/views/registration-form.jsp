<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="/css/form.css" type="text/css">
</head>
<body class="form">
<div class="wrapper">
    <form:form method="post" modelAttribute="user">
        <h2>Create account</h2>
        <div class="form-box">
            <label for="firstName">first name: </label>
            <form:input path="firstName" id="firstName" placeholder="your first name"/>
            <form:errors path="firstName"/>
            <p class="error-text">this field cannot be empty</p>
        </div>
        <div class="form-box">
            <label for="firstName">last name: </label>
            <form:input path="lastName" id="lastName" placeholder="your last name"/>
            <form:errors path="lastName"/>
            <p class="error-text">this field cannot be empty</p>
        </div>
        <div class="form-box">
            <label for="firstName">nickname: </label>
            <form:input path="username" id="username" placeholder="enter your nick"/>
            <form:errors path="username"/>
            <p class="error-text">this field cannot be empty</p>
        </div>
        <div class="form-box">
            <label for="password">password: </label>
            <form:input path="password" id="password" placeholder="enter password"/>
            <form:errors path="password"/>
            <p class="error-text">this field cannot be empty</p>
        </div>
        <div class="control-buttons">
            <a href="/home" class="back">back</a>
            <button type="submit" class="save">continue</button>
        </div>
    </form:form>
</div>
<script src="/form.js"></script>
</body>
</html>