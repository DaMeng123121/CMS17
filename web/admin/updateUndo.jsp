<%@ page import="com.task.vo.Undo" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2024/7/17
  Time: 19:52
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
  Undo undo = (Undo) request.getAttribute("undo");
//  int all = (int) request.getAttribute("all");

%>

<div class="container">
  <h1>修改待办</h1>
  <form action="UpdateUndoServlet" method="get">

    <div class="input-field">
      <label class="l1">序号:</label>
      <input type="text" name="id" value="<%=undo.getId()%>" readonly="readonly">
    </div>

    <div class="input-field">
      <label class="l1">职员ID:</label>
      <input type="text" name="employeeid" value="<%= undo.getEmployeeId() %>">
    </div>

    <div class="input-field">
      <label class="l1">是否管理员:</label>
      <input type="text" name="ifadmin" value="<%= undo.getIfAdmin() %>">
    </div>

    <div class="input-field">
      <label class="l1">代办内容:</label>
      <input type="text" name="taskcontent" value="<%= undo.getTaskContent() %>">
    </div>

    <div class="input-field">
      <label class="l1">开始时间:</label>
      <input type="text" name="starttime" value="<%= undo.getStartTime() %>">
    </div>

    <div class="input-field">
      <label class="l1">截止时间:</label>
      <input type="text" name="endtime" value="<%=undo.getEndTime() %>">
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
