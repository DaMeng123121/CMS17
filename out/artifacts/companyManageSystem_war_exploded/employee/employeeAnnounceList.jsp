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
    </tr>
    </thead>
    <tbody>
    <% for (Announce announce : list) { %>
    <tr>
        <td><%= announce.getId() %></td>
        <td><%= announce.getContent() %></td>
        <td><%=announce.getTime()%></td>
        <td><%=announce.getPublisher()%></td>
    </tr>
    <% } %>
    </tbody>
</table>

<div class="button">
    <button class="button-back" onclick="history.back()">BACK</button>
</div>
</body>
</html>
<script>
    bubbly();
</script>
