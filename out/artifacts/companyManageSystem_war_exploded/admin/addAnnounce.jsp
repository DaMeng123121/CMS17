<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2024/7/17
  Time: 21:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>添加待办</title>
  <style>
    body {
      background-color: #f0f8ff; /* Alice Blue */
      font-family: Arial, sans-serif;
    }
    .container {
      width: 50%;
      margin: 0 auto;
      padding-top: 50px;
    }
    h1 {
      text-align: center;
      color: #4682b4; /* Steel Blue */
    }
    form {
      text-align: center;
      margin-top: 30px;
    }
    input[type="text"], input[type="submit"] {
      padding: 10px;
      margin: 5px;
      border-radius: 5px;
      border: 1px solid #ccc;
      width: 70%;
      box-sizing: border-box;
    }
    input[type="submit"] {
      background-color: #4682b4; /* Steel Blue */
      color: white;
      cursor: pointer;
    }
    input[type="submit"]:hover {
      background-color: #5f9ea0; /* Cadet Blue */
    }
  </style>
</head>
<body>
<div class="container">
  <h1>新建公告</h1>
  <form action="../AdminAddAnnounceServlet" method="get">
    <%--    <p>ID：<input type="text" name="id"></p>--%>
    <p>公告内容：<input type="text" name="content"></p>

    <p><input type="submit" value="增加"></p>
    <button onclick="history.back()">取消增加</button>
  </form>
</div>
</body>
</html>