<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>delete item</title>
</head>
<body>
<h1>delete item</h1>
<p>Do you want to remove ${item.name} from the menu ?</p>
<form method="post">
    <input type="hidden" name="itemId" value="${item.id}"/>
    <button type="submit">Yes</button>
    | <a href="/admin/itemList">No</a>
</form>
</body>
</html>