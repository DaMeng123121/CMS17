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
      text-align: center;
    }
    #iframeContainer {
      position: absolute; /* 绝对定位 */
      left: 0; /* 定位在页面左侧 */
      top: 0; /* 定位在页面顶部 */
      width: 270px; /* 设置宽度，可以根据需要调整 */
      height: 100vh; /* 设置高度，充满整个视口 */
      background-color: rgba(255, 255, 255, 0); /* 背景颜色，可选 */
    }

    #myIframe {
      width: 100%; /* 宽度充满父容器 */
      height: 100%; /* 高度充满父容器 */
      border: none; /* 去掉边框 */
    }

    span {
      line-height: 100vh; /* 垂直居中 */
      font-size: 50px;
      color: white;
    }
    .radial-gradient-demo {
      background-color: #170fe8;
      background-image: radial-gradient(closest-side, rgb(12, 201, 234), rgba(6, 199, 234, 0)), radial-gradient(closest-side, rgb(83, 11, 190), rgba(201, 8, 215, 0)), radial-gradient(closest-side, rgb(64, 145, 14), rgba(254, 234, 131, 0)), radial-gradient(closest-side, rgb(234, 135, 7), rgba(170, 142, 245, 0));
      background-size: 130vw 130vh, 120vw 120vh, 100vw 150vh, 120vw 130vh;
      background-position: -80vw -80vh, 30vw -20vh, -20vw 20vh, 30vw 20vh;
      background-repeat: no-repeat;
      animation: 15s moiveAnimation infinite;
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
    h1 {
      text-align: center;
      color: #333333;
    }
    table {
      width: 80%;
      margin: 20px auto;
      border-collapse: collapse;
      background-color: rgba(255, 255, 255, 0.2);
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    table th, table td {
      padding: 10px;
      text-align: center;
      border: 1px solid rgba(221, 221, 221, 0.2);
    }
    table th {
      background-color: rgba(242, 242, 242, 0.2);
    }
    table tr:nth-child(even) {
      background-color: rgba(249, 249, 249, 0.2);
    }
    table tr:hover {
      background-color: rgba(241, 241, 241, 0.2);
    }
    .actions {
      text-align: center;
      margin-bottom: 50px;
    }
    .actions a {
      margin: 0 5px;
      color: rgba(30, 144, 255, 0.2); /* 蓝色按钮 */
      text-decoration: none;
      background-color: rgba(255, 255, 255, 0.5); /* 按钮背景色 */
      padding: 10px 20px;
      border-radius: 5px;
      border: 1px solid rgba(30, 144, 255, 0.2); /* 蓝色边框 */
      transition: background-color 0.3s, color 0.3s;
      display: inline-block;
    }
    .actions a:hover {
      background-color: rgba(30, 144, 255, 0.4); /* 鼠标悬停时背景色 */
      color: rgba(255, 255, 255, 0.4); /* 鼠标悬停时字体颜色 */
    }
    .actions button {
      display: inline-block; /* 或者根据需要调整为 block */
      margin: 10px auto; /* 调整上下外边距，左右自动居中 */
      /*margin-left: 10px;*/
      padding: 10px 20px;
      background-color: rgba(242, 242, 242, 0.4); /* 按钮背景色 */
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s, color 0.3s;
      z-index: 2;        }
    .actions button:hover {
      background-color: rgba(30, 144, 255, 0.3); /* 鼠标悬停时背景色 */
      color: rgba(255, 255, 255, 0.3); /* 鼠标悬停时字体颜色 */
      z-index: 2;
    }


  </style>
</head>


<body class="radial-gradient-demo">
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
      <a href="DeleteUndoServlet?id=<%= u.getId()%>&flag=0" onclick="return deleteConfirm()">完成</a>
    </td>
  </tr>
  <% } %>
  </tbody>
</table>

<div class="actions">
  <button onclick="history.back()">返回</button>
</div>

</body>
</html>
