<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2024/7/17
  Time: 19:50
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
  </style>
</head>

<body>
<%
  List<Undo> list = (List<Undo>) request.getAttribute("undoList");
%>

<table border="1">
  <thead>
  <tr>
    <th>ID</th>
    <th>待办内容</th>
    <th>开始时间</th>
    <th>截止时间</th>
  </tr>
  </thead>
  <tbody>
  <% for (Undo u : list) { %>
  <tr>
    <td><%= u.getId() %></td>
    <td><%= u.getTaskContent() %></td>
    <td><%= u.getStartTime() %></td>
    <td><%= u.getEndTime() %></td>
    <td class="actions">
      <a href="DeleteUndoServlet?id=<%= u.getId() %>" onclick="return deleteConfirm()">完成</a>
    </td>
  </tr>
  <% } %>
  </tbody>
</table>
<div class="button">
  <button class="button-back" onclick="history.back()">返回</button>
</div>
</body>
</html>
