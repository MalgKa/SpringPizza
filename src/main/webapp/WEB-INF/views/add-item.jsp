<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form:form method="post" modelAttribute="item">
  name:  <form:input path="name"/>
    short description: <form:input path="shortDescription"/>
    description:  <form:textarea path="description"/>
    price: <form:input path="price"/>
    type:  <form:input path="type"/>
    imgUrl: <form:input path="imgUrl"/>
  <button>submit</button>
</form:form>
</body>
</html>
