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
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    .radial-gradient-demo {
      background-color: rgb(6, 80, 163);
      background-image: radial-gradient(closest-side, rgb(6, 80, 163), rgba(68, 178, 43, 0)), radial-gradient(closest-side, rgb(255, 255, 255), rgba(10, 201, 55, 0)), radial-gradient(closest-side, rgb(64, 145, 14), rgba(254, 234, 131, 0)), radial-gradient(closest-side, rgb(234, 135, 7), rgba(170, 142, 245, 0));
      background-size: 130vw 130vh, 120vw 120vh, 100vw 150vh, 120vw 130vh;
      background-position: -80vw -80vh, 30vw -20vh, -20vw 20vh, 30vw 20vh;
      background-repeat: no-repeat;
      animation: 10s moiveAnimation infinite;
    }

    @keyframes moiveAnimation {
      0%,
      100% {
        background-size: 130vw 130vh, 120vw 120vh, 100vw 150vh, 120vw 130vh;
        background-position: -80vw -80vh, 30vw -20vh, -20vw 20vh, 30vw 20vh;
      }
      25% {
        background-size: 120vw 120vh, 130vw 150vh, 130vw 120vh, 100vw 110vh;
        background-position: -30vw -30vh, 40vw -10vh, 0vw 10vh, -10vw 20vh;
      }
      50% {
        background-size: 130vw 130vh, 140vw 100vh, 100vw 150vh, 90vw 110vh;
        background-position: 10vw -60vh, 20vw 10vh, 10vw 30vh, 10vw -20vh;
      }
      75% {
        background-size: 140vw 140vh, 100vw 130vh, 100vw 150vh, 130vw 110vh;
        background-position: -70vw -70vh, 0vw -10vh, 30vw -20vh, 20vw 30vh;
      }
    }
    .container {
      width: 80%;
      max-width: 600px;
      background-color: #fff;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    }
    h1 {
      text-align: center;
      color: #4682b4; /* Steel Blue */
    }
    form {
      margin-top: 20px;
      display: flex;
      flex-direction: column;
      align-items: center;
    }
    textarea {
      padding: 12px;
      margin: 8px 0;
      border-radius: 5px;
      border: 1px solid #ccc;
      width: 100%;
      box-sizing: border-box;
      font-size: 16px;
    }
    .actions {
      position: absolute; /* 绝对定位相对于父容器 */
      bottom: 10%;
      left: 50%; /* 水平居中 */
      transform: translateX(-50%); /* 水平居中 */
    }
    .actions a {
      margin: 0 5px;
      color: #1e90ff; /* 蓝色按钮 */
      text-decoration: none;
      background-color: #f2f2f2; /* 按钮背景色 */
      padding: 10px 20px;
      border-radius: 5px;
      border: 1px solid #1e90ff; /* 蓝色边框 */
      transition: background-color 0.3s, color 0.3s;
      display: inline-block;
    }
    .actions a:hover {
      background-color: #1e90ff; /* 鼠标悬停时背景色 */
      color: white; /* 鼠标悬停时字体颜色 */
    }
    .actions button {
      margin-left: 10px;
      padding: 10px 20px;
      background-color: #f2f2f2; /* 按钮背景色 */
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s, color 0.3s;
      z-index: 2;        }
    .actions button:hover {
      background-color: #1e90ff; /* 鼠标悬停时背景色 */
      color: white; /* 鼠标悬停时字体颜色 */
      z-index: 2;
    }
  </style>
</head>
<body class="radial-gradient-demo">
<div class="container">
  <h1>新建公告</h1>
  <form action="../AdminAddAnnounceServlet" method="get">
    <p>公告内容：</p>
    <textarea name="content" rows="7" required></textarea>
    <div class="actions">
      <button type="submit" >增加</button>
      <%--        <button onclick="history.back()">返回</button>--%>
      <button type="button" onclick="history.back()">取消</button>
    </div>
<%--    <input type="submit" value="增加">--%>
<%--    <button type="button" onclick="history.back()">取消增加</button>--%>
  </form>
</div>
</body>
</html>
