<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>科目一覧</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 80vh;
            margin: 0;
            font-family: Arial, sans-serif;
        }
        table {
            border-collapse: collapse;
            width: 50%;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #b3e5fc;
        }
        td {
            background-color: #e0f7fa;
        }
    </style>
</head>
<body>
    <h1>科目一覧</h1>
    <table>
        <tr>
            <th>曜日</th>
            <th>限目</th>
            <th>科目名</th>
            <th>レビュー</th> <!-- 追加 -->
            <th>操作</th> <!-- 追加 -->
        </tr>
        <%
            String[][] timetable = (String[][]) request.getSession().getAttribute("timetable");
            String[][] reviews = (String[][]) request.getSession().getAttribute("reviews");
            if (timetable == null) {
                timetable = new String[5][6];
            }
            if (reviews == null) {
                reviews = new String[5][6];
            }
            String[] days = {"月", "火", "水", "木", "金"};
            for (int i = 0; i < 5; i++) {
                for (int j = 0; j < 6; j++) {
                    if (timetable[i][j] != null && !timetable[i][j].isEmpty()) {
                        out.println("<tr>");
                        out.println("<td>" + days[i] + "</td>");
                        out.println("<td>" + (j + 1) + "限</td>");
                        out.println("<td>" + timetable[i][j] + "</td>");
                        // 追加部分開始
                        String review = reviews[i][j] != null ? reviews[i][j] : "レビューがありません";
                        out.println("<td>" + review + "</td>");
                        out.println("<td><button onclick=\"location.href='review.jsp?day=" + i + "&period=" + j + "'\">レビューを投稿する</button></td>");
                        // 追加部分終了
                        out.println("</tr>");
                    }
                }
            }
        %>
    </table>
    <a href="entry.jsp">時間割に戻る</a>
</body>
</html>