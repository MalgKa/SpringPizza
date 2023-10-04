<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>item details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Caveat+Brush&family=Caveat:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/itemDetails.css">
</head>
<body class="details-container">
<div class="container justify-content-center d-flex">
    <div class="description mt-auto">
        <h1 class="mb-8">${item.name}</h1>
        <h4>${item.description}</h4>
    </div>
    <div class="mt-auto img">
        <img src=${item.imgUrl}/>
    </div>

</div>

</body>
</html>