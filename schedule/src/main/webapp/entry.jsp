<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>時間割</title>
    <style>
    body {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 80vh;
        margin: 0;
        font-family: Arial, sans-serif;
        background-color: <%= session.getAttribute("bgColor") != null ? session.getAttribute("bgColor") : "#ffffff" %>;
    }
    td {
        width: 100px;
        height: 50px;
        text-align: center;
        vertical-align: middle;
    }
    th, td {
        border: 1px solid #ccc;
        padding: 10px;
        text-align: center;
    }
    th {
        background-color: #b3e5fc;
    }
    </style>
</head>
<body>
    <h1>時間割</h1>
    <button onclick="location.href='bg.jsp'">背景色を設定</button>
    <table border="1">
        <tr>
            <th></th>
            <th>月</th>
            <th>火</th>
            <th>水</th>
            <th>木</th>
            <th>金</th>
        </tr>
        <%
            String[][] list = (String[][]) request.getSession().getAttribute("timetable");
            if (list == null) {
                list = new String[5][6];
            }
            for (int j = 0; j < 6; j++) {
                out.println("<tr>");
                out.println("<th>" + (j + 1) + "限</th>");
                for (int i = 0; i < 5; i++) {
                    String cellId = "cell_" + i + "_" + j;
                    String day = Integer.toString(i);
                    String period = Integer.toString(j);
                    String subject = list[i][j] != null ? list[i][j] : "";
                    out.println("<td onclick=\"location.href='form.jsp?day=" + day + "&period=" + period + "&subject=" + subject + "'\" id=\"" + cellId + "\">" + subject + "</td>");
                }
                out.println("</tr>");
            }
        %>
    </table>
    <button onclick="location.href='list.jsp'">科目一覧</button>
</body>
</html>

