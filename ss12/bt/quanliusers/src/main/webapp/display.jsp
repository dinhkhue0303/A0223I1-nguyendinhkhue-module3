<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 8/24/2023
  Time: 3:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>quản lí người dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
          crossorigin="anonymous">
    <style>
        .header {
            display: flex;
            justify-content: space-between;
            justify-items: center;
        }
    </style>
</head>
<body>
<div class="main">
    <div class="header">
        <a href="?action=orderByName" class="btn btn-primary" role="button">sắp xếp theo tên</a>
        <form action="/">
            <input type="text" name="findCountry" value="">
            <input type="hidden" name="action" value="findCountry">
            <button class="btn btn-primary">tìm tên quốc gia</button>
        </form>
    </div>
    <div class="content">
        <h1>Danh sách người dùng</h1>
        <a class="btn btn-primary" role="button" href="?action=showCreate">thêm mới</a>
        <table border="1px" class="table table-hover">
            <thead>
            <tr>
                <th>STT</th>
                <th>Tên</th>
                <th>Email</th>
                <th>Quốc gia</th>
                <th>Sửa</th>
                <th>Xóa</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" varStatus="loop" var="users">
                <tr>
                    <td><c:out value="${loop.count}"/> </td>
                    <td><c:out value="${users.name}"/> </td>
                    <td><c:out value="${users.email}"/> </td>
                    <td><c:out value="${users.country}"/> </td>
                    <td>
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal-sua"
                                onclick="sendInfor_Update('${users.id}','${users.name}')">
                            sửa
                        </button>
                    </td>
                    <td>
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"
                                onclick="sendInfor_Delete('${users.id}','${users.name}')">
                            Xóa
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="/?action=delete" method="post">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Xóa học viên</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" id="delete_id" name="delete_id">
                            Bạn có chắc chắn muốn xóa học viên có tên là
                            <span class="text-danger" id="delete_name"></span>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary"
                                    data-bs-dismiss="modal">Hủy</button>
                            <button type="submit" class="btn btn-primary">Xóa</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="modal fade" id="exampleModal-sua" tabindex="-1" aria-labelledby="exampleModalLabel-sua" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="/">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel-sua">Xóa học viên</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" id="update_id" name="update_id">
                            Bạn có chắc chắn muốn sửa học viên có tên là
                            <span class="text-danger" id="update_name"></span>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary"
                                    data-bs-dismiss="modal">Hủy</button>
                            <input type="hidden" name="action" value="showUpdate">
                            <button class="btn btn-primary">Sửa</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
                crossorigin="anonymous"></script>
    </div>

</div>

</body>
<script>
    function sendInfor_Update(id,name){
        document.getElementById("update_id").value = id;
        document.getElementById("update_name").innerText = name;
    }
    function sendInfor_Delete(id,name){
        document.getElementById("delete_id").value = id;
        document.getElementById("delete_name").innerText = name;
    }
</script>
</html>
