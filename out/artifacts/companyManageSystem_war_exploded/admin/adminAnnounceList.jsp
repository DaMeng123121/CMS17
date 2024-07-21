<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2024/7/17
  Time: 20:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.task.vo.Announce" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>所有公告</title>
  <script src="https://cdn.jsdelivr.net/npm/bubbly-bg@0.2.3/dist/bubbly-bg.js"></script>
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
      opacity: 70%;
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
    .button-add {
      position: fixed; /* 让按钮固定在视口 */
      bottom: 40px; /* 距离底部的距离 */
      right: 200px; /* 距离右侧的距离 */
      font-size: 20px; /* 按钮字体大小 */
      background-color: rgba(12, 80, 225, 0.7); /* 蓝色背景，带透明度 */
      padding: 10px 15px; /* 内边距 */
      line-height: 1; /* 行高 */
      border:white; /* 去除边框 */
      color: white; /* 文字颜色为白色 */
      border-radius: 5px; /* 圆角 */
      z-index: 999; /* 确保按钮位于其他内容上方 */
    }
    .button-update {
      position: fixed; /* 让按钮固定在视口 */
      bottom: 40px; /* 距离底部的距离 */
      right: 400px; /* 距离右侧的距离 */
      font-size: 20px; /* 按钮字体大小 */
      background-color: rgba(12, 80, 225, 0.7); /* 蓝色背景，带透明度 */
      padding: 10px 15px; /* 内边距 */
      line-height: 1; /* 行高 */
      border:white; /* 去除边框 */
      color: white; /* 文字颜色为白色 */
      border-radius: 5px; /* 圆角 */
      z-index: 999; /* 确保按钮位于其他内容上方 */
    }
  </style>
</head>

<body>
<%
  List<Announce> list = (List<Announce>) request.getAttribute("announceList");
%>

<table border="1">
  <thead>
  <tr>
    <th>ID</th>
    <th>公告内容</th>
    <th>发布时间</th>
    <th>发布者</th>
    <th>操作</th>
  </tr>
  </thead>
  <tbody>
  <% for (Announce announce : list) { %>
  <tr>
    <td><%= announce.getId() %></td>
    <td><%= announce.getContent() %></td>
    <td><%=announce.getTime()%></td>
    <td><%=announce.getPublisher()%></td>
    <td>
      <button><a href="SelectAnnounceByIdServlet?id=<%=announce.getId()%>">修改</a></button>,
      <button><a href="DeleteAnnounceServlet?id=<%=announce.getId()%>">删除</a></button>
    </td>
  </tr>
  <% } %>
  </tbody>
</table>

<div class="button">
  <button class="button-add" onclick="addAnnounce()">增加</button>
<%--  <button class="button-back" onclick="history.back()">返回主页</button>--%>
  <a class="button-back" href="admin/adminIndex.jsp">返回主页</a>
</div>
</body>
</html>
<script>
  function addAnnounce(){
    window.location.href="admin/addAnnounce.jsp";
  }
  function deleteAnnounce(){
    window.location.href="";
  }
  bubbly();
</script>
