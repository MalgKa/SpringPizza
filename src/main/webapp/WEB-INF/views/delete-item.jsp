<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>delete item</title>
    <link rel="stylesheet" href="/css/deleteItem.css">
</head>
<body class="item-to-delete">
<p class="delete-info">delete item</p>
<p>Do you want to remove <span>${item.name}</span> from the menu ?</p>
<form method="post">
    <input type="hidden" name="itemId" value="${item.id}"/>
    <button type="submit" class="btn">Yes</button>
    | <a href="/admin/itemList" class="btn btn-link">No</a>
</form>
</body>
</html>