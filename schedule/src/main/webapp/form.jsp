<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>科目入力</title>
</head>
<body>
    <h1>科目入力</h1>
    <form action="UpdateTimetableServlet" method="post">
        <input type="hidden" id="day" name="day" value="<%= request.getParameter("day") %>">
        <input type="hidden" id="period" name="period" value="<%= request.getParameter("period") %>">
        <label for="subject">科目名:</label>
        <input type="text" id="subject" name="subject" value="<%= request.getParameter("subject") %>">
        <input type="submit" value="保存">
    </form>
    <a href="entry.jsp">時間割に戻る</a>
</body>
</html>
</body>
</html>