<%@ page import="com.task.vo.Employee" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2024/7/16
  Time: 18:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.task.vo.Employee" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Edit Employee</title>
  <style>
    body {
      background-size: cover;
      background-position: center;
      margin: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    h1 {
      text-align: center;
      color: #333333;
    }
    .container {
      width: 80%;
      background-color: rgba(255, 255, 255, 0.2); /* 调整背景颜色透明度 */
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      padding: 20px;
      border-radius: 8px;
      z-index: 999;
      text-align: center; /* 居中对齐 */
    }
    .input-field {
      margin-bottom: 10px;
    }
    .actions {
      text-align: center;
      margin-top: 10px;
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
    .in1 {
      margin-left: 10px;
    }
    .l1 {
      display: inline-block;
      width: 80px;
      text-align-last: justify;
      text-align: justify;
      font-weight: bold;
    }
  </style>
</head>

<body>
<script src="change.js" type="text/javascript"></script>
<%
  Employee E = (Employee) request.getAttribute("employeeinfo");
%>

<div class="container">
  <h1>修改职员信息</h1>
  <form action="UpdateEmployeeServlet" method="get">

    <div class="input-field">
      <label class="l1">ID:</label>
      <input type="text" name="id" value="<%=E.getId()%>" readonly="readonly">
    </div>

    <div class="input-field">
      <label class="l1">姓名:</label>
      <input type="text" name="name" value="<%= E.getName() %>">
    </div>

    <div class="input-field">
      <label class="l1">密码:</label>
      <input type="text" name="password" value="<%= E.getPassword() %>">
    </div>

    <div class="input-field">
      <label class="l1">年龄:</label>
      <input type="text" name="age" value="<%= E.getAge() %>">
    </div>

    <div class="input-field">
      <label class="l1">性别:</label>
      <input type="text" name="sex" value="<%= E.getSex() %>">
    </div>

    <div class="input-field">
      <label class="l1">家庭住址:</label>
      <input type="text" name="address" value="<%= E.getAddress() %>">
    </div>

    <div class="input-field">
      <label class="l1">电话:</label>
      <input type="text" name="tel" value="<%= E.getTel() %>">
    </div>

    <div class="input-field">
      <label class="l1">邮箱:</label>
      <input type="text" name="email" value="<%= E.getEmail() %>">
    </div>

    <div class="input-field">
      <label class="l1">所属部门:</label>
      <input type="text" name="dept" value="<%= E.getDept() %>">
    </div>

    <div class="input-field">
      <label class="l1">职位:</label>
      <input type="text" name="job" value="<%= E.getJob() %>">
    </div>
      <input type="hidden" name="all" value="0">

    <div class="actions">
      <button type="submit" onclick="submit()">保存</button>
      <button onclick="history.back()">返回</button>
    </div>
  </form>
</div>
</body>
</html>


