<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2024/7/17
  Time: 19:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.task.vo.Undo" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>待办</title>
    <script>

        function deleteConfirm(){
            var ifDelete = confirm("确定删除吗");
            return ifDelete;
        }
    </script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 20px;
        }
        h1 {
            text-align: center;
            color: #333333;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        table th, table td {
            padding: 10px;
            text-align: center;
            border: 1px solid #dddddd;
        }
        table th {
            background-color: #f2f2f2;
        }
        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        table tr:hover {
            background-color: #f1f1f1;
        }
        .actions {
            text-align: center;
        }
        .actions a {
            margin: 0 5px;
            color: #333333;
            text-decoration: none;
        }
        .actions a:hover {
            color: #1e90ff;
        }
        .button-back {
            position: fixed; /* 让按钮固定在视口 */
            bottom: 40px; /* 距离底部的距离 */
            right: 40px; /* 距离右侧的距离 */
            font-size: 20px; /* 按钮字体大小 */
            background-color: rgba(12, 80, 225, 0.7); /* 蓝色背景，带透明度 */
            padding: 10px 15px; /* 内边距 */
            line-height: 1; /* 行高 */
            border:white; /* 去除边框 */
            color: white; /* 文字颜色为白色 */
            border-radius: 5px; /* 圆角 */
            z-index: 999; /* 确保按钮位于其他内容上方 */
            text-decoration: none;
        }
    </style>
</head>

<body>
<%
    List<Undo> list = (List<Undo>) request.getAttribute("undoList");
%>

<table border="1">
    <thead>
    <tr>
        <th>序号</th>
        <th>职员ID</th>
        <th>是否管理员</th>
        <th>待办内容</th>
        <th>开始时间</th>
        <th>截止时间</th>
    </tr>
    </thead>
    <tbody>
    <% for (Undo u : list) { %>
    <tr>
        <td><%= u.getId() %></td>
        <td><%= u.getEmployeeId() %></td>
        <td><%= u.getIfAdmin() %></td>
        <td><%= u.getTaskContent() %></td>
        <td><%= u.getStartTime() %></td>
        <td><%= u.getEndTime() %></td>
        <td class="actions">
            <a href="DeleteUndoServlet?id=<%= u.getId() %>" onclick="return deleteConfirm()">删除</a>
            <a href="SelectUndoByIdServlet?id=<%= u.getId() %>">修改</a>
            <a href="admin/undoAdd.jsp">增加</a>
        </td>
    </tr>
    <% } %>
    </tbody>
</table>
<div class="button">
    <button><a class="button-back" href="admin/adminIndex.jsp">返回主页</a></button>
</div>
</body>
</html>