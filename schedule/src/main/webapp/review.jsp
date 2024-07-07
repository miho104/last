<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>レビュー</title>
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
        .review {
            border: 1px solid #ccc;
            padding: 20px;
            width: 50%;
            background-color: #e0f7fa;
        }
    </style>
</head>
<body>
    <h1>レビュー</h1>
    <div class="review">
        <%
            int day = Integer.parseInt(request.getParameter("day"));
            int period = Integer.parseInt(request.getParameter("period"));
            String[][] timetable = (String[][]) request.getSession().getAttribute("timetable");
            String[][] reviews = (String[][]) request.getSession().getAttribute("reviews");

            if (timetable == null) {
                timetable = new String[5][6];
            }
            if (reviews == null) {
                reviews = new String[5][6];
            }

            String subject = timetable[day][period];
            String review = reviews[day][period];
        %>
        <h2><%= subject %></h2>
        <form action="Review" method="post"> <!-- action属性を確認 -->
            <input type="hidden" name="day" value="<%= day %>">
            <input type="hidden" name="period" value="<%= period %>">
            <label for="review">レビュー:</label>
            <textarea id="review" name="review" rows="4" cols="50"><%= review != null ? review : "" %></textarea>
            <br>
            <input type="submit" value="保存">
        </form>
    </div>
    <a href="list.jsp">科目一覧に戻る</a>
</body>
</html>