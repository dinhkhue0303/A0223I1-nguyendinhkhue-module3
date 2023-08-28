<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 8/24/2023
  Time: 3:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Thêm mới người dùng</h1>
<button><a href="/">quay lại</a></button>
<form action="?action=create" method="post">
    tên : <input type="text" name="name"><br>
    email : <input type="text" name="email"><br>
    country : <input type="text" name="country"><br>
    <input type="submit" value="thêm mới">
</form>
</body>
</html>
