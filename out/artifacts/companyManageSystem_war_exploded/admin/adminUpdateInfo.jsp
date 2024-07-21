<%@ page import="com.task.vo.Admin" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2024/7/17
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Edit Employee</title>
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
    .container {
      width: 80%;
      height: 90%;
      margin: 20px auto;
      background-color: white;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      padding: 20px;
      text-align: center;
    }
    .input-field {
      margin-bottom: 10px;
    }
    .actions {
      text-align: center;
      margin-top: 20px;
    }
    .actions a {
      margin: 0 5px;
      color: #333333;
      text-decoration: none;
    }
    .actions a:hover {
      color: #1e90ff;
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
<%
  Admin E = (Admin) request.getAttribute("admininfo");
//  int all = (int) request.getAttribute("all");

%>

<div class="container">
  <h1>Edit Employee</h1>
  <form action="UpdateAdminServlet" method="get">

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
      <input type="text" name="pwd" value="<%= E.getPassword() %>">
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
    <div class="input-field">
      <label class="l1">等级:</label>
      <input type="text" name="level" value="<%= E.getLevel() %>">
    </div>

    <input type="hidden" name="all" value="0">


    <div class="actions">
      <button type="submit" onclick="submit()">保存修改</button>
      <button class="in1"><a href="javascript:history.back()">取消</a></button>
    </div>
  </form>
</div>
</body>
</html>



