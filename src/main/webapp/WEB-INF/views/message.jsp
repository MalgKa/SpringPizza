<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>message</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/125cf097bb.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/message.css" type="text/css">
</head>
<body class="message">

<div class="d-flex flex-column align-items-center justify-content-center mt-5 message-container">
    <div class="message-box">
        <h1 class="text-center title">${message.title} <i class="fa-regular fa-face-smile"></i></h1>
        <h2 class="text-center title-h2 pt-5 mt-5">${message.content}</h2>
    </div>

    <button class="btn btn-outline-success btn-lg mt-5"><a href="/home" class="text-dark text-decoration-none fw-bold">back to menu</a>
    </button>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous">
</script>
</body>
</html>

