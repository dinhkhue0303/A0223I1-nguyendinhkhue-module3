<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 8/23/2023
  Time: 2:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>sửa học viên</h1>
<button><a href="/">Quay lại</a></button>
<form method="post" action="?action=edit">
    id : <h1 name="id"><c:out value="${student.id}"/></h1>
    <input type="hidden" name="id" value="${student.id}">
    Tên: <input type="text" name="name" value="${student.name}"><br>
    Giới tính:
    <c:if test="${student.gender == true}">
        <input type="radio" name="gender" value="male" checked="checked">Nam
        <input type="radio" name="gender" value="female">Nu<br>
    </c:if>
    <c:if test="${student.gender == false}">
        <input type="radio" name="gender" value="male">Nam
        <input type="radio" name="gender" value="female" checked="checked">Nu<br>
    </c:if>
    Điểm: <input type="number" name="point" value="${student.point}"><br>
    <input type="submit" value="sửa">
</form>
</body>
</html>
